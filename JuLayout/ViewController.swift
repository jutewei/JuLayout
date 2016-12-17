//
//  ViewController.swift
//  JuLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab222: UILabel!
    var juTest : NSString?{
        didSet
        {
            NSLog("已经改变的时候 %@", juTest!);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lab222.text = "1234567890sdfghjklxcvbnm"
        let lab1 = UILabel.init()
        lab1.backgroundColor = UIColor.red
        lab1.text = "第一个约束居中"
        self.view.addSubview(lab1)
        lab1.juCenterY.equal(0)
        lab1.juCenterX.equal(0)
//horizontalCompressionResistancePriority
        let lab2 = UILabel.init()
        lab2.text = "第二个约束"
        lab2.backgroundColor = UIColor.orange
        self.view.addSubview(lab2)
        lab2.juLead.toView(lab1).equal(0)
        lab2.juTopSpace.toView(lab1).equal(10)
        
        let lab3 = UILabel.init()
        lab3.text = "第三个约束"
        lab3.backgroundColor = UIColor.green
        self.view.addSubview(lab3)
        lab3.juTraSpace.toView(lab1).equal(10)
        lab3.juCenterY.toView(lab1).equal(0)
       
        let vc = ViewController()
        
        juTest = "12345"
        NSLog("%@", self.juTest!)
       

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

