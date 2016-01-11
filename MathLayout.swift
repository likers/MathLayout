//
//  MathLayout.swift
//  MathLayout
//
//  Created by Jinhuan Li on 1/2/16.
//  Copyright © 2016 likers33. All rights reserved.
//

import Foundation
import UIKit

public enum JLMathLayoutCorners : Int {
    case ALL
    case TopLeft
    case BottomRight
    case LeftBottom
    case TopRight
    case Center
}

public class JLMathLayoutAnchor: NSObject {
    private let anchor: NSLayoutAnchor
    private var constant: CGFloat
    private let multiplier: CGFloat
    
    init(anchor: NSLayoutAnchor, constant: CGFloat = 0, multiplier: CGFloat = 1) {
        self.anchor = anchor
        self.constant = constant
        self.multiplier = multiplier
    }
}

public class JLMathLayoutShortCut: NSObject {
    private let view: UIView
    private let corner: JLMathLayoutCorners
    private var constant: CGFloat
    init(view: UIView, corner: JLMathLayoutCorners, constant: CGFloat) {
        self.view = view
        self.corner = corner
        self.constant = constant
    }
}

infix operator ==== {
    associativity none
    precedence 91
}


public extension UIView {
    var all: JLMathLayoutShortCut {
        let shortCut = JLMathLayoutShortCut(view: self, corner: .ALL, constant: 0)
        return shortCut
    }
    
    var topLeft: JLMathLayoutShortCut {
        let shortCut = JLMathLayoutShortCut(view: self, corner: .TopLeft, constant: 0)
        return shortCut
    }
    
    var bottomRight: JLMathLayoutShortCut {
        let shortCut = JLMathLayoutShortCut(view: self, corner: .BottomRight, constant: 0)
        return shortCut
    }
    
    var leftBottom: JLMathLayoutShortCut {
        let shortCut = JLMathLayoutShortCut(view: self, corner: .LeftBottom, constant: 0)
        return shortCut
    }
    
    var topRight: JLMathLayoutShortCut {
        let shortCut = JLMathLayoutShortCut(view: self, corner: .TopRight, constant: 0)
        return shortCut
    }
    
    var centerXY: JLMathLayoutShortCut {
        let shortCut = JLMathLayoutShortCut(view: self, corner: .Center, constant: 0)
        return shortCut
    }
    
    var top: NSLayoutYAxisAnchor {
        return self.topAnchor
    }
    
    var bottom: NSLayoutYAxisAnchor {
        return self.bottomAnchor
    }
    
    var left: NSLayoutXAxisAnchor {
        return self.leftAnchor
    }
    
    var right: NSLayoutXAxisAnchor {
        return self.rightAnchor
    }
    
    var leading: NSLayoutXAxisAnchor {
        return self.leadingAnchor
    }
    
    var trailing: NSLayoutXAxisAnchor {
        return self.trailingAnchor
    }
    
    var centerX: NSLayoutXAxisAnchor {
        return self.centerXAnchor
    }
    
    var centerY: NSLayoutYAxisAnchor {
        return self.centerYAnchor
    }
    
    var width: NSLayoutDimension {
        return self.widthAnchor
    }
    
    var height: NSLayoutDimension {
        return self.heightAnchor
    }
    
}

/* These methods return an active constraint of the form 
    thisAnchor = otherAnchor + constant.
    or
    thisDimension = otherDimension * multiplier + constant.
*/
public func ==== (left: NSLayoutAnchor, right:JLMathLayoutAnchor) {
    if (!right.anchor.isKindOfClass(NSLayoutDimension) && !left.isKindOfClass(NSLayoutDimension)) {
        left.constraintEqualToAnchor(right.anchor, constant: right.constant).active = true
    } else if (left.isKindOfClass(NSLayoutDimension) && right.anchor.isKindOfClass(NSLayoutDimension)) {
        (left as! NSLayoutDimension).constraintEqualToAnchor(right.anchor as! NSLayoutDimension, multiplier: right.multiplier, constant: right.constant).active = true
    }
}


