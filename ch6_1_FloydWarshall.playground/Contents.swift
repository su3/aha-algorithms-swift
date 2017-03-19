//: Playground - noun: a place where people can play


/*: 二维矩阵表示地点之间的关系
 
 * 纵向表示出发点 1～n
 * 横向表示到达点 1～n
 * 坐标系 e[0][1] 表示从 1 到 2 的距离为 2，索引值先读 纵向 后读 横向
 * inf 表示无限大，表示两个点之间没有直接的边（路线）到达
 
*/
 
var inf = 99999999
var e = [[0,     2,  6,   4],
         [inf,   0,  3, inf],
         [7,   inf,  0,   1],
         [5,   inf, 12,   0]]
let n = e.count

//从 1～n 一一计算以该路线作为中转站时的最短距离
//直接到达的距离是 e[i][j]，通过地点1到达的距离是 e[i][0] + e[0][j]
//矩阵纵向和横向两次遍历，加上有n条路线就要进行n次遍历，总共 n * n * n 次循环
for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if e[i][j] > e[i][k] + e[k][j] {
                e[i][j] = e[i][k] + e[k][j]
            }
        }
    }
}

//输出结果
for i in 0..<n {
    for j in 0..<n {
        print("\(e[i][j])", separator: "", terminator: "  ")
    }
    print("\n")
}

