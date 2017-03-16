//: Playground - noun: a place where people can play

struct Student {
    let name: String
    let score: Int
}

var array: [Student] = [Student(name: "huhu", score: 5),
                        Student(name: "haha", score: 3),
                        Student(name: "xixi", score: 5),
                        Student(name: "hehe", score: 2),
                        Student(name: "momo", score: 8)]

let count = array.count

//N 个对象排序，只需要循环 N-1 遍
for i in 0..<count-1 {
    //循环比较直到最后一个尚未归位的对象
    for j in 0..<count-1-i {
        if array[j].score < array[j+1].score {
            swap(&array[j], &array[j+1])
        }
    }
}

for item in array {
    print("\(item.name): \(item.score)")
}