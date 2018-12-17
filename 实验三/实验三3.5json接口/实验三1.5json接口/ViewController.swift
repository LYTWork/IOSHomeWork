//
//  ViewController.swift
//  实验三1.5json接口
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 lyt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func loadWeatherInfo(_ sender: Any) {
        WeatherInfo()
    }
    @IBOutlet weak var showWeatherInfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
     func WeatherInfo(){
        
                      //访问网络
        
                        let url = NSURL(string:"http://www.weather.com.cn/adat/sk/101110101.html")
        
                      let jsonData=NSData(contentsOf: url! as URL)
            
                            
            
                    //方法1 使用NSJSONSerialization解析
            
                    do {
            
                                        let json=try JSONSerialization.jsonObject(with: jsonData! as Data, options:[]) as! [String:AnyObject]
            
                        let weatherInf=json["weatherinfo"] as! NSDictionary
            
                        let city=weatherInf["city"]!
            
                        let temp=weatherInf["temp"]!
            
                        showWeatherInfo.text="城市:\(city)\n温度:\(temp)\n "
            
                    }catch let error as NSError{
            
                        print("解析出错。\(error.localizedDescription)")
            
                    }


}
}
