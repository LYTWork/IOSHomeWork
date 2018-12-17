

import UIKit

class TRiangleView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x:rect.size.width/2,y:0))
        path.addLine(to: CGPoint(x:rect.size.width,y:rect.size.height))
        path.addLine(to:CGPoint(x: 0, y: rect.size.height))
        path.close()
        
        UIColor.green.setFill()
        path.fill()
    }
}

class Controller:UIViewController{
    var label:UILabel!
    var triangle:TRiangleView!
    @IBAction func clicked(){
        print("i am clicked")
        label?.text = "i am clicked"
        UIView.animate(withDuration: 1){
            self.triangle.center = CGPoint(x: 200, y: 0)
        }
    }
    
    
    override func loadView() {
        
        view = UIView(frame: CGRect(x:0,y:0,width:400,height:50))
        view.backgroundColor = UIColor.red
        
        label = UILabel(frame: CGRect(x:100,y:20,width:200,height:50))
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Hello, World"
        view.addSubview(label)
        
        let url = URL(string: "http://img.zcool.cn/community/01f9ea56e282836ac72531cbe0233b.jpg@2o.jpg")
        
        
        let data = try! Data(contentsOf:url!)
        let image = UIImage(data: data)
        
        let imageView = UIImageView(frame: CGRect(x:0,y:100,width:400,height:400))
        imageView.image = image
        view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x:100,y:650,width:200,height:50))
        button.setTitle("click me!",for: .normal)
        button.addTarget(self,action:#selector(Controller.clicked),for:UIControl.Event.touchDragInside)
        view.addSubview(button)
        
        triangle = TRiangleView(frame: CGRect(x:100,y:400,width:300,height:300))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
    }
   
    PlaygroundPage.current.liveView = ct
}

 let ct = Controller()



