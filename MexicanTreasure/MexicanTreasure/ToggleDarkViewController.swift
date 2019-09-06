//
//  ToggleDarkViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 9/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class ToggleDarkViewController: UIViewController {

    @IBOutlet weak var toggleDarkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add Dark Mode Observers
        NotificationCenter.default.addObserver(self, selector: #selector(darkModeEnabled(_:)), name: .darkModeEnabled, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(darkModeDisabled(_:)), name: .darkModeDisabled, object: nil)
    }
    @IBAction func darkModeSwitchToggled(_ sender: Any) {
        if darkModeSwitch.isOn == true {
            UserDefaults.standard.set(true, forKey: "darkModeEnabled")
            NotificationCenter.default.post(name: .darkModeEnabled, object: nil)
            
        } else {
            
            UserDefaults.standard.set(false, forKey: "darkModeEnabled")
            NotificationCenter.default.post(name: .darkModeDisabled, object: nil)
        }
    }
    
    @objc private func darkModeEnabled(_ notification: Notification) {
        self.toggleDarkModeLabel.textColor = .white
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black

    }
    
    @objc private func darkModeDisabled(_ notification: Notification) {
        // Write your non-dark mode code here
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
