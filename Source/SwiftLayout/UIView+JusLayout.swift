//
//  UIView+JusLayout.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
public extension UIView{
    private  func newJuLayMinus(_ firstAtt:NSLayoutConstraint.Attribute, layoutType:JuLayoutAttribute) -> JusLayout {
        return self.newJuLayMinus(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    private  func newJuLayMinus(_ firstAtt:NSLayoutConstraint.Attribute,secondAtt:NSLayoutConstraint.Attribute, layoutType:JuLayoutAttribute) -> JusLayout {
        let layout = self.newJuLay(firstAtt, secondAtt: secondAtt, layoutType: layoutType)
        layout.isMinus = true
        return layout
    }
    private func newJuLay(_ firstAtt:NSLayoutConstraint.Attribute, layoutType:JuLayoutAttribute) -> JusLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    
    private  func newJuLay(_ firstAtt:NSLayoutConstraint.Attribute,secondAtt:NSLayoutConstraint.Attribute, layoutType:JuLayoutAttribute) -> JusLayout {
        let layout = JusLayout.init()
        layout.juAttr1 = firstAtt
        layout.juAttr2 = secondAtt
        layout.juView1 = self
        layout.juLayAttribute=layoutType
        return layout
        
    }

    public var jusLead: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.leading, layoutType: JuLayoutAttribute.lead)
    }
    public var jusTrail: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.trailing, layoutType: JuLayoutAttribute.trail)
    }
    public var jusTop: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.top, layoutType: JuLayoutAttribute.top)
    }
    public var jusBottom: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.bottom, layoutType: JuLayoutAttribute.bottom)
    }
    public var jusLetfSpace: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.leading,secondAtt: NSLayoutConstraint.Attribute.trailing, layoutType:JuLayoutAttribute.lead)
    }
    public var jusRighSpace: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.trailing,secondAtt: NSLayoutConstraint.Attribute.leading, layoutType:JuLayoutAttribute.trail)
    }
    public var jusTopSpace: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.top,secondAtt: NSLayoutConstraint.Attribute.bottom, layoutType:JuLayoutAttribute.top)
    }
    public var jusBomSpace: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.bottom,secondAtt: NSLayoutConstraint.Attribute.top, layoutType:JuLayoutAttribute.bottom)
    }
    public var jusLastLine: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.lastBaseline, layoutType: JuLayoutAttribute.bottom)
    }
    public var jusFirstLine: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.firstBaseline, layoutType: JuLayoutAttribute.top)
    }
    public var jusCenterX: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.centerX, layoutType: JuLayoutAttribute.centerX)
    }
    public var jusCenterY: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.centerY, layoutType: JuLayoutAttribute.centerY)
    }
    public var jusWidth: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.width, layoutType: JuLayoutAttribute.width)
    }
    public var jusHeight: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.height, layoutType: JuLayoutAttribute.height)
    }
    public var jusAspectWH: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.width, secondAtt:NSLayoutConstraint.Attribute.height, layoutType:JuLayoutAttribute.aspectWH)
    }

    
    /// 设置内容优先级
    public func jusHorConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: NSLayoutConstraint.Axis.horizontal)
    }
    public func jusVerConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: NSLayoutConstraint.Axis.vertical)
    }
    public func jusVerConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: NSLayoutConstraint.Axis.vertical)
    }
    public func jusHorConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: NSLayoutConstraint.Axis.horizontal)
    }
//    func juLead() -> UIView {
//        return self
//    }
}
