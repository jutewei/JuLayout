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

    func juOriginEqual(_ view:UIView) {
        self.juLead.toView(view).equal(0);
        self.juTrail.toView(view).equal(0);
    }


    func juSizeEqual(_ view:UIView) {
        self.juWidth.toView(view).equal(0);
        self.juHeight.toView(view).equal(0);
    }

    func juFrameEqual(_ view:UIView) {
        self.juOriginEqual(view);
        self.juSizeEqual(view);
    }
    func juOrigin(_ origin:CGPoint) {
        if(origin.x>0) {
            self.juLead.equal(origin.x);
        }else if(origin.x<0){
            self.juTrail.equal(-origin.x);
        }else{
            self.juCenterX.equal(0);
        }
        if(origin.y>0) {
            self.juTop.equal(origin.y);
        }else if(origin.y<0){
            self.juBottom.equal(-origin.y);
        }else{
            self.juCenterY.equal(0);
        }
    }
    func juSize(_ size:CGSize) {
        self.juWidth.equal(size.width);
        self.juHeight.equal(size.height);
    }

    func juFrame(_frame:CGRect) {
        self.juOrigin(frame.origin);
        self.juSize(frame.size);
    }
    func juEdge(_ edge:UIEdgeInsets)  {
        self.juEdgeTo(edge,self.superview!);
    }

    func juEdgeTo(_ edge:UIEdgeInsets,_ view:UIView)  {
        self.juLead.toView(view).equal(edge.left);
        self.juTrail.toView(view).equal(edge.right);
        self.juTop.toView(view).equal(edge.top);
        self.juBottom.toView(view).equal(edge.bottom);
    }

    func juEdgeH(_ juEdgeH:JuLayEdgeHeight)  {
        if self.superview != nil {
            self.juEdgeHTo(juEdgeH,self.superview!)
        }
    }
    func juEdgeHTo(_ juEdgeH:JuLayEdgeHeight,_ view:UIView) {
        self.juLead.toView(view).equal(juEdgeH.lead);
        self.juTrail.toView(view).equal(juEdgeH.trail);
        if(juEdgeH.top>0) {
            self.juTop.toView(view).equal(juEdgeH.top);
        }else if(juEdgeH.top==0){
            self.juCenterY.toView(view).equal(juEdgeH.top);
        }else{
            self.juBottom.toView(view).equal(-juEdgeH.top);
        }
        if(juEdgeH.height>0) {
            self.juHeight.toView(view).equal(juEdgeH.height);
        }
    }

    func juEdgeW(_ juEdgeW:JuLayEdgeWidth)  {
        if self.superview != nil {
            self.juEdgeWTo(juEdgeW,self.superview!);
        }
    }

    func juEdgeWTo(_ juEdgeW:JuLayEdgeWidth,_ view:UIView)  {
        self.juTop.toView(view).equal(juEdgeW.top);
        self.juBottom.toView(view).equal(juEdgeW.bottom);

        if(juEdgeW.lead>0) {
            self.juLead.toView(view).equal(juEdgeW.lead);
        }else if(juEdgeW.lead==0){
            self.juCenterX.toView(view).equal(juEdgeW.lead);
        }else{
            self.juTrail.toView(view).equal(-juEdgeW.lead);
        }
        if(juEdgeW.width>0) {
            self.juWidth.toView(view).equal(juEdgeW.width);
        }
    }

    func juAlignX(_ juFrame:JuLayRect)  {
        if self.superview != nil {
            self.juAlignXTo(juFrame, self.superview!)
        }
    }
    func juAlignXTo(_ juFrame:JuLayRect,_ view:UIView?) {
        if(juFrame.lead>0) {
            self.juLead.toView(view).equal(juFrame.lead);
        }else if(juFrame.lead==0){
            self.juCenterX.toView(view).equal(juFrame.lead);
        }else{
            self.juTrail.toView(view).equal(-juFrame.lead);
        }

        if view != nil {
            self.juTopSpace.toView(view).equal(juFrame.top);
        }else{
            self.juTop.toView(view).equal(juFrame.top);
        }

        if(juFrame.width>0) {
            self.juWidth.toView(view).equal(juFrame.width);
        }
        if(juFrame.height>0) {
            self.juHeight.toView(view).equal(juFrame.height);
        }
    }
}
