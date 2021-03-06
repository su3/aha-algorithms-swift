//: Playground - noun: a place where people can play

// # = 墙；G = 敌人；. = 空地
let map = [["#","#","#","#","#","#","#","#","#","#","#","#","#"],
           ["#","G","G",".","G","G","G","#","G","G","G",".","#"],
           ["#","#","#",".","#","G","#","G","#","G","#","G","#"],
           ["#",".",".",".",".",".",".",".","#",".",".","G","#"],
           ["#","G","#",".","#","#","#",".","#","G","#","G","#"],
           ["#","G","G",".","G","G","G",".","#",".","G","G","#"],
           ["#","G","#",".","#","G","#",".","#",".","#","#","#"],
           ["#","#","G",".",".",".","G",".",".",".",".",".","#"],
           ["#","G","#",".","#","G","#","#","#",".","#","G","#"],
           ["#",".",".",".","G","#","G","G","G",".","G","G","#"],
           ["#","G","#",".","#","G","#","G","#",".","#","G","#"],
           ["#","G","G",".","G","G","G","#","G",".","G","G","#"],
           ["#","#","#","#","#","#","#","#","#","#","#","#","#"]]


let n = map.count //列
let m = map[0].count //行
var sum = 0
var max = 0
var x: Int
var y: Int
var p: Int = 0
var q: Int = 0

//两重循环枚举地图中的每个点
for i in 0..<n {
    for j in 0..<m {
        
        //是平地才可以放置 bomb
        if map[i][j] == "." {
            sum = 0
            
            //向上统计可以消灭的敌人数
            x = i; y = j
            while map[x][y] != "#" {
                if map[x][y] == "G" {
                    sum += 1
                }
                x -= 1
            }
            
            //向下统计可以消灭的敌人数
            x = i; y = j
            while map[x][y] != "#" {
                if map[x][y] == "G" {
                    sum += 1
                }
                x += 1
            }
            
            //向左统计可以消灭的敌人数
            x = i; y = j
            while map[x][y] != "#" {
                if map[x][y] == "G" {
                    sum += 1
                }
                y -= 1
            }
            
            //向右统计可以消灭的敌人数
            x = i; y = j
            while map[x][y] != "#" {
                if map[x][y] == "G" {
                    sum += 1
                }
                y += 1
            }
            
            //更新最大值
            if sum > max {
                max = sum
                p = i; q = j
            }
        }
    }
}

print("将 bomb 放置在(\(p),\(q)), 最多可以消灭\(sum)个敌人")