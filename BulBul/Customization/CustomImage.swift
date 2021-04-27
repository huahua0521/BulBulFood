//
//  CustomImage.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/20.
//

import UIKit

class CustomImage: UIImageView {

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let coupleImage = UIImage(named: "mymask")
        let coupleImageView = UIImageView(image: coupleImage)
        coupleImageView.contentMode = .scaleAspectFill
        coupleImageView.frame  = self.bounds
        self.mask = coupleImageView
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

    
    
}
