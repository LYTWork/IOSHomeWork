//
//  ViewController.swift
//  实验四4.1沙河文件
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 lyt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()
        let manager = FileManager.default
        let document = manager.urls(for: .documentDirectory, in: .userDomainMask).first?.path
        let file = document?.appending("/images") //图片文件夹
        
        if manager.fileExists(atPath: file!) {
            let image = file?.appending("/bd.png")  //图片文件
            if manager.fileExists(atPath: image!) {  //若该文件存在，则显示到界面上
                do{
                    let data = try Data(contentsOf: URL(fileURLWithPath: image!))
                    let img = UIImage(data: data)
                    let imageView = UIImageView(image: img)
                    imageView.frame = CGRect(x: 0, y: 100, width: 400, height: 300)
                    self.view.addSubview(imageView)
                } catch {
                    print(error)
                }
            } else {  //若不存在，则从网络下载一个图片并保存为图片文件
                let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544860409743&di=69c94b6d5edd918a3cb74bdad8085829&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F17%2F04%2F08%2Fbd85e6e6c3f66e08a121ef683446583b.jpg")
                do{
                    let data = try Data(contentsOf: url!)
                    try data.write(to: URL(fileURLWithPath: image!), options: .atomicWrite)
                    print("文件不存在，已成功创建文件")
                } catch {
                    print(error)
                }
            }
        } else {  //若该文件夹不存在，则创建该文件夹
            do {
                try manager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
                print("文件夹不存在，已成功创建文件夹")
            } catch {
                print(error)
            }
        }
     
    }
    


}

