//: Playground - noun: a place where people can play

var stk = ""
let str = "xybyx"
let len = str.characters.count
let mid = len / 2 - 1 //字符串中点索引值

var next: Int

var top = 0 //栈的初始化，0表示栈中为空

//将 mid 前的字符依次入栈
for i in 0...mid {
    let c = str[str.index(str.startIndex, offsetBy: i)]
    stk = stk + String(c)
    top += 1 //每添加一个字符串 top + 1
}
print("\(stk)")

//判断字符串长度是奇数还是偶数，找出mid之后进行匹配的起始索引值
next = (len % 2 == 0) ? mid + 1 : mid + 2

//依次出栈，逐一对比 mid 后的字符
for i in next...(len - 1) {
    let s = stk[stk.index(stk.startIndex, offsetBy: top-1)]
    let a = str[str.index(str.startIndex, offsetBy: i)]
    print("s:\(s), a:\(a)")
    if s != a {
        break
    }
    top -= 1
}

//如果 top 为 0 说明栈内所有字符都被一一匹配了
print("\(top==0)")