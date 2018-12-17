import UIKit

func searchPrimNum() -> [Int]{
    var changeArray  = [2,3]
    var isPreimNum = true//判断是否是质数的标志，是就是true
    for x in 4...10000{
        for y in 2..<x{
            if x%y == 0{
                isPreimNum = false
                break
            }
        }
        if isPreimNum {//是质数
            changeArray.append(x)
        }
        isPreimNum = true
    }
    return changeArray
}
var primNum = searchPrimNum()
primNum.sort()
print("数组升序排列为：")
print(primNum)

func compare(m:Int,n:Int) -> Bool {
    return m>n
}
primNum.sort(by:compare)
print("第1种：")
print(primNum)

primNum.sort(by:{
    (m:Int,n:Int) -> Bool in
    return m>n
})
print("第2种：")
print(primNum)

primNum.sort(by:{
    (m,n) -> Bool in
    return m>n
})
print("第3种：")
print(primNum)

primNum.sort(by:>)
print("第4种：")
print(primNum)

primNum.sort{$0>$1}
print("第5种：")
print(primNum)

