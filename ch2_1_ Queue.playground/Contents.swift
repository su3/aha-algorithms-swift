//: Playground - noun: a place where people can play

struct Queue{
    var data: [Int] //存储队列数据
    var head: Int //开始的时候指向队首
    var tail: Int //tail 标示队尾的下一个位置
}

var queue = Queue(data: [6, 3, 1, 7, 5, 8, 9, 2, 4], head: 0 , tail: 9)

//当队列不为空时执行循环
while queue.head < queue.tail {
//    print("\(queue[head])", term)
    //打印队首并将队首出列
    print("\(queue.data[queue.head])", separator: " ", terminator: " ")
    queue.head += 1
    
    //head 已经移到 tail 位置则中止 （书中的 bug，head 会越界）
    guard queue.head < queue.tail else { break }
    
    //先将新队首的数添加到队尾
    queue.data.append(queue.data[queue.head])
    queue.tail += 1
    
    //新队首出列
    queue.head += 1
}
