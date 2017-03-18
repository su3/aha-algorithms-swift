//: Playground - noun: a place where people can play

// 0 = 空地；1 = 障碍物
let maze = [[0, 0, 1, 0],
            [0, 0, 0, 0],
            [0, 0, 1, 0],
            [0, 1, 0, 0],
            [0, 0, 0, 1]]

let n = maze.count //行，纵向为 X 轴
let m = maze[0].count //列，横向为 Y 轴

//从左上角开始
let startX = 0
let startY = 0

//目标坐标，纵向 x = p，横向 y = q
let p = 3
let q = 2
var min = Int.max

//坐标的改变表示走动方向
let next = [[0, 1],  //x 不变，y + 1，向右走
            [1, 0],  //y 不变，x + 1，向下走
            [0, -1], //向左走
            [-1, 0]] //向上走

//假设迷宫最大为 50 X 50，初始化记录轨迹的二维数组
var tmp = [Int](repeatElement(0, count: 50))
var book = [[Int]](repeatElement(tmp, count: 50))


func dfs(x: Int, y: Int, step: Int){
    
    //判断是否到达目标位置
    if x == p && y == q {
        if step < min  {
            min = step
        }
        return
    }
    
    //枚举 4 个方向走动
    for k in 0...3 {
        //计算下一个坐标
        let tx = x + next[k][0]
        let ty = y + next[k][1]
        
        //判断是否越界
        if tx < 0 || tx >= n || ty < 0 || ty >= m {
            continue
        }
        //不是障碍物并且没在走动记录中
        if maze[tx][ty] == 0 && book[tx][ty] == 0 {
            book[tx][ty] = 1 //标记已经走过
            dfs(x: tx, y: ty, step: step + 1) //尝试下一步
            book[tx][ty] = 0 //尝试结束，取消这个点的记录
        }
    }
}

//标记起点已经走过
book[startX][startY] = 1

//初始步数为 0
dfs(x: startX, y: startY, step: 0)

//输出最短步数
print("\(min)")
