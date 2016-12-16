//
//  UIView+JuLayout.swift
//  JuLayout
//
//  Created by Juvid on 2016/12/16.
//  Copyright © 2016年 Juvid. All rights reserved.
//

import UIKit
extension UIView{
    func newJuLayMinus(_ firstAtt:NSLayoutAttribute, layoutType:JuLayoutType) -> JuLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }
    func newJuLayMinus(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuLayoutType) -> JuLayout {
        let layout = self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
        layout.isMinus = true
        return layout
    }
    func newJuLay(_ firstAtt:NSLayoutAttribute, layoutType:JuLayoutType) -> JuLayout {
        return self.newJuLay(firstAtt, secondAtt: firstAtt, layoutType: layoutType)
    }

    func newJuLay(_ firstAtt:NSLayoutAttribute,secondAtt:NSLayoutAttribute, layoutType:JuLayoutType) -> JuLayout {
        let layout = JuLayout.init()
        layout.juAttr1 = firstAtt
        layout.juAttr2 = secondAtt
        layout.juView1 = self
        layout.setJuLayoutType(layoutType)
        return layout

    }

    var juLead: JuLayout {
        return self.newJuLay(NSLayoutAttribute.leading, layoutType: JuLayoutType.lead)
    }
    var juTrail: JuLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing, layoutType: JuLayoutType.trail)
    }
    var juTop: JuLayout {
        return self.newJuLay(NSLayoutAttribute.top, layoutType: JuLayoutType.top)
    }
    var juBottom: JuLayout {
        return self.newJuLayMinus(NSLayoutAttribute.bottom, layoutType: JuLayoutType.bottom)
    }
    var juLeaSpace: JuLayout {
        return self.newJuLay(NSLayoutAttribute.leading,secondAtt: NSLayoutAttribute.trailing, layoutType:JuLayoutType.lead)
    }
    var juTraSpace: JuLayout {
        return self.newJuLayMinus(NSLayoutAttribute.trailing,secondAtt: NSLayoutAttribute.leading, layoutType:JuLayoutType.trail)
    }
    var juTopSpace: JuLayout {
        return self.newJuLay(NSLayoutAttribute.top,secondAtt: NSLayoutAttribute.bottom, layoutType:JuLayoutType.top)
    }
    var juBtmSpace: JuLayout {
          return self.newJuLayMinus(NSLayoutAttribute.bottom,secondAtt: NSLayoutAttribute.top, layoutType:JuLayoutType.bottom)
    }
    var juLastLine: JuLayout {
        return self.newJuLay(NSLayoutAttribute.lastBaseline, layoutType: JuLayoutType.bottom)
    }
    var juFirLine: JuLayout {
        return self.newJuLay(NSLayoutAttribute.firstBaseline, layoutType: JuLayoutType.top)
    }
    var juCenterX: JuLayout {
        return self.newJuLay(NSLayoutAttribute.centerX, layoutType: JuLayoutType.centerX)
    }
    var juCenterY: JuLayout {
        return self.newJuLay(NSLayoutAttribute.centerY, layoutType: JuLayoutType.centerY)
    }
    var juWidth: JuLayout {
        return self.newJuLay(NSLayoutAttribute.width, layoutType: JuLayoutType.width)
    }
    var juHeight: JuLayout {
        return self.newJuLay(NSLayoutAttribute.height, layoutType: JuLayoutType.height)
    }
    var juAspectWH: JuLayout {
        return self.newJuLay(NSLayoutAttribute.width, secondAtt:NSLayoutAttribute.height, layoutType:JuLayoutType.aspectWH)
    }

//    func juLead() -> UIView {
//        return self
//    }
}
