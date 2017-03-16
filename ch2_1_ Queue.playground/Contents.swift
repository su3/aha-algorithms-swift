//: Playground - noun: a place where people can play

var queue = [6, 3, 1, 7, 5, 8, 9, 2, 4]
var head = 0    //开始的时候指向队首
var tail = queue.count    //tail 标示队尾的下一个位置

//当队列不为空时执行循环
while head < tail {
//    print("\(queue[head])", term)
    //打印队首并将队首出列
    print("\(queue[head])", separator: " ", terminator: " ")
    head += 1
    
    //head 已经移到 tail 位置则中止
    if head >= tail {
        break
    }
    
    //先将新队首的数添加到队尾
    queue.append(queue[head])
    tail += 1
    
    //新队首出列
    head += 1
}
