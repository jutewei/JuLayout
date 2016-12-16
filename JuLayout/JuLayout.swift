//
//  JuLayout.swift
//  JuLayout
//
//  Created by Juvid on 2016/12/16.
//  Copyright © 2016年 Juvid. All rights reserved.
//

import UIKit

public enum JuLayoutType : Int {
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


class JuLayout: NSObject {

    var isMinus :Bool?///< 只能为
    var juView2 : UIView?
    var juView1 : UIView!
    var juMulti : CGFloat = 1.0

    var juAttr1 : NSLayoutAttribute?
    var juAttr2 : NSLayoutAttribute?

    var juConstant : CGFloat?
    var juRelation : NSLayoutRelation?
    var prioritys : UILayoutPriority?
    var juLayoutType :JuLayoutType?


    func multi(_ mulits:CGFloat) -> JuLayout {
        juMulti = mulits
        return self;
    }

    func toView(_ toItem:UIView) -> JuLayout {
        
        return self
    }
    func priority(_ prioritys:float_t) -> JuLayout {
        return self
    }
    func equal(_ constion:float_t)  {
       self.juAddConstraint().isEqual(124)
    }
    func greaterEqual(_ constion:float_t) {
//         self.juAddConstraint().grea
    }
    func lessEqual(_ constion:CGFloat)  {
         self.juAddConstraint()
    }
    func juAddConstraint() -> NSLayoutConstraint {
        if juView1.superview == nil {
            return nil
        }
        var layoutConstraint = NSLayoutConstraint.init(item: juView1, attribute: juAttr1!, relatedBy:juRelation!, toItem: juView2, attribute: juAttr2!, multiplier:juMulti, constant: juConstant!)

        return layoutConstraint

    }

}
