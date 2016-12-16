//
//  ViewController.swift
//  JuLayout
//
//  Created by Juvid on 2016/12/16.
//  Copyright © 2016年 Juvid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UILabel.init()
        view1.backgroundColor = UIColor.red
        view1.text = "fsafdsfdsfdf"
        self.view.addSubview(view1)
        view1.juLead.equal(0)
        view1.juTop.equal(0)
        view1.juWidth.equal(200)
        view1.juHeight.equal(100)
        view1.juLead.equal(20)

        var arrar = ["123","234"]
        if arrar.contains("123") {
            NSLog("包含")
        }
        if arrar.contains("345") {
            NSLog("不包含")
        }

        NSLog("%@", view1.ju_Constraints ?? "空数组")
        NSLog("%@",  view1.ju_Bottom ?? "空属性")
         NSLog("%@",  view1.ju_Lead ?? "空属性")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

