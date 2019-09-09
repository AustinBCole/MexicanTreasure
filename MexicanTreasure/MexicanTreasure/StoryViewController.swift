//
//  StoryViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

enum TableOrButton {
    case choicesTable
    case nextButton
}

class StoryViewController: UIViewController, UIScrollViewDelegate {
    
    private let storyScrollView = UIScrollView()
    private let storyContentView = UIView()
    private let storyTextLabel = UILabel()
    private let nextButton = UIButton()
    private let choicesTableView = IntrinsicTableView()
    private var choicesTableViewController = ChoicesTableViewController()
    private let storyTree = StoryTree.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        storyScrollView.delegate = self
        choicesTableViewController.tableView = choicesTableView
        choicesTableView.delegate = choicesTableViewController
        choicesTableView.dataSource = choicesTableViewController
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        storyTree.initializeStoryTree(storyTreeNodes: nil)
        updateStoryText(scene: storyTree.getScene())
        updateChoicesTableView(scene: storyTree.getScene())
        choicesTableView.isHidden = true
        storyTree.storyDelegate = self
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
        changeFontSize()
    }
    @objc
    private func nextButtonTapped() {
        storyTree.advanceToNextScene(index: 0)
        choiceAlgorithm()
    }
    //MARK: Internal Methods
    internal func choiceAlgorithm() {
        // Check to see if the choice requires a specific stat
        let player = StoryTree.shared.getPlayer()
        let scene = storyTree.getScene()
        // If the player does meet the stat requirement for choice
        if player.doesMeetSceneStatRequirements(scene: scene) {
            // Player can make choice
            // Update story text with new scene text
            updateStoryText(scene: scene)
            // If there are zero or more than one choices associated with new scene
            if scene.getNextScenes().count != 1 {
                // Make sure the choices table is shown
                toggleChoicesTableViewAndNextButton(element: .choicesTable)
                // Update the table view to display the new choices associated with that scene
                updateChoicesTableView(scene: scene)
            }
            // Else
            else {
                // Display the "next" button and hide the choices table
                toggleChoicesTableViewAndNextButton(element: .nextButton)
            }
        }
        // Base case for now is just return
        return
    }
    //MARK: Private Methods
    private func toggleChoicesTableViewAndNextButton(element: TableOrButton) {
        if element == .choicesTable {
        showChoicesTableView()
        }
        else {
        showNextButton()
        }
    }
    private func showChoicesTableView() {
        if choicesTableView.isHidden {
        nextButton.isHidden = true
        choicesTableView.isHidden = false
        }
    }
    private func showNextButton() {
        if nextButton.isHidden {
        choicesTableView.isHidden = true
        nextButton.isHidden = false
        }
    }
    
    private func updateStoryText(scene: StoryTreeNode) {
        storyTextLabel.text = scene.readFromFile()
    }
    private func updateChoicesTableView(scene: StoryTreeNode) {
        let choices = scene.getNextScenes()
        choicesTableViewController.setChoices(choices: choices)
    }
    
    private func changeFontSize() {
        storyTextLabel.font = UIFont.systemFont(ofSize: CGFloat(UserDefaults.standard.double(forKey: "fontSize")))
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(UserDefaults.standard.double(forKey: "fontSize")))
    }
    
    private func createViews() {
        formatStoryScrollView()
        formatStoryContentView()
        formatStoryTextLabel()
        formatNextButton()
        formatChoicesTableView()
    }
    
    private func formatStoryContentView() {
        storyContentView.translatesAutoresizingMaskIntoConstraints = false
        storyScrollView.addSubview(storyContentView)
        
        let topConstraint = NSLayoutConstraint(item: storyContentView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: storyScrollView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 20)
        let leadingConstraint = NSLayoutConstraint(item: storyContentView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: storyContentView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: view,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: storyContentView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 60)
        
        NSLayoutConstraint.activate([topConstraint, trailingConstraint, leadingConstraint, bottomConstraint])
        
    }
    
    private func formatStoryScrollView() {
        storyScrollView.translatesAutoresizingMaskIntoConstraints = false
        var heightOfSubviews: CGFloat = 0
        for subView in storyScrollView.subviews {
            heightOfSubviews += subView.frame.height
        }
        view.addSubview(storyScrollView)
        
        let topConstraint = NSLayoutConstraint(item: storyScrollView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 60)
        let leadingConstraint = NSLayoutConstraint(item: storyScrollView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: storyScrollView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: view,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: storyScrollView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 60)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        
    }
    
    private func formatStoryTextLabel() {
        storyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        storyTextLabel.lineBreakMode = .byWordWrapping
        storyTextLabel.numberOfLines = 0
        storyContentView.addSubview(storyTextLabel)
        
        let topConstraint = NSLayoutConstraint(item: storyTextLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: storyContentView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: storyTextLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: storyContentView,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: storyTextLabel,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: storyContentView,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint])
    }
    
    private func formatChoicesTableView() {
        choicesTableViewController = ChoicesTableViewController()
        choicesTableView.translatesAutoresizingMaskIntoConstraints = false
        choicesTableView.delegate = choicesTableViewController
        choicesTableView.dataSource = choicesTableViewController
        choicesTableView.isScrollEnabled = false
        choicesTableView.separatorStyle = .none
        // The next two properties are for automatically resizing the cells
        choicesTableView.estimatedRowHeight = 85.0
        choicesTableView.rowHeight = UITableView.automaticDimension
        storyContentView.addSubview(choicesTableView)
        
        let topConstraint = NSLayoutConstraint(item: choicesTableView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: storyContentView.subviews[0],
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 8)
        let leadingConstraint = NSLayoutConstraint(item: choicesTableView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: storyContentView,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: choicesTableView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: storyContentView,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: choicesTableView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: storyContentView,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 8)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
    
    private func formatNextButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        storyContentView.addSubview(nextButton)
        
        let topConstraint = NSLayoutConstraint(item: nextButton,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: storyContentView.subviews[0],
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 8)
        let centerXConstraint = NSLayoutConstraint(item: nextButton,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: storyContentView,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0)
        NSLayoutConstraint.activate([topConstraint, centerXConstraint])

        
    }
    //MARK: UIScrollViewDelegate Methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
    
    private func darkModeEnabled() {
        self.view.backgroundColor = .black
        nextButton.backgroundColor = .black
        nextButton.setTitleColor(.white, for: .normal)
        storyTextLabel.textColor = .white
        storyTextLabel.backgroundColor = .black
        storyScrollView.backgroundColor = .black
    }
    
    private func darkModeDisabled() {
        self.view.backgroundColor = .white
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(self.view.tintColor, for: .normal)
        storyTextLabel.textColor = .black
        storyTextLabel.backgroundColor = .white
        storyScrollView.backgroundColor = .white
    }
    
}



extension StoryViewController: StoryDelegate {
    func storyHasChanged() {
        choiceAlgorithm()
    }
    

    
    
}
