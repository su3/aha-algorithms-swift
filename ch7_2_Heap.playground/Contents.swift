//: Playground - noun: a place where people can play

//用一个一维数组存储完全二叉树
var heap = [99, 5, 36, 7, 22, 17, 92, 12, 2, 19, 25, 28, 1, 46]
var count = heap.count

//向上（更小编号）调整，把小的值放到父节点，目标是建立最小堆
func siftup(i: Int){
    var idx = i
    var tmp = 0
    var flag = 0 //是否要继续调整
    
    //当节点至少有左儿子的时候执行循环
    while idx * 2 + 1 < count && flag == 0{
        //判断当前节点与左儿子的大小，tmp 记录较小结点的编号
        if heap[idx] > heap[idx * 2 + 1] {
            tmp = 2 * idx + 1
        }else{
            tmp = idx
        }
        
        //如果有右儿子，那么较小值与右儿子比较
        if idx * 2 + 2 < count {
            if heap[tmp] > heap[idx * 2 + 2] {
                tmp = idx * 2 + 2
            }
        }
        
        //如果当前节点不是最小，那么交换位置
        if tmp != idx {
            swap(&heap[tmp], &heap[idx])
            idx = tmp //idx 与 tmp 交换了，更新 idx 为交换的儿子的编号，以便继续向上调整
        }else{
            //如果父节点比其他两个节点都小，就不需要再调整了
            flag = 1
        }
    }
}

func delete() -> Int{
    let tmp = heap[0] //记录最小值
    heap[0] = heap[count-1] //把最大值放到编号0位置
    count -= 1 //删除了原先 0 位置的值，数量减少了
    siftup(i: 0) //从 0 开始调整
    return tmp //输出最小值
}

//创建堆
func creat(){
    //从最后一个非叶节点开始依次向上（更小编号）调整
    for i in (0..<count/2).reversed() {
        siftup(i: i)
    }
}

creat()

print(heap)

for _ in 0..<count {
    print("\(delete())", separator: "", terminator: " ")
}