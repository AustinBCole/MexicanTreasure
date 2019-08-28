//
//  HomeViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/27/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var settingsViewController = SettingsViewController()
    @IBOutlet weak var settingsView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mexican_treasure_home_resized_smaller")!)
    }
    
    @IBAction func restartGameButtonTapped(_ sender: Any) {
        StoryTree.shared.resetStoryTree()
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        animateSettingsView()
        
    }
    private func animateSettingsView() {
        let animationDuration = 3.0
        let position: CGFloat = 100.0
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                self.settingsView.frame = CGRect(x: self.settingsView.frame.midX, y: 20, width: 100, height: 100)
                self.deactivateConstraints(targetedView: self.settingsView)
                self.setNewSettingsViewConstraints()
            })
        }, completion: { completed in
            if completed {
                
            }
        })
    }
    private func deactivateConstraints(targetedView: UIView) {
        for constraint in targetedView.constraints {
            constraint.isActive = false
        }
    }
    private func setNewSettingsViewConstraints() {
        let bottomConstraint = NSLayoutConstraint(item: settingsView,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 20)
        let widthConstraint = NSLayoutConstraint(item: settingsView,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .width,
                                                   multiplier: 1.0,
                                                   constant: 100)
        let heightConstraint = NSLayoutConstraint(item: settingsView,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .height,
                                                    multiplier: 1.0,
                                                    constant: 100)
        let centerXConstraint = NSLayoutConstraint(item: settingsView,
                                                  attribute: .centerX,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .centerX,
                                                  multiplier: 1.0,
                                                  constant: 0)
        NSLayoutConstraint.activate([bottomConstraint, widthConstraint, heightConstraint, centerXConstraint])
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
