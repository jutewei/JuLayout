//
//  UIView+JuLayGroup.swift
//  JusLayout
//
//  Created by Juvid on 2016/9/16.
//  Copyright © 2016年 Juvid(zhutianwei). All rights reserved.
//

import UIKit

public struct JuLayEdgeHeight {
    public var lead: CGFloat
    public var trail: CGFloat
    public var y: CGFloat
    public var height: CGFloat

    public init(lead: CGFloat, trail: CGFloat, y: CGFloat, height: CGFloat){
        self.lead = lead
        self.trail = trail
        self.y = y
        self.height = height
    }
}
public struct JuLayEdgeWidth {
    public var top: CGFloat
    public var bottom: CGFloat
    public var x: CGFloat
    public var width: CGFloat
    public init(top: CGFloat, bottom: CGFloat, x: CGFloat, width: CGFloat){
        self.x = x
        self.bottom = bottom
        self.top = top
        self.width = width
    }
}
/*
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
}*/
public extension UIView{

    public  func jusOrigin(_ origin:CGPoint) {
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
    public func jusSafeOrigin(_ origin:CGPoint) {
        if(origin.x>0) {
            self.jusLead.safe.equal(origin.x);
        }else if(origin.x<0){
            self.jusTrail.safe.equal(-origin.x);
        }else{
            self.jusCenterX.equal(0);
        }
        if(origin.y>0) {
            self.jusTop.safe.equal(origin.y);
        }else if(origin.y<0){
            self.jusBottom.safe.equal(-origin.y);
        }else{
            self.jusCenterY.equal(0);
        }
    }
    public func jusOriginEqual(_ view:UIView) {
        self.jusLead.toView(view).equal(0);
        self.jusTrail.toView(view).equal(0);
    }

    public func jusSize(_ size:CGSize) {
        self.jusWidth.equal(size.width);
        self.jusHeight.equal(size.height);
    }
    public func jusSizeEqual(_ view:UIView) {
        self.jusWidth.toView(view).equal(0);
        self.jusHeight.toView(view).equal(0);
    }

    public func jusFrame(_ frame:CGRect) {
        self.jusOrigin(frame.origin);
        self.jusSize(frame.size);
    }
    public func jusSafeFrame(_ frame:CGRect) {
        self.jusSafeOrigin(frame.origin);
        self.jusSize(frame.size);
    }
    public func jusFrameEqual(_ view:UIView) {
        self.jusOriginEqual(view);
        self.jusSizeEqual(view);
    }

    public func jusEdge(_ edge:UIEdgeInsets)  {
        self.jusEdgeTo(edge,self.superview!);
    }
    public func jusSafeEdge(_ edge:UIEdgeInsets)  {
        self.jusLead.safe.equal(edge.left);
        self.jusTrail.safe.equal(edge.right);
        self.jusTop.safe.equal(edge.top);
        self.jusBottom.safe.equal(edge.bottom);
    }
    public func jusEdgeTo(_ edge:UIEdgeInsets,_ view:UIView)  {
        self.jusLead.toView(view).equal(edge.left);
        self.jusTrail.toView(view).equal(edge.right);
        self.jusTop.toView(view).equal(edge.top);
        self.jusBottom.toView(view).equal(edge.bottom);
    }

    public func jusEdgeH(_ juEdgeH:JuLayEdgeHeight)  {
        if self.superview != nil {
            self.jusEdgeHTo(juEdgeH,self.superview!)
        }
    }
    public func jusEdgeHTo(_ juEdgeH:JuLayEdgeHeight,_ view:UIView) {
        self.jusLead.toView(view).equal(juEdgeH.lead);
        self.jusTrail.toView(view).equal(juEdgeH.trail);
        if(juEdgeH.y>0) {
            self.jusTop.toView(view).equal(juEdgeH.y);
        }else if(juEdgeH.y==0){
            self.jusCenterY.toView(view).equal(juEdgeH.y);
        }else{
            self.jusBottom.toView(view).equal(-juEdgeH.y);
        }
        if(juEdgeH.height>0) {
            self.jusHeight.toView(view).equal(juEdgeH.height);
        }
    }

    public func juEdgeW(_ juEdgeW:JuLayEdgeWidth)  {
        if self.superview != nil {
            self.jusEdgeWTo(juEdgeW,self.superview!);
        }
    }
    public func jusEdgeWTo(_ juEdgeW:JuLayEdgeWidth,_ view:UIView)  {
        self.jusTop.toView(view).equal(juEdgeW.top);
        self.jusBottom.toView(view).equal(juEdgeW.bottom);

        if(juEdgeW.x>0) {
            self.jusLead.toView(view).equal(juEdgeW.x);
        }else if(juEdgeW.x==0){
            self.jusCenterX.toView(view).equal(juEdgeW.x);
        }else{
            self.jusTrail.toView(view).equal(-juEdgeW.x);
        }
        if(juEdgeW.width>0) {
            self.jusWidth.toView(view).equal(juEdgeW.width);
        }
    }
    /*
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

     */
}
