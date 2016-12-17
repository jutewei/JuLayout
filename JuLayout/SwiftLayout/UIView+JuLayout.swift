//
//  UIView+JuSLayout.swift
//  JuSLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
extension UIView{
    private  func newJuLayMinus(_ firstAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    private  func newJuLayMinus(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        let layout = self.newJuLay(firstAtt, secondAtt: secondAtt, layoutType: layoutType)
        layout.isMinus = true
        return layout
    }
    private func newJuLay(_ firstAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    
    private  func newJuLay(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        let layout = JuSLayout.init()
        layout.juAttr1 = firstAtt
        layout.juAttr2 = secondAtt
        layout.juView1 = self
        layout.jusLayoutType=layoutType
        return layout
        
    }

    var jusLead: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.leading, layoutType: JuSLayoutType.lead)
    }
    var jusTrail: JuSLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing, layoutType: JuSLayoutType.trail)
    }
    var jusTop: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.top, layoutType: JuSLayoutType.top)
    }
    var jusBottom: JuSLayout {
        return self.newJuLayMinus(NSLayoutAttribute.bottom, layoutType: JuSLayoutType.bottom)
    }
    var jusLeaSpace: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.leading,secondAtt: NSLayoutAttribute.trailing, layoutType:JuSLayoutType.lead)
    }
    var jusTraSpace: JuSLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing,secondAtt: NSLayoutAttribute.leading, layoutType:JuSLayoutType.trail)
    }
    var jusTopSpace: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.top,secondAtt: NSLayoutAttribute.bottom, layoutType:JuSLayoutType.top)
    }
    var jusBtmSpace: JuSLayout {
          return self.newJuLayMinus(NSLayoutAttribute.bottom,secondAtt: NSLayoutAttribute.top, layoutType:JuSLayoutType.bottom)
    }
    var jusLastLine: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.lastBaseline, layoutType: JuSLayoutType.bottom)
    }
    var jusFirLine: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.firstBaseline, layoutType: JuSLayoutType.top)
    }
    var jusCenterX: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.centerX, layoutType: JuSLayoutType.centerX)
    }
    var jusCenterY: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.centerY, layoutType: JuSLayoutType.centerY)
    }
    var jusWidth: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.width, layoutType: JuSLayoutType.width)
    }
    var jusHeight: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.height, layoutType: JuSLayoutType.height)
    }
    var jusAspectWH: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.width, secondAtt:NSLayoutAttribute.height, layoutType:JuSLayoutType.aspectWH)
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
