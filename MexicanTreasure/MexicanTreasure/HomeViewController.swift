//
//  HomeViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/27/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private var settingsViewController = SettingsViewController()
//    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var settingsTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mexican_treasure_home_resized_smaller")!)
        settingsTableView.layer.cornerRadius = 10
//        cancelButton.layer.cornerRadius = 10
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
    }
    
    @IBAction func restartGameButtonTapped(_ sender: Any) {
        StoryTree.shared.resetStoryTree()
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
//        animateSettingsView()
        
    }
    private func animateSettingsView() {
        let animationDuration = 3.0
        let position: CGFloat = 100.0
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
//                self.settingsStackView.frame = CGRect(x: 0, y: self.view.frame.midY + self.view.frame.height * 0.2, width: 200, height: 150)

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsTableViewCell
        
        switch indexPath.row {
        case 0:
//            cell.formatSettingsLabel()
            cell.formatSettingsLabel()
        default:
            cell.formatButton(index: indexPath.row)
        }
        cell.contentMode = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row != 2 {
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
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
