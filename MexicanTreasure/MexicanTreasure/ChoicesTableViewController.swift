//
//  ChoicesTableViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class ChoicesTableViewController: UITableViewController {
    
    private let storyTree: StoryTree = StoryTree.shared
    var player: Player?
     
    private var choices: [StoryTreeNode] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //MARK: Internal Methods
    internal func setChoices(choices: [StoryTreeNode]) {
        self.choices = choices
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return choices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let choiceCell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        if let choiceText = choices[indexPath.row].choiceText {
            choiceCell.textLabel?.lineBreakMode = .byWordWrapping
            choiceCell.textLabel?.numberOfLines = 0
            choiceCell.textLabel?.text = choiceText
        }

        return choiceCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = Player.guardPlayer(player: self.player)
        storyTree.advanceToNextScene(index: indexPath.row, player: player)
        
    }
}
