//
//  SettingsTableViewCell.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/30/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    internal func formatSettingsLabel(isDarkModeEnabled: Bool) {
        let settingsLabel = UILabel()
        self.contentView.addSubview(settingsLabel)
        settingsLabel.frame = CGRect(x: self.bounds.midX - 34, y: 0, width: 100, height: 50)
        settingsLabel.text = "Settings"
        settingsLabel.textColor = .gray
        settingsLabel.font = .boldSystemFont(ofSize: 14)
        
        if isDarkModeEnabled {
            settingsLabel.textColor = .white
            settingsLabel.backgroundColor = .black
            self.contentView.backgroundColor = .black
        } else {
            settingsLabel.textColor = .gray
            settingsLabel.backgroundColor = .white
            self.contentView.backgroundColor = .white
        }
        settingsLabel.font = UIFont.systemFont(ofSize: CGFloat(UserDefaults.standard.double(forKey: "fontSize")) - 2)
    }
    internal func formatButton(index: Int, isDarkModeEnabled: Bool) {
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
        if isDarkModeEnabled {
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            self.contentView.backgroundColor = .black
        } else {
            button.backgroundColor = .white
            button.setTitleColor(self.tintColor, for: .normal)
            self.contentView.backgroundColor = .white
        }
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(UserDefaults.standard.double(forKey: "fontSize")))
    }
}
