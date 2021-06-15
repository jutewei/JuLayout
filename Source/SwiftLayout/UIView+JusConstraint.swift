//
//  UIView+JuConstraint.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
public enum JuLayoutAttribute : Int {
    case lead       = 0 ///< 左约束
    case trail      = 1 ///< 右约束
    case centerX    = 2///< x中间约束

    case top        = 3   ///< 顶端约束（包括baseLine）
    case bottom     = 4  ///< 底端约束
    case centerY    = 5 ///< y中间约束（包括baseLine）

    case width      = 6   ///< 宽度约束
    case height     = 7  ///< 高度约束
    case aspectWH   = 8  ///< 宽度高度比例约束
}
private var juConstraints: Void?
private var juPriority : Void?
private var ju_LayType :Void?
public extension UIView{
    public  var jus_Constraints: NSMutableArray? {
        get {
            return objc_getAssociatedObject(self, &juConstraints) as? NSMutableArray
        }
        set(newValue) {
            objc_setAssociatedObject(self, &juConstraints, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    public  var jus_Priority : UILayoutPriority?{
        get {
            return objc_getAssociatedObject(self, &juPriority) as? UILayoutPriority
        }
        set(newValue) {
            objc_setAssociatedObject(self, &juPriority, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public func jusCompareSameCons(_ currentCons:NSLayoutConstraint?)  {
        let layoutCons = self.jusConstrain(currentCons?.jusLayType, priority: currentCons?.priority)
        if layoutCons != nil {
            if (self.superview?.constraints.contains(layoutCons!)) == true {
                self.superview?.removeConstraint(layoutCons!)
                self.jus_Constraints?.remove(layoutCons!)
            }else if(self.constraints.contains(layoutCons!) == true){
                self.removeConstraint(layoutCons!)
                self.jus_Constraints?.remove(layoutCons!)
            }
        }
    }
    public func jusConstrain(_ juLayType:JuLayoutAttribute?,priority:UILayoutPriority?) -> NSLayoutConstraint? {
        if ((jus_Constraints?.count) != nil) {
            for constraint in jus_Constraints! {
                let lastCons = constraint as! NSLayoutConstraint
                if (lastCons.jusLayType==juLayType&&lastCons.priority==priority) {
                    return lastCons;
                }
            }
        }

        return nil
    }
    public func jusConstrain(_ juLayType:JuLayoutAttribute?) -> NSLayoutConstraint? {
        if jus_Priority?.rawValue  == 0.00 {
            self.jus_Priority = UILayoutPriority.required;
        }
        let layoutCons = self.jusConstrain(juLayType, priority:jus_Priority)
        self.jus_Priority=UILayoutPriority.required;
        return layoutCons

    }

    public var jus_Lead :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.lead)
    }
    public var jus_Trail :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.trail)
    }
    public var jus_Top :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.top)
    }
    public var jus_Bottom :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.bottom)
    }
    public var jus_CenterX :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.centerX)
    }
    public var jus_CenterY :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.centerY)
    }
    public var jus_Width :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.width)
    }
    public var jus_Height :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.height)
    }
    public var jus_AspectWH :NSLayoutConstraint?{
        return self.jusConstrain(JuLayoutAttribute.aspectWH)
    }
    
    /// 查找优先级（基本不用）
    public var jus_PriHigh : UIView{
        self.jus_Priority=UILayoutPriority.defaultHigh;
        return self;
    }
    public var jus_PriLow : UIView{
        self.jus_Priority=UILayoutPriority.defaultLow;
        return self;
    }
    public var jus_PriLevel : UIView{
        self.jus_Priority=UILayoutPriority.fittingSizeLevel;
        return self;
    }
    public func jus_PriEqual(_ priority:Float) -> UIView {
        self.jus_Priority=UILayoutPriority(rawValue: priority);
        return self;
    }

    
    /// 查找内容优先级
    public var jus_HorConHugPri :UILayoutPriority?{
        return self.contentHuggingPriority(for: NSLayoutConstraint.Axis.horizontal)
    }
    public var jus_VerConHugPri :UILayoutPriority?{
        return self.contentHuggingPriority(for: NSLayoutConstraint.Axis.vertical)
    }
    public var jus_VerConComResPri :UILayoutPriority?{
        return self.contentCompressionResistancePriority(for: NSLayoutConstraint.Axis.vertical)
    }
    public var jus_HorConComResPri :UILayoutPriority?{
        return self.contentCompressionResistancePriority(for: NSLayoutConstraint.Axis.horizontal)
    }
//    var ju_Constraints :NSMutableArray?


}


public extension NSLayoutConstraint{
    public  var jusLayType: JuLayoutAttribute? {
        get {
            return objc_getAssociatedObject(self, &ju_LayType) as? JuLayoutAttribute
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ju_LayType, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
