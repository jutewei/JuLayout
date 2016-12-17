//
//  UIView+JuSLayout.swift
//  JuSLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
extension UIView{
    func newJuLayMinus(_ firstAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    func newJuLayMinus(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        let layout = self.newJuLay(firstAtt, secondAtt: secondAtt, layoutType: layoutType)
        layout.isMinus = true
        return layout
    }
    func newJuLay(_ firstAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }

    func newJuLay(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuSLayoutType) -> JuSLayout {
        let layout = JuSLayout.init()
        layout.juAttr1 = firstAtt
        layout.juAttr2 = secondAtt
        layout.juView1 = self
        layout.jusLayoutType=layoutType
        return layout

    }

    var juLead: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.leading, layoutType: JuSLayoutType.lead)
    }
    var juTrail: JuSLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing, layoutType: JuSLayoutType.trail)
    }
    var juTop: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.top, layoutType: JuSLayoutType.top)
    }
    var juBottom: JuSLayout {
        return self.newJuLayMinus(NSLayoutAttribute.bottom, layoutType: JuSLayoutType.bottom)
    }
    var juLeaSpace: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.leading,secondAtt: NSLayoutAttribute.trailing, layoutType:JuSLayoutType.lead)
    }
    var juTraSpace: JuSLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing,secondAtt: NSLayoutAttribute.leading, layoutType:JuSLayoutType.trail)
    }
    var juTopSpace: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.top,secondAtt: NSLayoutAttribute.bottom, layoutType:JuSLayoutType.top)
    }
    var juBtmSpace: JuSLayout {
          return self.newJuLayMinus(NSLayoutAttribute.bottom,secondAtt: NSLayoutAttribute.top, layoutType:JuSLayoutType.bottom)
    }
    var juLastLine: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.lastBaseline, layoutType: JuSLayoutType.bottom)
    }
    var juFirLine: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.firstBaseline, layoutType: JuSLayoutType.top)
    }
    var juCenterX: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.centerX, layoutType: JuSLayoutType.centerX)
    }
    var juCenterY: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.centerY, layoutType: JuSLayoutType.centerY)
    }
    var juWidth: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.width, layoutType: JuSLayoutType.width)
    }
    var juHeight: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.height, layoutType: JuSLayoutType.height)
    }
    var juAspectWH: JuSLayout {
        return self.newJuLay(NSLayoutAttribute.width, secondAtt:NSLayoutAttribute.height, layoutType:JuSLayoutType.aspectWH)
    }

    
    /// 设置内容优先级
    func juHorConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: UILayoutConstraintAxis.horizontal)
    }
    func juVerConHugPri(_ priority: UILayoutPriority) {
        self.setContentHuggingPriority(priority, for: UILayoutConstraintAxis.vertical)
    }
    func juVerConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: UILayoutConstraintAxis.vertical)
    }
    func juHorConComResPri(_ priority: UILayoutPriority) {
        self.setContentCompressionResistancePriority(priority, for: UILayoutConstraintAxis.horizontal)
    }
//    func juLead() -> UIView {
//        return self
//    }
}
