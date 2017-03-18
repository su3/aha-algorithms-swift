//: Playground - noun: a place where people can play

//注意 x 和 y 轴方向是反习惯的
struct Note{
    var x: Int //纵坐标
    var y: Int //横坐标
    var f: Int //父节点的编号
    var s: Int //步数
}

// 0 = 空地；1 = 障碍物
let maze = [[0, 0, 1, 0],
            [0, 0, 0, 0],
            [0, 0, 1, 0],
            [0, 1, 0, 0],
            [0, 0, 0, 1]]

let n = maze.count //行，纵向为 X 轴
let m = maze[0].count //列，横向为 Y 轴

//坐标的改变表示走动方向
let next = [[0, 1],  //x 不变，y + 1，向右走
    [1, 0],  //y 不变，x + 1，向下走
    [0, -1], //向左走
    [-1, 0]] //向上走

//假设迷宫最大为 50 X 50，初始化记录轨迹的二维数组
var tmp = [Int](repeatElement(0, count: 50))
var book = [[Int]](repeatElement(tmp, count: 50))

//从左上角开始
let startX = 0
let startY = 0

//目标坐标，纵向 x = p，横向 y = q
let p = 3
let q = 2
var min = Int.max

//用来保存走动的路径
var que = [Note]()
var head: Int
var tail: Int

//队列初始化
head = 0
tail = 0

//往队列中插入起点坐标
let note = Note(x: startX, y: startY, f: 0, s: 0)
que.append(note)
tail += 1
book[startX][startY] = 1

//用来标记是否到达目标，0 = 未到达，1 = 到达
var flag = 0

//当队列不为空时循环
while head < tail {
    //枚举 4 个方向走动
    for k in 0...3 {
        //计算下一个坐标
        let tx = que[head].x + next[k][0]
        let ty = que[head].y + next[k][1]
        
        //判断是否越界
        if tx < 0 || tx >= n || ty < 0 || ty >= m {
            continue
        }
        //不是障碍物并且没在走动记录中
        if maze[tx][ty] == 0 && book[tx][ty] == 0 {
            //标记已经走过，每个节点只入队1次，与DFS不同
            book[tx][ty] = 1
            //插入新的点到队列中
            let note = Note(x: tx, y: ty, f: head, s: que[head].s + 1)
            que.append(note)
            tail += 1
        }
        //到达目标，停止拓展路径，退出方向循环
        if tx == p && ty == q {
            flag = 1
            break
        }
    }
    //结束路径查找
    if flag == 1 {
        break
    }
    //每个点遍历完所有可以走动的方向后，head + 1 以便后面继续拓展路径
    head += 1
}

//打印最后一个点的步数
//tail总是指向队尾的下一个位置，因此要 - 1
print("\(que[tail-1].s)")





