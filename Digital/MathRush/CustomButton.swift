//
//  CustomButton.swift
//  MathRush
//
//  Created by Ifeoluwa King on 06/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.width/2
    }

}
