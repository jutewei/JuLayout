//
//  UIView+JuConstraint.swift
//  JuSLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
public enum JuSLayoutType : Int {
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
extension UIView{
    var jus_Constraints: NSMutableArray? {
        get {
            return objc_getAssociatedObject(self, &juConstraints) as? NSMutableArray
        }
        set(newValue) {
            objc_setAssociatedObject(self, &juConstraints, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var jus_Priority : UILayoutPriority?{
        get {
            return objc_getAssociatedObject(self, &juPriority) as? UILayoutPriority
        }
        set(newValue) {
            objc_setAssociatedObject(self, &juPriority, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func jusCompareSameCons(_ currentCons:NSLayoutConstraint?)  {
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
    func jusConstrain(_ juLayType:JuSLayoutType?,priority:UILayoutPriority?) -> NSLayoutConstraint? {
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
    func jusConstrain(_ juLayType:JuSLayoutType?) -> NSLayoutConstraint? {
        if jus_Priority == 0.00 {
            self.jus_Priority = UILayoutPriorityRequired;
        }
        let layoutCons = self.jusConstrain(juLayType, priority:jus_Priority)
        self.jus_Priority=UILayoutPriorityRequired;
        return layoutCons

    }

    var jus_Lead :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.lead)
    }
    var jus_Trail :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.trail)
    }
    var jus_Top :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.top)
    }
    var jus_Bottom :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.bottom)
    }
    var jus_CenterX :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.centerX)
    }
    var jus_CenterY :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.centerY)
    }
    var jus_Width :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.width)
    }
    var jus_Height :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.height)
    }
    var jus_AspectWH :NSLayoutConstraint?{
        return self.jusConstrain(JuSLayoutType.aspectWH)
    }
    
    /// 查找优先级（基本不用）
    var jus_PriHigh : UIView{
        self.jus_Priority=UILayoutPriorityDefaultHigh;
        return self;
    }
    var jus_PriLow : UIView{
        self.jus_Priority=UILayoutPriorityDefaultLow;
        return self;
    }
    var jus_PriLevel : UIView{
        self.jus_Priority=UILayoutPriorityFittingSizeLevel;
        return self;
    }
    func jus_PriEqual(_ priority:Float) -> UIView {
        self.jus_Priority=priority;
        return self;
    }

    
    /// 查找内容优先级
    var jus_HorConHugPri :UILayoutPriority?{
        return self.contentHuggingPriority(for: UILayoutConstraintAxis.horizontal)
    }
    var jus_VerConHugPri :UILayoutPriority?{
        return self.contentHuggingPriority(for: UILayoutConstraintAxis.vertical)
    }
    var jus_VerConComResPri :UILayoutPriority?{
        return self.contentCompressionResistancePriority(for: UILayoutConstraintAxis.vertical)
    }
    var jus_HorConComResPri :UILayoutPriority?{
        return self.contentCompressionResistancePriority(for: UILayoutConstraintAxis.horizontal)
    }
//    var ju_Constraints :NSMutableArray?


}


extension NSLayoutConstraint{
    var jusLayType: JuSLayoutType? {
        get {
            return objc_getAssociatedObject(self, &ju_LayType) as? JuSLayoutType
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ju_LayType, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
