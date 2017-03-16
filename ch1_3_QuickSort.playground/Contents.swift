//: Playground - noun: a place where people can play

var array = [3, 1, 2, 5, 4, 6, 9, 7, 10, 8]

func quicksort( left: Int, right: Int){
    var i: Int, j: Int, temp: Int
    
    if left > right {
        return
    }
    
    temp = array[left] //temp 存基准数
    i = left
    j = right
    
    //两边向中间查找，与基准数相比较，直到i和j相遇
    while i != j {
        //先从右往左找小于基准数的数
        while array[j] >= temp && i < j {
            j -= 1
        }
        
        //再从左往右找大于基准数的数
        while array[i] <= temp && i < j {
            i += 1
        }
        
        //找到后如果没有相遇，那么交换位置
        if i < j {
            swap(&array[i], &array[j])
        }
    }
    
    //当 i 和 j 相遇时，将基准数与当前位置的值交换位置，基准数归位
    array[left] = array[i]
    array[i] = temp
    
    //接着用同样的方法给基准数左边与右边两个序列分别排序
    quicksort(left: left, right: i-1) //继续处理左边，递归过程
    quicksort(left: i+1, right: right) //继续处理右边，递归过程
    
}

quicksort(left: 0, right: array.count-1)

for item in array {
    print("\(item)")
}

