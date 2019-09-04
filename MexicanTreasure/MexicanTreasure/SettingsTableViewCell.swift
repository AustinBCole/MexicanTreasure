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
        settingsLabel.textColor = .gray
        settingsLabel.font = .boldSystemFont(ofSize: 14)

    }
    func formatButton(index: Int) {
        let button = UIButton(type: .system)
        self.contentView.addSubview(button)
        button.frame = CGRect(x: self.bounds.midX - 100, y: 0, width: 200, height: 50)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)

        switch index {
        case 1:
            button.setTitle("Choose Text Color", for: .normal)
            
        default:
            button.setTitle("Choose Text Size", for: .normal)
        }
    }
}