/* These methods return an active constraint of the form
    thisAnchorGroup = otherAnchorGroup + constant(can be 0).
*/
public func ==== (left: JLMathLayoutShortCut, right: JLMathLayoutShortCut) {
    switch left.corner {
    case .TopLeft:
        left.view.topAnchor.constraintEqualToAnchor(right.view.topAnchor, constant: right.constant).active = true
        left.view.leftAnchor.constraintEqualToAnchor(right.view.leftAnchor, constant: right.constant).active = true
    case .BottomRight:
        left.view.bottomAnchor.constraintEqualToAnchor(right.view.bottomAnchor, constant: right.constant).active = true
        left.view.rightAnchor.constraintEqualToAnchor(right.view.rightAnchor, constant: right.constant).active = true
    case .LeftBottom:
        left.view.leftAnchor.constraintEqualToAnchor(right.view.leftAnchor, constant: right.constant).active = true
        left.view.bottomAnchor.constraintEqualToAnchor(right.view.bottomAnchor, constant: right.constant*(-1)).active = true
    case .TopRight:
        left.view.topAnchor.constraintEqualToAnchor(right.view.topAnchor, constant: right.constant).active = true
        left.view.rightAnchor.constraintEqualToAnchor(right.view.rightAnchor, constant: right.constant*(-1)).active = true
    case .Center:
        left.view.centerXAnchor.constraintEqualToAnchor(right.view.centerXAnchor, constant: right.constant).active = true
        left.view.centerYAnchor.constraintEqualToAnchor(right.view.centerYAnchor, constant: right.constant).active = true
    default:
        left.view.topAnchor.constraintEqualToAnchor(right.view.topAnchor, constant: right.constant).active = true
        left.view.leftAnchor.constraintEqualToAnchor(right.view.leftAnchor, constant: right.constant).active = true
        left.view.bottomAnchor.constraintEqualToAnchor(right.view.bottomAnchor, constant: right.constant*(-1)).active = true
        left.view.rightAnchor.constraintEqualToAnchor(right.view.rightAnchor, constant: right.constant*(-1)).active = true
    }
}


/* These methods return an active constraint of the form
    thisAnchor = otherAnchor.
*/
public func ==== (left: NSLayoutAnchor, right: NSLayoutAnchor) {
    if !left.isKindOfClass(NSLayoutDimension) && !right.isKindOfClass(NSLayoutDimension) {
        left.constraintEqualToAnchor(right).active = true
    }
}

public func ==== (left: [NSLayoutAnchor], right: [NSLayoutAnchor]) {
    for var i = 0; i < right.count; i++ {
        if !left[i].isKindOfClass(NSLayoutDimension) && !right[i].isKindOfClass(NSLayoutDimension) {
            left[i].constraintEqualToAnchor(right[i]).active = true
        }
    }
    
}


/* These methods return an active constraint of the form
    thisAnchor >= otherAnchor + constant
    or
    thisDimension >= otherDimension * multiplier + constant.

    thisAnchor <= otherAnchor + constant
    or
    thisDimension <= otherDimension * multiplier + constant.
*/
public func >= (left: NSLayoutAnchor, right:JLMathLayoutAnchor) {
    if (!right.anchor.isKindOfClass(NSLayoutDimension) && !left.isKindOfClass(NSLayoutDimension)) {
        left.constraintGreaterThanOrEqualToAnchor(right.anchor, constant: right.constant).active = true
    } else if (left.isKindOfClass(NSLayoutDimension) && right.anchor.isKindOfClass(NSLayoutDimension)) {
        (left as! NSLayoutDimension).constraintGreaterThanOrEqualToAnchor(right.anchor as! NSLayoutDimension, multiplier: right.multiplier, constant: right.constant).active = true
    }
}

public func <= (left: NSLayoutAnchor, right:JLMathLayoutAnchor) {
    if (!right.anchor.isKindOfClass(NSLayoutDimension) && !left.isKindOfClass(NSLayoutDimension)) {
        left.constraintLessThanOrEqualToAnchor(right.anchor, constant: right.constant).active = true
    } else if (left.isKindOfClass(NSLayoutDimension) && right.anchor.isKindOfClass(NSLayoutDimension)) {
        (left as! NSLayoutDimension).constraintLessThanOrEqualToAnchor(right.anchor as! NSLayoutDimension, multiplier: right.multiplier, constant: right.constant).active = true
    }
}


