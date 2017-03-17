//: Playground - noun: a place where people can play

var data = [0] //初始化链表，前置一个空项，不打印此项
var right: [Int] = []

//待操作的数组
data += [2, 3, 5, 8, 9, 10, 18, 26, 32]

//初始化数组的 right
var count = data.count
for i in 0...count  {
    if i != count {
        right.append(i+1)
    }else{
        right.append(0)
    }
}

//直接在数组 data 末尾添加一个数
data.append(6)
count += 1

//从链表头部开始遍历
var t = 1
while t != 0 {
    //如果当前节点的下一个节点大于插入数，将数插到中间
    if data[right[t]] > data[count-1] {
        //新插入数的下一个节点编号等于当前节点的下一个节点编号
        right[count-1] = right[t]
        //当前节点的下一个节点编号等于新插入数的编号（最后一个）
        right[t] = count - 1
        //原数组最后一个节点的下一个节点编号为0（标记着数组结束）书中的 bug，缺了这一步
        right[count-1-1] = 0
        break //完成插入，退出循环
    }
    t = right[t]
}

//遍历输出链表中的所有数
t = 1
while t != 0 {
    print("\(data[t])")
    t = right[t]
}

