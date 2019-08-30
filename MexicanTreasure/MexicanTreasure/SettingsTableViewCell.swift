//
//  SettingsTableViewCell.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/30/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    func formatSettingsLabel() {
        let settingsLabel = UILabel()
        self.addSubview(settingsLabel)
        settingsLabel.frame = CGRect(x: self.bounds.midX - 34, y: 0, width: 100, height: 50)
        settingsLabel.text = "Settings"
        settingsLabel.textColor = .darkGray
    }
    func formatSettingsLabel() {
        
    }
}
