import UIKit

var str = "Hello, playground"
import Foundation

func newLine() {
    print()
}
enum MyError:Error {
    case Zero
    case NotURL
}
let currentDate = Date()
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年MM月dd日 EEEE a HH:mm"
let time = dateFormatter.string(from: currentDate)
print("当前北京时间为：\(dateFormatter.string(from: currentDate))")
let dateAsString = Date()
let timeZH = DateFormatter()
//设置中文时间
timeZH.locale = Locale(identifier: "zh_CN")
timeZH.dateFormat="yyyy年MMMd日EEEE a HH:mm "
//默认为英国伦敦时间
print(timeZH.string(from: dateAsString))
let calendar = Calendar.current
var components = DateComponents()
components.timeZone = TimeZone(abbreviation:"UTC+9")
var dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC+9")
let dateCh = calendar.date(from:dateComponets1)
print(timeZH.string(from: dateCh!))
var dateComponets2 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*9)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC+10")
let dateJp = calendar.date(from:dateComponets2)
print(timeZH.string(from: dateJp!))
//设置时区为，纽约时间
var dateC = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: -3600*5)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC-5")
let dateAm = calendar.date(from:dateC)
print(timeZH.string(from:dateAm!))


print()
let strings = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let indexstar = strings.index(strings.startIndex, offsetBy: 5)
let indexend = strings.index(strings.startIndex, offsetBy: 20)
let sub = strings[indexstar..<indexend]
print("返回字符串从第6个字符到第20个字符的子串:\(sub)")
let sub2 = strings.replacingOccurrences(of: "OS", with: "")
print("删除其中所有的OS字符:\n\(sub2)")

//3.  将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
let dict = ["\(time)":"\(sub2)"] as AnyObject
let fileManager1 = FileManager.default
if var docPath = fileManager1.urls(for: .documentDirectory, in: .userDomainMask).first{
    docPath.appendPathComponent("test.txt")
    dict.write(to: docPath,atomically:true)
}else{
    throw MyError.NotURL
}


//从网上下载一张照片并保存到本地沙盒的Document的某文件中
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
let imageUrl = URL(string: "http://pic28.photophoto.cn/20130818/0020033143720852_b.jpg")!
let imageData = try? Data(contentsOf: imageUrl)
url.appendPathComponent("image.jpg")

//从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析



