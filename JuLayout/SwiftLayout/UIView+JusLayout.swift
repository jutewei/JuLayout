//
//  UIView+JusLayout.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
extension UIView{
    private  func newJuLayMinus(_ firstAtt:NSLayoutAttribute, layoutType:JuLayoutAttribute) -> JusLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    private  func newJuLayMinus(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuLayoutAttribute) -> JusLayout {
        let layout = self.newJuLay(firstAtt, secondAtt: secondAtt, layoutType: layoutType)
        layout.isMinus = true
        return layout
    }
    private func newJuLay(_ firstAtt:NSLayoutAttribute, layoutType:JuLayoutAttribute) -> JusLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    
    private  func newJuLay(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuLayoutAttribute) -> JusLayout {
        let layout = JusLayout.init()
        layout.juAttr1 = firstAtt
        layout.juAttr2 = secondAtt
        layout.juView1 = self
        layout.juLayAttribute=layoutType
        return layout
        
    }

    var jusLead: JusLayout {
        return self.newJuLay(NSLayoutAttribute.leading, layoutType: JuLayoutAttribute.lead)
    }
    var jusTrail: JusLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing, layoutType: JuLayoutAttribute.trail)
    }
    var jusTop: JusLayout {
        return self.newJuLay(NSLayoutAttribute.top, layoutType: JuLayoutAttribute.top)
    }
    var jusBottom: JusLayout {
        return self.newJuLayMinus(NSLayoutAttribute.bottom, layoutType: JuLayoutAttribute.bottom)
    }
    var jusLSpace: JusLayout {
        return self.newJuLay(NSLayoutAttribute.leading,secondAtt: NSLayoutAttribute.trailing, layoutType:JuLayoutAttribute.lead)
    }
    var jusRSpace: JusLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing,secondAtt: NSLayoutAttribute.leading, layoutType:JuLayoutAttribute.trail)
    }
    var jusTSpace: JusLayout {
        return self.newJuLay(NSLayoutAttribute.top,secondAtt: NSLayoutAttribute.bottom, layoutType:JuLayoutAttribute.top)
    }
    var jusBSpace: JusLayout {
          return self.newJuLayMinus(NSLayoutAttribute.bottom,secondAtt: NSLayoutAttribute.top, layoutType:JuLayoutAttribute.bottom)
    }
    var jusLastLine: JusLayout {
        return self.newJuLay(NSLayoutAttribute.lastBaseline, layoutType: JuLayoutAttribute.bottom)
    }
    var jusFirstLine: JusLayout {
        return self.newJuLay(NSLayoutAttribute.firstBaseline, layoutType: JuLayoutAttribute.top)
    }
    var jusCenterX: JusLayout {
        return self.newJuLay(NSLayoutAttribute.centerX, layoutType: JuLayoutAttribute.centerX)
    }
    var jusCenterY: JusLayout {
        return self.newJuLay(NSLayoutAttribute.centerY, layoutType: JuLayoutAttribute.centerY)
    }
    var jusWidth: JusLayout {
        return self.newJuLay(NSLayoutAttribute.width, layoutType: JuLayoutAttribute.width)
    }
    var jusHeight: JusLayout {
        return self.newJuLay(NSLayoutAttribute.height, layoutType: JuLayoutAttribute.height)
    }
    var jusAspectWH: JusLayout {
        return self.newJuLay(NSLayoutAttribute.width, secondAtt:NSLayoutAttribute.height, layoutType:JuLayoutAttribute.aspectWH)
    }

    
    /// 设置内容优先级
    func jusHorConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: UILayoutConstraintAxis.horizontal)
    }
    func jusVerConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: UILayoutConstraintAxis.vertical)
    }
    func jusVerConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: UILayoutConstraintAxis.vertical)
    }
    func jusHorConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: UILayoutConstraintAxis.horizontal)
    }
//    func juLead() -> UIView {
//        return self
//    }
}
