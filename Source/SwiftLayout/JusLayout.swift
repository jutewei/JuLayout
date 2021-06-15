//
//  JusLayout.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit

public class JusLayout: NSObject {

    var isMinus : Bool = false ///< 是否相反数
    var isSafe : Bool = false ///< 是否使用安全适配
    weak var juView2 : UIView?
    weak var juView1 : UIView!
    var juMulti : CGFloat = 1.0

    var juAttr1 : NSLayoutConstraint.Attribute?
    var juAttr2 : NSLayoutConstraint.Attribute?

    var juConstant : CGFloat = 0.0
    var juRelation  = NSLayoutConstraint.Relation.equal
    var juPrioritys  = UILayoutPriority.required
    var juLayAttribute :JuLayoutAttribute?{
        didSet{
            if juLayAttribute  == JuLayoutAttribute.aspectWH {
                juView2 = juView1
            }
        }
    }

    public func multi(_ mulits:CGFloat) -> JusLayout {
        juMulti = mulits
        return self;
    }
    public var safe: JusLayout {
        isSafe = true
        return self;
    }

    public func toView(_ toItem:UIView?) -> JusLayout {
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
    
    public func priority(_ prioritys:Float) -> JusLayout {
        juPrioritys = UILayoutPriority(rawValue: prioritys)
        return self
    }
    public func equal(_ constion:CGFloat)  {
        juRelation = NSLayoutConstraint.Relation.equal;
        self.juAddConstraint(constion)
    }
    
    /// 闭包的写法类似OC JuLayout
   /* var equal: (CGFloat) -> Void  {
        return { constion in
            self.juRelation = NSLayoutRelation.equal;
            self.juAddConstraint(constion)
        }
    }*/
    
    public func greaterEqual(_ constion:CGFloat) {
        juRelation = NSLayoutConstraint.Relation.greaterThanOrEqual;
        self.juAddConstraint(constion)
    }
    public func lessEqual(_ constion:CGFloat)  {
        juRelation = NSLayoutConstraint.Relation.lessThanOrEqual;
         self.juAddConstraint(constion)
    }
   
    public func juAddConstraint(_ constions:CGFloat)  {
        if juView1.superview == nil {
            return
        }
        juConstant=constions
        juView1.translatesAutoresizingMaskIntoConstraints = false
        var toView = juView2
        var ju_View :UIView! = juView1.superview
//        let constant = juConstant
        if (juAttr1 == NSLayoutConstraint.Attribute.width || juAttr1 == NSLayoutConstraint.Attribute.height ) {
            if toView == nil {
                if juConstant == 0 {
                    toView = juView1.superview
                }else{
                    ju_View = juView1
                }
            }
            else if (toView?.isEqual(juView1) == true){
                ju_View = juView1
            }
        }else{
            if toView == nil {
                toView = juView1.superview
            }
        }
        var toItem :Any! = toView
        if(isSafe){
            if #available(iOS 11.0, *) {
                toItem = juView1.superview?.safeAreaLayoutGuide
            }
        }
        
        let firstView:Any! = isMinus ? toItem:juView1
        let secondView:Any? = isMinus ? juView1:toItem
        let firstAtt = isMinus ? juAttr2:juAttr1
        let secondAtt = isMinus ? juAttr1:juAttr2

        let layoutConstraint = NSLayoutConstraint.init(item: firstView ?? UIView.init(), attribute: firstAtt!, relatedBy:juRelation, toItem: secondView, attribute: secondAtt!, multiplier:juMulti, constant: juConstant)
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
