//
//  NiceButton.swift
//  COTWorld
//
//  Created by Karol Zmyslowski on 12.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class RoundlyButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.height / 2
        backgroundColor = UIColor(red: 86/255, green: 146/255, blue: 183/255, alpha: 1)
        layer.shadowOpacity = 0.8
        layer.borderWidth = 0
        layer.shadowColor = UIColor(red: 86/255, green: 146/255, blue: 183/255, alpha: 0.6).cgColor
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.cornerRadius = 5
    }
}
