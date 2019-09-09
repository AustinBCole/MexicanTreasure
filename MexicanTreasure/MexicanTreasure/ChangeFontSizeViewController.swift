//
//  ChangeFontSizeViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 9/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class ChangeFontSizeViewController: UIViewController {
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var fontStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontStepper.minimumValue = 12
        fontStepper.maximumValue = 30
        fontStepper.autorepeat = false
        fontStepper.stepValue = 1
        fontStepper.value = 15
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Dark Mode or not
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            darkModeEnabled()
        }
        
    }
    @IBAction func fontStepperWasTapped(_ sender: Any) {
        stepperLabel.text = "The current number is \(fontStepper.value)"
        UserDefaults.standard.set(fontStepper.value, forKey: "fontSize")
        stepperLabel.font = UIFont.systemFont(ofSize: CGFloat(fontStepper.value))
    }
    
    
    private func darkModeEnabled() {
        self.view.backgroundColor = .black
        stepperLabel.textColor = .white
        fontStepper.layer.backgroundColor = UIColor.white.cgColor
        
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
