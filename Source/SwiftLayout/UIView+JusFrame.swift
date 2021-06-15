//
//  UIView+Frame.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit
public extension UIView{
    public var originX :CGFloat?{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue!
            self.frame = frame;
        }
    }
    public var originY :CGFloat?{
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue!
            self.frame = frame;
        }
    }
    public var sizeW :CGFloat?{
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue!
            self.frame = frame;
        }
    }
    public  var sizeH :CGFloat?{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue!
            self.frame = frame;
        }
    }
    public func removeAllSubviews() {
        while (self.subviews.count > 0) {
            let subView = self.subviews.first
            subView?.removeFromSuperview()
        }
    }
}