/* These methods return an active constraint of the form
    thisDimension = constant.
*/
public func ==== (left: NSLayoutDimension, right:CGFloat) {
    left.constraintEqualToConstant(right).active = true
}


/* These methods return an active constraint of the form
    thisDimension >= constant
    thisDimension <= constant
*/
public func >= (left: NSLayoutDimension, right:CGFloat) {
    left.constraintGreaterThanOrEqualToConstant(right).active = true
}

public func <= (left: NSLayoutDimension, right:CGFloat) {
    left.constraintLessThanOrEqualToConstant(right).active = true
}


/* These methods return a JLMathLayoutAnchor object of the form
    anchor + constant.
*/
public func + (left:NSLayoutAnchor, right: CGFloat) -> JLMathLayoutAnchor {
    let layoutItem = JLMathLayoutAnchor(anchor: left, constant: right)
    return layoutItem
}

public func + (left:CGFloat, right: NSLayoutAnchor) -> JLMathLayoutAnchor {
    let layoutItem = JLMathLayoutAnchor(anchor: right, constant: left)
    return layoutItem
}


/* These methods return a JLMathLayoutShortCut object of the form
    anchorGroup + constant.
*/
public func + (left:JLMathLayoutShortCut, right:CGFloat) -> JLMathLayoutShortCut {
    left.constant = right
    return left
}

public func + (left:CGFloat, right:JLMathLayoutShortCut) -> JLMathLayoutShortCut {
    right.constant = left
    return right
}


/* These methods return a JLMathLayoutAnchor object of the form
    multiplier * Dimension + constant.
*/
public func + (left:JLMathLayoutAnchor, right: CGFloat) -> JLMathLayoutAnchor {
    left.constant = right
    return left
}

public func + (left:CGFloat, right: JLMathLayoutAnchor) -> JLMathLayoutAnchor {
    right.constant = left
    return right
}


/* These methods return a JLMathLayoutAnchor object of the form
    Anchor - constant.
*/
public func - (left:NSLayoutAnchor, right: CGFloat) -> JLMathLayoutAnchor {
    let layoutItem = JLMathLayoutAnchor(anchor: left, constant: right*(-1))
    return layoutItem
}

public func - (left:CGFloat, right: NSLayoutAnchor) -> JLMathLayoutAnchor {
    let layoutItem = JLMathLayoutAnchor(anchor: right, constant: left*(-1))
    return layoutItem
}


/* These methods return a JLMathLayoutShortCut object of the form
    anchorGroup - constant.
*/
public func - (left:JLMathLayoutShortCut, right:CGFloat) -> JLMathLayoutShortCut {
    left.constant = right*(-1)
    return left
}

public func - (left:CGFloat, right:JLMathLayoutShortCut) -> JLMathLayoutShortCut {
    right.constant = left*(-1)
    return right
}


/* These methods return a JLMathLayoutAnchor object of the form
    multiplier * Dimension - constant.
*/
public func - (left:JLMathLayoutAnchor, right: CGFloat) -> JLMathLayoutAnchor {
    left.constant = right*(-1)
    return left
}

public func - (left:CGFloat, right: JLMathLayoutAnchor) -> JLMathLayoutAnchor {
    right.constant = left*(-1)
    return right
}


/* These methods return a JLMathLayoutAnchor object of the form
    multiplier * Dimension
*/
public func * (left:CGFloat, right: NSLayoutDimension) -> JLMathLayoutAnchor {
    let layoutItem = JLMathLayoutAnchor(anchor: right, multiplier: left)
    return layoutItem
}

public func * (left:NSLayoutDimension, right: CGFloat) -> JLMathLayoutAnchor {
    let layoutItem = JLMathLayoutAnchor(anchor: left, multiplier: right)
    return layoutItem
}

