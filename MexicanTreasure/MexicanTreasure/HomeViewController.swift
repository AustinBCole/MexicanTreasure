//
//  HomeViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/27/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private var settingsTableViewOriginalFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    private var cancelButtonOriginalFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    //    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var settingsTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet var menuButtonCollection: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mexican_treasure_home_resized_smaller")!)
        settingsTableView.layer.cornerRadius = 10
        //        cancelButton.layer.cornerRadius = 10
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        cancelButton.layer.cornerRadius = 10
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        settingsTableViewOriginalFrame = settingsTableView.frame
        cancelButtonOriginalFrame = cancelButton.frame
        
        UserDefaults.standard.set(15, forKey: "fontSize")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Dark Mode or not
        settingsTableView.reloadData()
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            darkModeEnabled()
        } else {
            darkModeDisabled()
        }
        setFontSize()
    }
    
    @IBAction func restartGameButtonTapped(_ sender: Any) {
        StoryTree.shared.resetStoryTree()
    }
    @IBAction func settingsButtonTapped(_ sender: Any) {
        animateSettingsView()
        
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        deanimateSettingsView()
    }
    private func animateSettingsView() {
        let animationDuration = 2.0
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                self.settingsTableView.frame = CGRect(x: self.view.frame.midX - 125, y: self.view.frame.midY + self.view.frame.height * 0.2, width: 250, height: 140)
                
                self.cancelButton.frame = CGRect(x: self.view.frame.midX - 125, y: self.settingsTableView.frame.maxY + 20, width: 250, height: 50)
              
            })
        }, completion: nil)
    }
    private func deanimateSettingsView() {
        let animationDuration = 2.0
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                self.settingsTableView.frame = self.settingsTableViewOriginalFrame
                
                self.cancelButton.frame = self.cancelButtonOriginalFrame
            })
        }, completion: nil)
    }
    @objc
    private func presentToggleDarkModeVC() {
        performSegue(withIdentifier: "DarkModeSegue", sender: nil)
    }
    @objc
    private func changeTextSizeVC() {
        performSegue(withIdentifier: "FontSizeSegue", sender: nil)
    }
    
    private func darkModeEnabled() {
        settingsTableView.reloadData()
        for button in menuButtonCollection {
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
        }
        settingsTableView.backgroundColor = .black
        cancelButton.backgroundColor = .black
        cancelButton.setTitleColor(.white, for: .normal)
        settingsTableView.tableFooterView?.backgroundColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func darkModeDisabled() {
        for button in menuButtonCollection {
            button.backgroundColor = .white
            button.setTitleColor(self.view.tintColor, for: .normal)
        }
        settingsTableView.backgroundColor = .white
        cancelButton.backgroundColor = .white
        cancelButton.setTitleColor(self.view.tintColor, for: .normal)
        settingsTableView.tableFooterView?.backgroundColor = .white
    }
    private func setFontSize() {
        for button in menuButtonCollection {
            button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(UserDefaults.standard.double(forKey: "fontSize")))
        }
        settingsTableView.reloadData()
    }
    
    //MARK: TableView Delegate and Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "darkModeEnabled")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.formatSettingsLabel(isDarkModeEnabled: isDarkModeEnabled)
            let settingsLabel = cell.contentView.subviews[0] as! UILabel
            
        default:
            cell.formatButton(index: indexPath.row, isDarkModeEnabled: isDarkModeEnabled)
            let settingsButton = cell.contentView.subviews[0] as! UIButton
            if indexPath.row == 1 {
            settingsButton.addTarget(self, action: #selector(presentToggleDarkModeVC), for: .touchUpInside)
                
            } else {
                settingsButton.addTarget(self, action: #selector(changeTextSizeVC), for: .touchUpInside)
            }
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
}
