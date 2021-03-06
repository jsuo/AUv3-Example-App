//
//  ButtonStyleKit.swift
//  UISynthSpike
//
//  Created by Matthew Fecher on 7/22/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//

import UIKit

public class ButtonStyleKit: NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawRoundButton(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 34, height: 34), resizing: ResizingBehavior = .aspectFit, isToggled: Bool = false) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 34, height: 34), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 34, y: resizedFrame.height / 34)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 34, resizedFrame.height / 34)

        //// Color Declarations
        let orange = UIColor(red: 0.902, green: 0.533, blue: 0.008, alpha: 1.000)
        let gray = UIColor(red: 0.306, green: 0.306, blue: 0.325, alpha: 1.000)
        let darkerGray = UIColor(red: 0.243, green: 0.243, blue: 0.263, alpha: 1.000)

        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = orange
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 8

        //// buttonOff
        //// buttonBackground 2 Drawing
        let buttonBackground2Path = UIBezierPath(ovalIn: CGRect(x: 2, y: 2, width: 30, height: 30))
        gray.setFill()
        buttonBackground2Path.fill()

        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 15, y: 11, width: 4, height: 12))
        darkerGray.setFill()
        rectangle2Path.fill()

        if (isToggled) {
            //// buttonOn
            //// buttonBackground Drawing
            let buttonBackgroundPath = UIBezierPath(ovalIn: CGRect(x: 2, y: 2, width: 30, height: 30))
            gray.setFill()
            buttonBackgroundPath.fill()

            //// Rectangle Drawing
            let rectanglePath = UIBezierPath(rect: CGRect(x: 15, y: 11, width: 4, height: 12))
            context.saveGState()
            context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
            orange.setFill()
            rectanglePath.fill()
            context.restoreGState()

        }

        context.restoreGState()

    }

    @objc(ButtonStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
