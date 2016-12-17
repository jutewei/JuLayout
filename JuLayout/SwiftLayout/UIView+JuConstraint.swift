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
    var ju_Constraints: NSMutableArray? {
        get {
            return objc_getAssociatedObject(self, &juConstraints) as? NSMutableArray
        }
        set(newValue) {
            objc_setAssociatedObject(self, &juConstraints, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var ju_Priority : UILayoutPriority?{
        get {
            return objc_getAssociatedObject(self, &juPriority) as? UILayoutPriority
        }
        set(newValue) {
            objc_setAssociatedObject(self, &juPriority, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func juCompareSameCons(_ currentCons:NSLayoutConstraint?)  {
        let layoutCons = self.juConstrain(currentCons?.juLayType, priority: currentCons?.priority)
        if layoutCons != nil {
            if (self.superview?.constraints.contains(layoutCons!)) == true {
                self.superview?.removeConstraint(layoutCons!)
                self.ju_Constraints?.remove(layoutCons!)
            }else if(self.constraints.contains(layoutCons!) == true){
                self.removeConstraint(layoutCons!)
                self.ju_Constraints?.remove(layoutCons!)
            }
        }
    }
    func juConstrain(_ juLayType:JuSLayoutType?,priority:UILayoutPriority?) -> NSLayoutConstraint? {
        if ((ju_Constraints?.count) != nil) {
            for constraint in ju_Constraints! {
                let lastCons = constraint as! NSLayoutConstraint
                if (lastCons.juLayType==juLayType&&lastCons.priority==priority) {
                    return lastCons;
                }
            }
        }

        return nil
    }
    func juConstrain(_ juLayType:JuSLayoutType?) -> NSLayoutConstraint? {
        if ju_Priority == 0.00 {
            self.ju_Priority = UILayoutPriorityRequired;
        }
        let layoutCons = self.juConstrain(juLayType, priority:ju_Priority)
        self.ju_Priority=UILayoutPriorityRequired;
        return layoutCons

    }

    var ju_Lead :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.lead)
    }
    var ju_Trail :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.trail)
    }
    var ju_Top :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.top)
    }
    var ju_Bottom :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.bottom)
    }
    var ju_CenterX :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.centerX)
    }
    var ju_CenterY :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.centerY)
    }
    var ju_Width :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.width)
    }
    var ju_Height :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.height)
    }
    var ju_AspectWH :NSLayoutConstraint?{
        return self.juConstrain(JuSLayoutType.aspectWH)
    }
    
    /// 查找优先级（基本不用）
    var ju_PriHigh : UIView{
        self.ju_Priority=UILayoutPriorityDefaultHigh;
        return self;
    }
    var ju_PriLow : UIView{
        self.ju_Priority=UILayoutPriorityDefaultLow;
        return self;
    }
    var ju_PriLevel : UIView{
        self.ju_Priority=UILayoutPriorityFittingSizeLevel;
        return self;
    }
    func ju_PriEqual(_ priority:Float) -> UIView {
        self.ju_Priority=priority;
        return self;
    }

    
    /// 查找内容优先级
    var ju_HorConHugPri :UILayoutPriority?{
        return self.contentHuggingPriority(for: UILayoutConstraintAxis.horizontal)
    }
    var ju_VerConHugPri :UILayoutPriority?{
        return self.contentHuggingPriority(for: UILayoutConstraintAxis.vertical)
    }
    var ju_VerConComResPri :UILayoutPriority?{
        return self.contentCompressionResistancePriority(for: UILayoutConstraintAxis.vertical)
    }
    var ju_HorConComResPri :UILayoutPriority?{
        return self.contentCompressionResistancePriority(for: UILayoutConstraintAxis.horizontal)
    }
//    var ju_Constraints :NSMutableArray?


}


extension NSLayoutConstraint{
    var juLayType: JuSLayoutType? {
        get {
            return objc_getAssociatedObject(self, &ju_LayType) as? JuSLayoutType
        }
        set(newValue) {
            objc_setAssociatedObject(self, &ju_LayType, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
