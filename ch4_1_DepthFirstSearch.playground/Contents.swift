//: Playground - noun: a place where people can play


let n = 3 //取值范围从1～n
//下标 0 的位置没有使用，因此要初始化 n+1 项
var a = [Int](repeatElement(0, count: n+1)) //准备用来放数字的盒子
var book = [Int](repeatElement(0, count: n+1)) //记录已放入的数字

func dfs(step: Int){
    //如果站在 n+1 个盒子前，表示前 n 个盒子已经放好数字
    if step == n+1 {
        //输出一种排列
        for i in 1...n {
            print(a[i], separator: "", terminator: "")
        }
        print("\n")
        return
    }

    //此时站在地 step 个盒子前
    //按照1、2、3……的顺序一一尝试
    for i in 1...n {
//        print("step: \(step), i: \(i)")
        //判断数字是否在手上，book[i]=0表示还未放置
        if book[i] == 0 {
            a[step] = i
            book[i] = 1 //牌打出后设为1，表示牌不在手上了
            
            //走到下一个盒子前，函数递归
            dfs(step: step+1)
            //把刚才尝试的牌收回
            book[i] = 0
        }
    }
}

dfs(step: 1)
