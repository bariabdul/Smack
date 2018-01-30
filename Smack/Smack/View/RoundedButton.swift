//
//  RoundedButton.swift
//  Smack
//
//  Created by Bari Abdul on 1/29/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }

}
