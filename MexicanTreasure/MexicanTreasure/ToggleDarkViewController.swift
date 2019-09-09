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
        
    }
    @IBAction func darkModeSwitchToggled(_ sender: Any) {
        if darkModeSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "darkModeEnabled")
            darkModeEnabled()
        } else {
            
            UserDefaults.standard.set(false, forKey: "darkModeEnabled")
            darkModeDisabled()
        }
    }
    
    private func darkModeEnabled() {
        self.toggleDarkModeLabel.textColor = .white
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
    private func darkModeDisabled() {
        self.toggleDarkModeLabel.textColor = .black
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UINavigationBar().barTintColor
        self.navigationController?.navigationBar.tintColor = UINavigationBar().tintColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
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
