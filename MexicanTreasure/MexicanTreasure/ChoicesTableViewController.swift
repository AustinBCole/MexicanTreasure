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
    private var radioButtonDictionary: [String: String] = [:]
    private let nextButton = UIButton()
    
    
    
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
        if choices.count == 0 {
            return 0
        }
        return choices.count + 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = storyTree.getPlayer()
        let choiceCell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        if indexPath.row == choices.count + 1 - 1 {
            formatNextButton(cell: choiceCell)
            if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
                choiceCell.textLabel?.textColor = .white
                choiceCell.contentView.backgroundColor = .black
            }
            return choiceCell
        }
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
            choiceCell.imageView?.image = UIImage(named: radioButtonDictionary["unselected"]!)
            choiceCell.selectionStyle = .none
            cellArray.append(choiceCell)
            return choiceCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: radioButtonDictionary["selected"]!)
        for cell in cellArray {
            if cell != tableView.cellForRow(at: indexPath) {
                cell.imageView?.image = UIImage(named: radioButtonDictionary["unselected"]!)
            }
        }
        
        
    }
    
    private func formatNextButton(cell: UITableViewCell) {
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(nextButton)
        
        let centerYConstraint = NSLayoutConstraint(item: nextButton,
                                               attribute: .centerY,
                                               relatedBy: .equal,
                                               toItem: nextButton.superview,
                                               attribute: .centerY,
                                               multiplier: 1.0,
                                               constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: nextButton,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: nextButton.superview,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let widthConstraint = NSLayoutConstraint(item: nextButton,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: 100)
        NSLayoutConstraint.activate([centerYConstraint, centerXConstraint, widthConstraint])
        
        if UserDefaults.standard.bool(forKey: "darkModeEnabled") {
            nextButton.setTitleColor(.white, for: .normal)
            nextButton.backgroundColor = .darkGray
        } else {
            nextButton.setTitleColor(.black, for: .normal)
            nextButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        }
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
    }
    
    @objc
    func nextButtonTapped() {
        guard tableView.indexPathForSelectedRow != nil else {return}
        storyTree.advanceToNextScene(index: (tableView?.indexPathForSelectedRow!.row)!)
    }
    
    private func darkModeEnabled() {
        self.tableView.backgroundColor = .black
        self.view.backgroundColor = .black
        radioButtonDictionary["selected"] = "Dark Radio Selected Resized"
        radioButtonDictionary["unselected"] = "Dark Radio Unselected Resized"
    }
    
    private func darkModeDisabled() {
        self.tableView.backgroundColor = .white
        self.view.backgroundColor = .white
        radioButtonDictionary["selected"] = "Radio Selected Resized"
        radioButtonDictionary["unselected"] = "Radio Unselected Resized"
    }
    
}
