//
//  AboutViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 8/27/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var writtenByLabel: UILabel!
    @IBOutlet weak var developedByLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Dark Mode or not
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            darkModeEnabled()
        } else {
            darkModeDisabled()
        }
    }
    
    private func darkModeEnabled() {
        self.view.backgroundColor = .black
        writtenByLabel.textColor = .white
        developedByLabel.textColor = .white
    }
    
    private func darkModeDisabled() {
        self.view.backgroundColor = .white
        writtenByLabel.textColor = .black
        developedByLabel.textColor = .black
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
