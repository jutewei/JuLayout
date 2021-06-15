//
//  UIView+JusLayout.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
extension UIView{
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

    var jusLead: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.leading, layoutType: JuLayoutAttribute.lead)
    }
    var jusTrail: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.trailing, layoutType: JuLayoutAttribute.trail)
    }
    var jusTop: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.top, layoutType: JuLayoutAttribute.top)
    }
    var jusBottom: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.bottom, layoutType: JuLayoutAttribute.bottom)
    }
    var jusLetfSpace: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.leading,secondAtt: NSLayoutConstraint.Attribute.trailing, layoutType:JuLayoutAttribute.lead)
    }
    var jusRighSpace: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.trailing,secondAtt: NSLayoutConstraint.Attribute.leading, layoutType:JuLayoutAttribute.trail)
    }
    var jusTopSpace: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.top,secondAtt: NSLayoutConstraint.Attribute.bottom, layoutType:JuLayoutAttribute.top)
    }
    var jusBomSpace: JusLayout {
        return self.newJuLayMinus(NSLayoutConstraint.Attribute.bottom,secondAtt: NSLayoutConstraint.Attribute.top, layoutType:JuLayoutAttribute.bottom)
    }
    var jusLastLine: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.lastBaseline, layoutType: JuLayoutAttribute.bottom)
    }
    var jusFirstLine: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.firstBaseline, layoutType: JuLayoutAttribute.top)
    }
    var jusCenterX: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.centerX, layoutType: JuLayoutAttribute.centerX)
    }
    var jusCenterY: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.centerY, layoutType: JuLayoutAttribute.centerY)
    }
    var jusWidth: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.width, layoutType: JuLayoutAttribute.width)
    }
    var jusHeight: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.height, layoutType: JuLayoutAttribute.height)
    }
    var jusAspectWH: JusLayout {
        return self.newJuLay(NSLayoutConstraint.Attribute.width, secondAtt:NSLayoutConstraint.Attribute.height, layoutType:JuLayoutAttribute.aspectWH)
    }

    
    /// 设置内容优先级
    func jusHorConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: NSLayoutConstraint.Axis.horizontal)
    }
    func jusVerConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: NSLayoutConstraint.Axis.vertical)
    }
    func jusVerConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: NSLayoutConstraint.Axis.vertical)
    }
    func jusHorConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: NSLayoutConstraint.Axis.horizontal)
    }
//    func juLead() -> UIView {
//        return self
//    }
}
