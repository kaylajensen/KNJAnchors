//
//  Helpful Constraints/Anchors Framework
//  UIView+Anchors.swift
//
//  Created by Kayla Jensen 1/20/2017
//  Copyright © 2017 Kayla Jensen. All rights reserved.
//

import UIKit

let printWarning = "CONSTRAINT/ANCHOR WARNING: "

extension UIView {
    
    /** ANCHOR ENTIRE VIEW TO SUPERVIEW */
    public func anchorToEntireSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    /** ANCHOR JUST CENTER X TO SUPERVIEW
     - parameter constant: an offset value in reference to the centerX anchor
     */
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    /** ANCHOR JUST CENTER Y TO SUPERVIEW
     - parameter constant: an offset value in reference to the centerY anchor
     */
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    /** ANCHOR JUST CENTER X,Y TO SUPERVIEW */
    public func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    
    /** ANCHOR LEFT ONLY
    - parameter to: x axis anchor in which you want your left anchor anchored to
    - parameter constant: an offset value in reference to the left anchor
    */
    public func anchorLeft(to: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    /** ANCHOR RIGHT ONLY
    - parameter to: x axis anchor in which you want your right anchor anchored to
    - parameter constant: an offset value in reference to the right anchor
    */
    public func anchorRight(to: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        rightAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    /** ANCHOR TOP ONLY
    - parameter to: y axis anchor in which you want your top anchor anchored to
    - parameter constant: an offset value in reference to the top anchor
    */
    public func anchorTop(to: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    /** ANCHOR BOTTOM ONLY
    - parameter to: y axis anchor in which you want your bottom anchor anchored to
    - parameter constant: an offset value in reference to the bottom anchor
    */
    public func anchorBottom(to: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    /** ANCHOR CENTER Y ONLY
    - parameter to: y axis anchor in which you want your centerY anchor anchored to
    - parameter constant: an offset value in reference to the centerY anchor
    */
    public func anchorCenterY(to: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    /** ANCHOR CENTER X ONLY
    - parameter to: x axis anchor in which you want your centerX anchor anchored to
    - parameter constant: an offset value in reference to the centerX anchor
    */
    public func anchorCenterX(to: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: to, constant: constant).isActive = true
    }
    
    /** ANCHOR WIDTH ONLY
    - parameter to: dimension width width in which you want your width anchor anchored to
    - parameter constant: an offset value in reference to the width anchor
    - parameter multiplier: custom multiplier of the width, default set to 1.0*widthAnchor
    */
    public func anchorWidth(to: NSLayoutDimension, constant: CGFloat = 0, multiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if multiplier == 0 {
            print(printWarning + "You will not be able to see your view because you set the width anchor's multiplier to zero.")
        }
        
        if multiplier != 1 {
            widthAnchor.constraint(equalTo: to, multiplier: multiplier).isActive = true
        } else {
            widthAnchor.constraint(equalTo: to, constant: constant).isActive = true
        }
    }
    
    /** ANCHOR HEIGHT ONLY
    - parameter to: dimension width width in which you want your height anchor anchored to
    - parameter constant: an offset value in reference to the height anchor
    - parameter multiplier: custom multiplier of the height, default set to 1.0*heightAnchor
    */
    public func anchorHeight(to: NSLayoutDimension, constant: CGFloat = 0, multiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if multiplier == 0 {
            print(printWarning + "You will not be able to see your view because you set the height anchor's multiplier to zero.")
        }
        
        if multiplier != 1 {
            heightAnchor.constraint(equalTo: to, multiplier: multiplier).isActive = true
        } else {
            heightAnchor.constraint(equalTo: to, constant: constant).isActive = true
        }
    }
    
    /** ANCHOR TO CENTER X,Y WITH CUSTOM HEIGHT, WIDTH
    */
    public func anchorCenterSuperview(widthOf: NSLayoutDimension? = nil, widthConstant: CGFloat = 0, heightOf : NSLayoutDimension? = nil, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
        
        if let widthOf = widthOf {
            widthAnchor.constraint(equalTo: widthOf, constant: widthConstant).isActive = true
        } else {
            widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        }
        
        if let heightOf = heightOf {
            heightAnchor.constraint(equalTo: heightOf, constant: heightConstant).isActive = true
        } else {
            heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        }
    }
    
    /** ANCHOR JUST TOP AND BOTTOM
    */
    public func anchorTopBottom(topOf: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, bottomOf: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let topOf = topOf {
            anchors.append(topAnchor.constraint(equalTo: topOf, constant: topConstant))
        }
        
        if let bottomOf = bottomOf {
            anchors.append(bottomAnchor.constraint(equalTo: bottomOf, constant: bottomConstant))
        }
        
        anchors.forEach({$0.isActive = true})
    }
    
    /** ANCHOR JUST HEIGHT AND WIDTH
    */
    public func anchorHeightWidthWithConstantOrMultiplier(heightOf: NSLayoutDimension? = nil, heightConstant: CGFloat = 0,heightMultiplier : CGFloat = 1, widthOf: NSLayoutDimension? = nil, widthConstant: CGFloat = 0, widthMultiplier : CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let heightOf = heightOf {
            if heightConstant != 0 {
                anchors.append(heightAnchor.constraint(equalTo: heightOf, constant: heightConstant))
            } else {
                if heightMultiplier == 0 {
                    print(printWarning + "You will not be able to see your view because you set the height anchor's multlipier to zero.")
                }
                anchors.append(heightAnchor.constraint(equalTo: heightOf, multiplier: heightMultiplier))
            }
        } else {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        if let widthOf = widthOf {
            if widthConstant != 0 {
                anchors.append(widthAnchor.constraint(equalTo: widthOf, constant: widthConstant))
            } else {
                if widthMultiplier == 0 {
                    print(printWarning + "You will not be able to see your view because you set the width anchor's multlipier to zero.")
                }
                anchors.append(widthAnchor.constraint(equalTo: widthOf, multiplier: widthMultiplier))
            }
        } else {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        anchors.forEach({$0.isActive = true})
    }
    
    /** ANCHOR JUST LEFT AND RIGHT
    */
    public func anchorLeftRight(leftOf : NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, rightOf : NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let leftOf = leftOf {
            anchors.append(leftAnchor.constraint(equalTo: leftOf,constant: leftConstant))
        }
        
        if let rightOf = rightOf {
            anchors.append(rightAnchor.constraint(equalTo: rightOf,constant: rightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
    }
    
    /** ANCHOR CENTER Y TO RIGHT OR LEFT
    */
    public func anchorCenterYToRightOrLeft(anchorToCenterYOf: NSLayoutYAxisAnchor, centerYConstant: CGFloat = 0, anchorToRightOf: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0, anchorToLeftOf: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, width: NSLayoutDimension? = nil, widthConstant: CGFloat = 0, height: NSLayoutDimension? = nil, heightConstant : CGFloat = 0 ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        anchors.append(centerYAnchor.constraint(equalTo: anchorToCenterYOf,constant: centerYConstant))
        
        if let anchorToRightOf = anchorToRightOf {
            anchors.append(rightAnchor.constraint(equalTo: anchorToRightOf,constant: rightConstant))
        }
        
        if let anchorToLeftOf = anchorToLeftOf {
            anchors.append(leftAnchor.constraint(equalTo: anchorToLeftOf,constant: leftConstant))
        }
        
        if let width = width {
            anchors.append(widthAnchor.constraint(equalTo: width,constant: widthConstant))
        } else {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if let height = height {
            anchors.append(heightAnchor.constraint(equalTo: height,constant: heightConstant))
        } else {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
    }
    
    /** ANCHOR CENTER X TO TOP OR BOTTOM
    */
    public func anchorCenterXToTopOrBottomOf(centerXOf : NSLayoutXAxisAnchor, topOf : NSLayoutYAxisAnchor? = nil, bottomOf: NSLayoutYAxisAnchor? = nil, widthOf : NSLayoutDimension? = nil, heightOf : NSLayoutDimension? = nil, topConstant : CGFloat = 0, centerXConstant : CGFloat = 0, bottomConstant : CGFloat = 0, widthConstant : CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        anchors.append(centerXAnchor.constraint(equalTo: centerXOf, constant: centerXConstant))
        
        if let topOf = topOf {
            anchors.append(topAnchor.constraint(equalTo: topOf, constant: topConstant))
        }
        
        if let bottomOf = bottomOf {
            anchors.append(bottomAnchor.constraint(equalTo: bottomOf, constant: bottomConstant))
        }
        
        if let widthOf = widthOf {
            anchors.append(widthAnchor.constraint(equalTo: widthOf, constant: widthConstant))
        } else {
            if widthConstant != 0 {
                anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
            }
        }
        
        if let heightOf = heightOf {
            anchors.append(heightAnchor.constraint(equalTo: heightOf, constant: heightConstant))
        } else {
            if heightConstant != 0 {
                anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
            }
        }
        
        anchors.forEach({$0.isActive = true})
    }
    
    /** ANCHOR TO CENTER WITH WIDTH,HEIGHT
    */
    public func anchorToCenterOf(centerXOf : NSLayoutXAxisAnchor, centerYOf : NSLayoutYAxisAnchor, widthOf: NSLayoutDimension? = nil, heightOf: NSLayoutDimension? = nil, centerXConstant: CGFloat = 0, centerYConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        // centerX and centerY are required
        anchors.append(centerXAnchor.constraint(equalTo: centerXOf, constant: centerXConstant))
        anchors.append(centerYAnchor.constraint(equalTo: centerYOf, constant: centerYConstant))
        
        if let widthOf = widthOf {
            anchors.append(widthAnchor.constraint(equalTo: widthOf, constant: widthConstant))
        } else {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if let heightOf = heightOf {
            anchors.append(heightAnchor.constraint(equalTo: heightOf, constant: heightConstant))
        } else {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
    }
    
    /** ANCHOR TOP,BOTTOM AND LEFT,RIGHT
    */
    public func anchorTopOrBottomAndLeftOrRight(topOf: NSLayoutYAxisAnchor? = nil, leftOf: NSLayoutXAxisAnchor? = nil, bottomOf: NSLayoutYAxisAnchor? = nil, rightOf: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let topOf = topOf {
            anchors.append(topAnchor.constraint(equalTo: topOf, constant: topConstant))
        }
        
        if let leftOf = leftOf {
            anchors.append(leftAnchor.constraint(equalTo: leftOf, constant: leftConstant))
        }
        
        if let bottomOf = bottomOf {
            anchors.append(bottomAnchor.constraint(equalTo: bottomOf, constant: bottomConstant))
        }
        
        if let rightOf = rightOf {
            anchors.append(rightAnchor.constraint(equalTo: rightOf, constant: rightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
    }
}
