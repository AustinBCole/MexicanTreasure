//
//  SettingsViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/27/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsLabel = UILabel()
    private let changeFontSizeButton = UIButton()
    private let darkModeSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createSubviews()
    }

    private func createSubviews() {
        formatSettingsLabel()
    }
    private func formatSettingsLabel() {
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsLabel)
        settingsLabel.textColor = .green
        settingsLabel.text = "Settings"
        
        let topConstraint = NSLayoutConstraint(item: settingsLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 60)
        let leadingConstraint = NSLayoutConstraint(item: settingsLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: settingsLabel,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: view,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: settingsLabel,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: 80)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
