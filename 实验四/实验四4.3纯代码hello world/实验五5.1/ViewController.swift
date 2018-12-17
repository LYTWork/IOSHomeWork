//
//  ViewController.swift
//  实验五5.1
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 lyt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 44))
        label.text = "hello World"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        self.view.addSubview(label)
        
        btn = UIButton(frame: CGRect(x: 150, y: 400, width: 50, height: 37))
        btn.setTitle("Click", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.setTitleColor(UIColor.black, for: .highlighted)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(cilcked), for: .touchUpInside)
    }
    
    @IBAction func cilcked() {
        if label.text! == "Clicked" {
            label.text = "hello Swift"
            btn.setTitle("Click", for: .normal)
        } else {
            label.text = "Clicked"
            btn.setTitle("hello", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 


}

