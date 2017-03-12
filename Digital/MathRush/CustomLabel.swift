//
//  CustomLabel.swift
//  MathRush
//
//  Created by Ifeoluwa King on 06/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(red: 62/255, green: 176/255, blue: 226/255, alpha: 1).CGColor
        self.layer.cornerRadius = self.frame.size.width/2
        
//        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping:0.3,initialSpringVelocity: 0.3, options: [.CurveEaseIn], animations: {
//            //self.center.x -= 400
//        }) { (Bool) in
//            UIView.animateWithDuration(1, delay: 0.3,usingSpringWithDamping:0.3,initialSpringVelocity: 0.5, options: [.Repeat,.Autoreverse], animations: {
//                self.transform = CGAffineTransformMakeScale(1.2, 1.2)
//                }, completion: nil)
//        }
        
//        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [.CurveEaseIn, .Repeat,.Autoreverse], animations: { 
//            self.transform = CGAffineTransformMakeScale(1.2, 1.2)
//            }, completion: nil)
    }

}
