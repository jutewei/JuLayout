//
//  UIView+JuLayGroup.swift
//  JuSLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit

public struct JuLayEdgeHeight {
    public var lead: CGFloat
    public var trail: CGFloat
    public var top: CGFloat
    public var height: CGFloat

    public init(lead: CGFloat, trail: CGFloat, top: CGFloat, height: CGFloat){
        self.lead = lead
        self.trail = trail
        self.top = top
        self.height = height
    }
}
public struct JuLayEdgeWidth {
    public var top: CGFloat
    public var bottom: CGFloat
    public var lead: CGFloat
    public var width: CGFloat
    public init(top: CGFloat, bottom: CGFloat, lead: CGFloat, width: CGFloat){
        self.lead = lead
        self.bottom = bottom
        self.top = top
        self.width = width
    }
}
public struct JuLayRect {
    public var lead: CGFloat
    public var top: CGFloat
    public var width: CGFloat
    public var height: CGFloat
    public init(lead: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat){
        self.lead = lead
        self.height = height
        self.top = top
        self.width = width
    }
}
extension UIView{

    func jusOriginEqual(_ view:UIView) {
        self.jusLead.toView(view).equal(0);
        self.jusTrail.toView(view).equal(0);
    }


    func jusSizeEqual(_ view:UIView) {
        self.jusWidth.toView(view).equal(0);
        self.jusHeight.toView(view).equal(0);
    }

    func jusFrameEqual(_ view:UIView) {
        self.jusOriginEqual(view);
        self.jusSizeEqual(view);
    }
    func jusOrigin(_ origin:CGPoint) {
        if(origin.x>0) {
            self.jusLead.equal(origin.x);
        }else if(origin.x<0){
            self.jusTrail.equal(-origin.x);
        }else{
            self.jusCenterX.equal(0);
        }
        if(origin.y>0) {
            self.jusTop.equal(origin.y);
        }else if(origin.y<0){
            self.jusBottom.equal(-origin.y);
        }else{
            self.jusCenterY.equal(0);
        }
    }
    func jusSize(_ size:CGSize) {
        self.jusWidth.equal(size.width);
        self.jusHeight.equal(size.height);
    }

    func jusFrame(_frame:CGRect) {
        self.jusOrigin(frame.origin);
        self.jusSize(frame.size);
    }
    func jusEdge(_ edge:UIEdgeInsets)  {
        self.jusEdgeTo(edge,self.superview!);
    }

    func jusEdgeTo(_ edge:UIEdgeInsets,_ view:UIView)  {
        self.jusLead.toView(view).equal(edge.left);
        self.jusTrail.toView(view).equal(edge.right);
        self.jusTop.toView(view).equal(edge.top);
        self.jusBottom.toView(view).equal(edge.bottom);
    }

    func jusEdgeH(_ juEdgeH:JuLayEdgeHeight)  {
        if self.superview != nil {
            self.jusEdgeHTo(juEdgeH,self.superview!)
        }
    }
    func jusEdgeHTo(_ juEdgeH:JuLayEdgeHeight,_ view:UIView) {
        self.jusLead.toView(view).equal(juEdgeH.lead);
        self.jusTrail.toView(view).equal(juEdgeH.trail);
        if(juEdgeH.top>0) {
            self.jusTop.toView(view).equal(juEdgeH.top);
        }else if(juEdgeH.top==0){
            self.jusCenterY.toView(view).equal(juEdgeH.top);
        }else{
            self.jusBottom.toView(view).equal(-juEdgeH.top);
        }
        if(juEdgeH.height>0) {
            self.jusHeight.toView(view).equal(juEdgeH.height);
        }
    }

    func juEdgeW(_ juEdgeW:JuLayEdgeWidth)  {
        if self.superview != nil {
            self.jusEdgeWTo(juEdgeW,self.superview!);
        }
    }

    func jusEdgeWTo(_ juEdgeW:JuLayEdgeWidth,_ view:UIView)  {
        self.jusTop.toView(view).equal(juEdgeW.top);
        self.jusBottom.toView(view).equal(juEdgeW.bottom);

        if(juEdgeW.lead>0) {
            self.jusLead.toView(view).equal(juEdgeW.lead);
        }else if(juEdgeW.lead==0){
            self.jusCenterX.toView(view).equal(juEdgeW.lead);
        }else{
            self.jusTrail.toView(view).equal(-juEdgeW.lead);
        }
        if(juEdgeW.width>0) {
            self.jusWidth.toView(view).equal(juEdgeW.width);
        }
    }

    func jusAlignX(_ juFrame:JuLayRect)  {
        if self.superview != nil {
            self.jusAlignXTo(juFrame, self.superview!)
        }
    }
    func jusAlignXTo(_ juFrame:JuLayRect,_ view:UIView?) {
        if(juFrame.lead>0) {
            self.jusLead.toView(view).equal(juFrame.lead);
        }else if(juFrame.lead==0){
            self.jusCenterX.toView(view).equal(juFrame.lead);
        }else{
            self.jusTrail.toView(view).equal(-juFrame.lead);
        }

        if view != nil {
            self.jusTopSpace.toView(view).equal(juFrame.top);
        }else{
            self.jusTop.toView(view).equal(juFrame.top);
        }

        if(juFrame.width>0) {
            self.jusWidth.toView(view).equal(juFrame.width);
        }
        if(juFrame.height>0) {
            self.jusHeight.toView(view).equal(juFrame.height);
        }
    }
}
