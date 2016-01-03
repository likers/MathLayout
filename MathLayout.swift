//
//  MathLayout.swift
//  MathLayout
//
//  Created by Jinhuan Li on 1/2/16.
//  Copyright © 2016 likers33. All rights reserved.
//

import Foundation
import UIKit

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


public extension UIView {
    var mlALl: [NSLayoutAnchor] {
        return [self.topAnchor, self.leftAnchor, self.bottomAnchor, self.rightAnchor]
    }
    
    var mlTop: NSLayoutYAxisAnchor {
        return self.topAnchor
    }
    
    var mlBottom: NSLayoutYAxisAnchor {
        return self.bottomAnchor
    }
    
    var mlLeft: NSLayoutXAxisAnchor {
        return self.leftAnchor
    }
    
    var mlRight: NSLayoutXAxisAnchor {
        return self.rightAnchor
    }
    
    var mlLeading: NSLayoutXAxisAnchor {
        return self.leadingAnchor
    }
    
    var mlTrailing: NSLayoutXAxisAnchor {
        return self.trailingAnchor
    }
    
    var mlWidth: NSLayoutDimension {
        return self.widthAnchor
    }
    
    var mlHeight: NSLayoutDimension {
        return self.heightAnchor
    }
}

/* These methods return an active constraint of the form 
    thisAnchor = otherAnchor + constant.
    or
    thisDimension = otherDimension * multiplier + constant.
*/
public func == (left: NSLayoutAnchor, right:JLMathLayoutAnchor) {
    if (!right.anchor.isKindOfClass(NSLayoutDimension) && !left.isKindOfClass(NSLayoutDimension)) {
        left.constraintEqualToAnchor(right.anchor, constant: right.constant).active = true
    } else if (left.isKindOfClass(NSLayoutDimension) && right.anchor.isKindOfClass(NSLayoutDimension)) {
        (left as! NSLayoutDimension).constraintEqualToAnchor(right.anchor as! NSLayoutDimension, multiplier: right.multiplier, constant: right.constant).active = true
    }
}


/* These methods return an active constraint of the form
    thisDimension = constant.
*/
public func == (left: NSLayoutDimension, right:CGFloat) {
    left.constraintEqualToConstant(right).active = true
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

