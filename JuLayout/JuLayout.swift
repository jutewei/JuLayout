//
//  JuLayout.swift
//  JuLayout
//
//  Created by Juvid on 2016/12/16.
//  Copyright © 2016年 Juvid. All rights reserved.
//

import UIKit




class JuLayout: NSObject {

    var isMinus :Bool = false ///< 只能为
    var juView2 : UIView?
    var juView1 : UIView!
    var juMulti : CGFloat = 1.0

    var juAttr1 : NSLayoutAttribute?
    var juAttr2 : NSLayoutAttribute?

    var juConstant : CGFloat?
    var juRelation : NSLayoutRelation?
    var juPrioritys : UILayoutPriority = UILayoutPriorityRequired
    var juLayoutType :JuLayoutType?


    func multi(_ mulits:CGFloat) -> JuLayout {
        juMulti = mulits
        return self;
    }

    func toView(_ toItem:UIView?) -> JuLayout {
        juView2 = toItem
        return self
    }
    func priority(_ prioritys:Float) -> JuLayout {
        juPrioritys = prioritys
        return self
    }
    func equal(_ constion:CGFloat)  {
        self.setJuConstion(constion)
        juRelation = NSLayoutRelation.equal;
        self.juAddConstraint()
    }
    func greaterEqual(_ constion:CGFloat) {
        self.setJuConstion(constion)
        juRelation = NSLayoutRelation.greaterThanOrEqual;
        self.juAddConstraint()
    }
    func lessEqual(_ constion:CGFloat)  {
         self.setJuConstion(constion)
         juRelation = NSLayoutRelation.lessThanOrEqual;
         self.juAddConstraint()
    }
    func setJuConstion(_ constions:CGFloat) {
        juConstant=constions*(isMinus ? -1 : 1)
    }
    func setJuLayoutType(_ juLayoutTypes :JuLayoutType)  {
        juLayoutType = juLayoutTypes
        if juLayoutType  == JuLayoutType.aspectWH {
            juView2 = juView1
        }
    }
    func juAddConstraint()  {
        if juView1.superview == nil {
            return
        }
        juView1.translatesAutoresizingMaskIntoConstraints = false
        var toItem = juView2
        var ju_View :UIView! = juView1.superview
        let constant = juConstant
        if (juAttr1 == NSLayoutAttribute.width || juAttr1 == NSLayoutAttribute.height ) {
            if toItem == nil {
                if constant == 0 {
                    toItem = juView1.superview
                }else{
                    ju_View = juView1
                }
            }
            else if (toItem?.isEqual(juView1))!{

            }
        }else{
            if toItem == nil {
                toItem = juView1.superview
            }
        }

        let layoutConstraint = NSLayoutConstraint.init(item: juView1, attribute: juAttr1!, relatedBy:juRelation!, toItem: toItem, attribute: juAttr2!, multiplier:juMulti, constant: constant!)
        layoutConstraint.priority = juPrioritys
        ju_View.addConstraint(layoutConstraint);
        layoutConstraint.juLayType=juLayoutType;
        
        juView1.juCompareSameCons(layoutConstraint)
        if juView1.ju_Constraints == nil {
            juView1.ju_Constraints = NSMutableArray.init()
        }
        juView1.ju_Constraints?.add(layoutConstraint)

    }

}
