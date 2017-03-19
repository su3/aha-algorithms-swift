//: Playground - noun: a place where people can play

//从顶点 u[i] 到 v[i] 的权值是 w[i]
let u = [1, 0, 0, 3, 2]
let v = [2, 1, 4, 4, 3]
let w = [2, -3, 5, 2, 3]

let n = 5 //顶点数量
let m = 5 //边的数量

var inf = 99999999
//初始化 dis，表示 0 点到其他顶点的距离
var dis = [inf, inf, inf, inf, inf]

//自己到自己距离为 0
dis[0] = 0

//标记 dis 是否发生改变
var check = 0

//进行 n-1 轮“松弛”
for k in 0..<n-1 {
    check = 0
    for i in 0..<m { //枚举每一条边
        //尝试对每一条边松弛
        //源点到 v[i] 的距离与中转到达的权值比较大小
        //从 u[i] 到 v[i]，也就是权值 w[i]
        //源点先到 u[i] 然后再到 v[i] = dis[u[i]] + w[i]
        if dis[v[i]] > dis[u[i]] + w[i] {
            dis[v[i]] = dis[u[i]] + w[i]
            check = 1 //数组 dis 发生变化
        }
    }
    
    //dis没变化则跳出循环
    if check == 0 {
        break
    }
}

//输出结果
for item in dis {
    print("\(item)", separator: "", terminator: "  ")
}