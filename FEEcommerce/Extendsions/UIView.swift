//
//  UIView.swift
//  FEEcommerce
//
//  Created by Pham Hung on 2/11/22.
//

import Foundation
import UIKit

extension UIView{
    var x: CGFloat {
        return frame.origin.x
    }
    
    var y: CGFloat {
        return frame.origin.y
    }
    
    @IBInspectable var fCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            if newValue == -1 {
                layer.cornerRadius = frame.width < frame.height ? frame.width * 0.5 : frame.height * 0.5
            } else {
                layer.cornerRadius = newValue
            }
            clipsToBounds = true
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var fBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var fBorderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.isHidden = true
            self.alpha = 0.0
        }, completion: completion)
    }
}
