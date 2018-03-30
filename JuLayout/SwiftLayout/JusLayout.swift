//
//  JusLayout.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit

class JusLayout: NSObject {

    var isMinus : Bool = false ///< 只能为
    weak var juView2 : UIView?
    weak var juView1 : UIView!
    var juMulti : CGFloat = 1.0

    var juAttr1 : NSLayoutAttribute?
    var juAttr2 : NSLayoutAttribute?

    var juConstant : CGFloat = 0.0
    var juRelation  = NSLayoutRelation.equal
    var juPrioritys  = UILayoutPriorityRequired
    var juLayAttribute :JuLayoutAttribute?{
        didSet{
            if juLayAttribute  == JuLayoutAttribute.aspectWH {
                juView2 = juView1
            }
        }
    }

    func multi(_ mulits:CGFloat) -> JusLayout {
        juMulti = mulits
        return self;
    }

    func toView(_ toItem:UIView?) -> JusLayout {
        juView2 = toItem
        return self
    }
    /// 闭包的写法类似OC JuLayout 和 func toView实现一样的效果
    /*var toView : (UIView) -> JusLayout{
        return {toItem in
            self.juView2 = toItem
            return self
        }
    }*/
    
    func priority(_ prioritys:Float) -> JusLayout {
        juPrioritys = prioritys
        return self
    }
    func equal(_ constion:CGFloat)  {
        juRelation = NSLayoutRelation.equal;
        self.juAddConstraint(constion)
    }
    
    /// 闭包的写法类似OC JuLayout
   /* var equal: (CGFloat) -> Void  {
        return { constion in
            self.juRelation = NSLayoutRelation.equal;
            self.juAddConstraint(constion)
        }
    }*/
    
    func greaterEqual(_ constion:CGFloat) {
        juRelation = NSLayoutRelation.greaterThanOrEqual;
        self.juAddConstraint(constion)
    }
    func lessEqual(_ constion:CGFloat)  {
         juRelation = NSLayoutRelation.lessThanOrEqual;
         self.juAddConstraint(constion)
    }
   
    func juAddConstraint(_ constions:CGFloat)  {
        if juView1.superview == nil {
            return
        }
        juConstant=constions
        juView1.translatesAutoresizingMaskIntoConstraints = false
        var toItem = juView2
        var ju_View :UIView! = juView1.superview
//        let constant = juConstant
        if (juAttr1 == NSLayoutAttribute.width || juAttr1 == NSLayoutAttribute.height ) {
            if toItem == nil {
                if juConstant == 0 {
                    toItem = juView1.superview
                }else{
                    ju_View = juView1
                }
            }
            else if (toItem?.isEqual(juView1) == true){
                ju_View = juView1
            }
        }else{
            if toItem == nil {
                toItem = juView1.superview
            }
        }
        let firstView:UIView! = isMinus ? toItem:juView1
        let secondView:UIView? = isMinus ? juView1:toItem
        let firstAtt = isMinus ? juAttr2:juAttr1
        let secondAtt = isMinus ? juAttr1:juAttr2

        let layoutConstraint = NSLayoutConstraint.init(item: firstView, attribute: firstAtt!, relatedBy:juRelation, toItem: secondView, attribute: secondAtt!, multiplier:juMulti, constant: juConstant)
        layoutConstraint.priority = juPrioritys
        ju_View.addConstraint(layoutConstraint);
        layoutConstraint.jusLayType=juLayAttribute;
        
        juView1.jusCompareSameCons(layoutConstraint)
        if juView1.jus_Constraints == nil {
            juView1.jus_Constraints = NSMutableArray.init()
        }
        juView1.jus_Constraints?.add(layoutConstraint)

    }

}