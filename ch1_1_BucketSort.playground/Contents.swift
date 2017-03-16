//: Playground - noun: a place where people can play


let bucketCount = 1000 //桶的个数
let numbers = [8, 100, 22, 15, 6, 1, 1000, 8] //待排序的数组
var book: [Int: Int] = [:]

//初始化桶
for i in 1...bucketCount {
    book[i] = 0
}

//遍历数组
for item in numbers {
    let count = book[item]!
    book[item] = count + 1 //计数，放入编号为 item 的桶
}

//依次判断所有桶
for i in (1...bucketCount).reversed(){
    let count = book[i]!
    if count == 0 {
        continue
    }
//出现几次就将桶的编号打印几次
    for j in 1...count {
        print("\(i)")
    }
}




