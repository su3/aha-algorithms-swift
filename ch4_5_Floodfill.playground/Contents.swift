//: Playground - noun: a place where people can play

// 0 = 海洋；1～9 = 陆地
var a =    [[1, 2, 1, 0, 0, 0, 0, 0, 2, 3],
            [3, 0, 2, 0, 1, 2, 1, 0, 1, 2],
            [4, 0, 1, 0, 1, 2, 3, 2, 0, 1],
            [3, 2, 0, 0, 0, 1, 2, 4, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 5, 3, 0],
            [0, 1, 2, 1, 0, 1, 5, 4, 3, 0],
            [0, 1, 2, 3, 1, 3, 6, 2, 1, 0],
            [0, 0, 3, 4, 8, 9, 7, 5, 0, 0],
            [0, 0, 0, 3, 7, 8, 6, 0, 1, 2],
            [0, 0, 0, 0, 0, 0, 0, 0, 1, 0]]

let n = a.count //行，纵向为 X 轴
let m = a[0].count //列，横向为 Y 轴

//坐标的改变表示探索方向
let next = [[0, 1],  //x 不变，y + 1，向右走
    [1, 0],  //y 不变，x + 1，向下走
    [0, -1], //向左走
    [-1, 0]] //向上走

//假设地图面积不超过 50 X 50，初始化一个二维数组用于保存走过的地方
var tmp = [Int](repeatElement(0, count: 50))
var book = [[Int]](repeatElement(tmp, count: 50))

func dfs(x: Int, y: Int, color: Int){
    a[x][y] = color

    for k in 0...3 {
        let tx = x + next[k][0]
        let ty = y + next[k][1]
        
        if tx < 0 || tx >= n || ty < 0 || ty >= m{
            continue
        }
        
        //判断是否陆地并且还未标记过
        if a[tx][ty] > 0 && book[tx][ty] == 0{
            book[tx][ty] = 1 //标记已走过这个点
            dfs(x: tx, y: ty, color: color) //尝试下一个点
        }
    }
}

var sum = 0
var color = 0

for i in 0..<n {
    for j in 0..<m {
        if a[i][j] > 0 {
            sum += 1
            color -= 1 //每个岛用不同的颜色编号
            book[i][j] = 1
            dfs(x: i, y: j, color: color)
        }
    }
}

//输出着色后的地图
for i in 0..<n {
    for j in 0..<m {
        let c = a[i][j]
        let s = (c == 0) ? " \(a[i][j])" : "\(a[i][j])"
        print(s, separator: "", terminator: " ")
    }
    print("\n")
}

//输出小岛个数
print("有 \(sum) 个小岛")