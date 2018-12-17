import UIKit
//（1）    给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组;
let directionary = [["name":"张三","age":"10"],["name":"李四","age":"18"],["name":"王二狗","age":"22"],["name":"大傻子","age":"44"]]
let ages = directionary.map{
    $0["age"] ?? ""}.filter { $0 != ""
}
print("ages数组为：",ages)


//（2）    给定一个String数组，用filter函数选出能被转成Int的字符串
let strArray = ["2","11","x","lly","z","234","7"]
let Numbers = strArray.filter{ Int($0) != nil }
print("\(Numbers)")
//（3）    用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
let array = ["oj","3","t424","lyt"]
let connectArray = array.reduce("") {connectArray,  letter in "\(connectArray),\(letter)"}
print("输出：\(connectArray)")

//（4）    用 reduce 方法一次求出整数数组的最大值、最小值、总数和
var statisticsArray=[1,2,5,11,23,14,6]
let temp = statisticsArray.reduce((max:Int.min,min:Int.max,sum:0)){ (temp,i) in return(max(temp.max,i),min(temp.min,i),temp.sum+i)}
print("max:\(temp.max)")
print("min:\(temp.min)")
print("sum为:\(temp.sum)")

//（5）    新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；

//（6）    扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
extension Int {
    func sqrt (num:Int) ->Double {
        return Darwin.sqrt(Double(num))
    }
}
print (sqrt(81))

//（7）    实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
func search<T:Comparable>(num:[T]) -> (max:T,min:T) {
    var max = num[0]
    var min = num[0]
    for i in num {
        if max < i {
            max=i
        }
        else if min > i{
            min=i
        }
        
    }
    return (max,min)
}
let tempInt = search(num:[84,10,2,34,23,5,32])
print("整数时最大值为：\(tempInt.max) 最小值为：\(tempInt.min)")
let tempFloat = search(num:[9.6,2.0,2.1,3.4,7.0])
print("浮点数时最大值为：\(tempFloat.max) 最小值为：\(tempFloat.min)")
let tempString = search(num:["A","Y","Z","D"])
print("字符串时：最大为:\(tempString.max) 最小为:\(tempString.min)")



