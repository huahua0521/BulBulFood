//
//  CustomButton.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/20.
//

import UIKit

class CustomButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        let coupleImage = UIImage(named: "mymask2")
        let coupleImageView = UIImageView(image: coupleImage)
        coupleImageView.contentMode = .scaleAspectFit
        coupleImageView.frame  = self.bounds
        self.mask = coupleImageView
    }
}
