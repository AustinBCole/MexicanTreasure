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
    @IBOutlet weak var settingsStackView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var settingsView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mexican_treasure_home_resized_smaller")!)
        settingsView.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
    }
    
    @IBAction func restartGameButtonTapped(_ sender: Any) {
        StoryTree.shared.resetStoryTree()
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        animateSettingsView()
        
    }
    private func animateSettingsView() {
        let animationDuration = 3.0
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                self.settingsStackView.frame = CGRect(x: 0, y: self.view.frame.midY + self.view.frame.height * 0.2, width: 200, height: 150)

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
