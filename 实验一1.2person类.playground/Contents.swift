import UIKit

/*实现person类*/
enum Gender{
    case male
    case female
}
class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+" "+lastName
        }
    }
    /*构造函数*/
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName=firstName
        self.lastName=lastName
        self.age = age
        self.gender = gender
    }
    /*便利构造函数*/
    convenience init(name:String){
        self.init (firstName:name,lastName:" ",age:18,gender:Gender.female)
    }
    var description:String{
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    static func == (person1:Person,person2:Person) -> Bool {
        return person1.fullName==person2.fullName
    }
    static func != (person1:Person,person2:Person) -> Bool {
        return !(person1.fullName==person2.fullName)
    }
    func show(){
        print("输出实例Person\(self.fullName)")
    }
    
}



/*派生student*/
class Student:Person{
    var stuNo:Int
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:Int){
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
        
    }
    convenience init(name:String){
        self.init (firstName:name,lastName:" ",age:18,gender:Gender.female,stuNo:001)
    }
    override var description:String{
        return super.description + " 学号:\(stuNo)"
    }
}


/*派生teacher*/
class Teacher:Person {
    var title:String
    /*构造函数*/
    init(title:String,firstName:String,lastName:String,age:Int,gender:Gender){
        self.title=title
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    /*便利构造函数*/
    convenience init(name:String){
        self.init (title:"hello",firstName:name,lastName:" ",age:18,gender:Gender.female)
    }
    override var description:String{
        return "标题：\(title) \(super.description)"
    }
}

/*构造对象*/
let p1 = Person(firstName:"person",lastName:"1",age:20,gender:Gender.female)
let p2 = Person(name:"person2")
let s1 = Student(firstName:"studen",lastName:"1",age:15,gender:Gender.female,stuNo:111)
let s2 = Student(name:"student2")
let t1 = Teacher(title:"hello everybody!",firstName:"teacher",lastName:"1",age:42,gender:Gender.male)
let t2 = Teacher(name:"teacher2")

print(p1.description)
print(p2.description)
print(s1.description)
print(t1.description)
var ArrayPerson = [p1,p2,s1,s2,t1,t2]

/*字典统计*/
var dictionary = ["Person":0,"Teacher":0,"Student":0]
print(dictionary)
for i in  ArrayPerson{
    if i is Student {
        dictionary["Student"]! += 1
    }else if  i is Teacher {
        dictionary["Teacher"]! += 1
    }else{
        dictionary["Person"]! += 1
    }
    
}
print("字典：")
for (key,value) in dictionary{
    print("\(key):\(value)")
}


/*排序*/
ArrayPerson.sort(by:{
    return $0.age < $1.age
})
print("age排序")
for y in ArrayPerson{
    print (y.description)
}
print("fullName排序排序")
ArrayPerson.sort(by:{
    return $0.fullName < $1.fullName
})
for y in ArrayPerson{
    print (y.description)
}
