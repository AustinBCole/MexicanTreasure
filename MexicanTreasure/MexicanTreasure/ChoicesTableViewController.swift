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
    private var cellArray: [UITableViewCell] = []

     
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Dark Mode or not
        tableView.reloadData()
        
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
        let player = storyTree.getPlayer()
        let choiceCell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        if let choiceText = choices[indexPath.row].getchoiceText() {
            choiceCell.textLabel?.lineBreakMode = .byWordWrapping
            choiceCell.textLabel?.numberOfLines = 0
            choiceCell.textLabel?.text = choiceText
        }
        if player.doesMeetSceneStatRequirements(scene: choices[indexPath.row])  == false {
            choiceCell.textLabel?.textColor = .gray
            choiceCell.isUserInteractionEnabled = false
        }
        
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            choiceCell.textLabel?.textColor = .white
            choiceCell.contentView.backgroundColor = .black
            
        }
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            darkModeEnabled()
        } else {
            darkModeDisabled()
        }
        choiceCell.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(UserDefaults.standard.double(forKey: "fontSize")))
        choiceCell.imageView?.image = UIImage(named: "Dark Radio Unselected Resized")
        choiceCell.selectionStyle = .none
        cellArray.append(choiceCell)
        return choiceCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        storyTree.advanceToNextScene(index: indexPath.row)
        tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "Dark Radio Selected Resized")
        for cell in cellArray {
            if cell != tableView.cellForRow(at: indexPath) {
                cell.imageView?.image = UIImage(named:"Dark Radio Unselected Resized")
            }
        }
        
        
    }
    
    private func darkModeEnabled() {
        self.tableView.backgroundColor = .black
        self.view.backgroundColor = .black
    }
    
    private func darkModeDisabled() {
        self.tableView.backgroundColor = .white
        self.view.backgroundColor = .white
    }
    
}
