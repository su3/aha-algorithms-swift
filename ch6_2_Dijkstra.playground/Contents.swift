//: Playground - noun: a place where people can play

/*
 二维矩阵表示 0～n 个地点之间的路程
 从纵向 0～n 出发到达 横向 0～n
 inf 表示无限远，无法到达
 */
var inf = 99999999
var e = [[0,     1,  12, inf, inf, inf],
         [inf,   0,   9,   3, inf, inf],
         [inf, inf,   0, inf,   5, inf],
         [inf, inf,   4,   0,  13,  15],
         [inf, inf, inf, inf,   0,   4],
         [inf, inf, inf, inf, inf,   0]]

let n = e.count

//初始化 dis，表示地点 0 到其余各个点的估算路程
var dis = e[0]

//以点 u 为起点的边 dis[u]
var u: Int = 0

//初始化 book，存放已知的最短路径集合
var book = [Int](repeatElement(0, count: n))
var min: Int

//源点到本身为 0，标记为已知
book[0] = 1

for i in 0..<n {
    min = inf
    //在所有源点能到达的顶点中找一个离源点最近的点
    for j in 0..<n {
        if book[j] == 0 && dis[j] < min{
            min = dis[j]
            u = j
        }
    }
    
    book[u] = 1
    
    //考察以 u 为起点的边，如果 u 能到达 v，那么源点 s 就能经由 u 到达 v
    //路径长度是 dis[u] + e[u][v]
    //如果这个值比初始化的 dis[v] 小，就用间接到达的距离替换 dis[v] 中的值
    for v in 0..<n {
        if e[u][v] < inf {
            if dis[v] > dis[u] + e[u][v] {
                dis[v] = dis[u] + e[u][v]
            }
        }
    }
    //遍历完所有 e[u][v]，得到最短路径
}

//输出结果
for i in 0..<n {
    print(dis[i], separator: "", terminator: " ")
}