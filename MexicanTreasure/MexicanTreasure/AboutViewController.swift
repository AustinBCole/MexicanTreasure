//
//  AboutViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/27/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Dark Mode or not
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            darkModeEnabled()
        } else {
            darkModeDisabled()
        }
    }
    
    private func darkModeEnabled() {
        self.view.backgroundColor = .black
    }
    
    private func darkModeDisabled() {
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
