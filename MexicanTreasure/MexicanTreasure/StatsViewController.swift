//
//  StatsViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var agilityLabel: UILabel!
    @IBOutlet weak var ancientLanguagesLabel: UILabel!
    @IBOutlet weak var infamyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateLabelsText()
    }
    @IBAction func restartGameButtonTapped(_ sender: Any) {
        StoryTree.shared.resetStoryTree()
    }
    
    //MARK: Private Methods
    private func populateLabelsText() {
        let player = StoryTree.shared.getPlayer()
        nameLabel.text = player.getName()
        strengthLabel.text = String(player.getStat(stat: .strength))
        agilityLabel.text = String(player.getStat(stat: .agility))
        ancientLanguagesLabel.text = String(player.getStat(stat: .ancientLanguages))
        infamyLabel.text = String(player.getInfamy())
    }

    //MARK: Internal Methods
    
    //MARK: Public Methods
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
