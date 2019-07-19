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
    
    //MARK: Private Properties
    private var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateLabelsText()
    }
    @IBAction func restartGameButtonTapped(_ sender: Any) {
    }
    
    //MARK: Private Methods
    private func populateLabelsText() {
        let player = guardPlayer()
        nameLabel.text = player.getName()
        strengthLabel.text = String(player.getStat(stat: .strength))
        agilityLabel.text = String(player.getStat(stat: .agility))
        ancientLanguagesLabel.text = String(player.getStat(stat: .ancientLanguages))
        infamyLabel.text = String(player.getInfamy())
    }
    private func guardPlayer() -> Player {
        let player = self.player ?? Player(statsDict: [.strength: 0, .agility: 0, .ancientLanguages: 0], name: "Corrupted", infamy: 0)
        return player
    }
    //MARK: Internal Methods
    internal func setPlayer(player: Player) {
        self.player = player
    }
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
