//
//  StoryViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UIScrollViewDelegate {
    
    private let storyScrollView = UIScrollView()
    private let storyContentView = UIView()
    private let storyTextLabel = UILabel()
    private let nextButton = UIButton()
    private let choicesTableView = SelfSizedTableView()
    private let choicesTableViewController = ChoicesTableViewController()
    private let player: Player? = nil
    private let storyTree = StoryTree()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        storyScrollView.delegate = self
        choicesTableViewController.tableView = choicesTableView
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc
    private func nextButtonTapped() {
        choiceAlgorithm()
        toggleChoicesTableViewAndNextButton()
    }
    //MARK: Private Methods
    private func choiceAlgorithm() {
        // Check to see if the choice requires a specific stat
        let player = Player.guardPlayer(player: self.player)
        let scene = storyTree.storyTreeNode
        // If the player does meet the stat requirement for choice
        if player.doesMeetSceneStatRequirements(scene: scene) {
            // Player can make choice
            // Update story text with new scene text
            updateStoryText(scene: scene)
            // If there are choices associated with new scene
            if scene.getNextScenes.count != 0 {
                // Update the table view to display the new choices associated with that scene
                updateChoicesTableView(scene: scene)
            }
            // Else
            else {
                // Display the "next" button
                toggleChoicesTableViewAndNextButton()
            }
        }
        // Base case for now is just return
        return
    }
    private func toggleChoicesTableViewAndNextButton() {
        toggleChoicesTableView()
        toggleNextButton()
    }
    private func toggleChoicesTableView() {
        if storyContentView.subviews.contains(choicesTableView) {
            choicesTableView.removeFromSuperview()
        }
        else {
            storyContentView.addSubview(choicesTableView)
        }
    }
    private func toggleNextButton() {
        if storyContentView.subviews.contains(nextButton) {
            nextButton.removeFromSuperview()
        }
        else {
            storyContentView.addSubview(nextButton)
        }
    }
    
    private func updateStoryText(scene: StoryTreeNode) {
        storyTextLabel.text = scene.readFromFile()
    }
    private func updateChoicesTableView(scene: StoryTreeNode) {
        let choices = scene.getNextScenes()
        choicesTableViewController.setChoices(choices: choices)
    }
    
    private func createViews() {
        formatStoryScrollView()
        formatStoryContentView()
        formatStoryTextLabel()
        formatNextButton()
    }
    
    private func formatStoryContentView() {
        storyContentView.translatesAutoresizingMaskIntoConstraints = false
        storyScrollView.addSubview(storyContentView)
        
        let topConstraint = NSLayoutConstraint(item: storyContentView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 60)
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
        storyTextLabel.text = "Hello world. Let's see if this word wraps appropriately, and if the container view goes down. Whoohoo! Hopefully these words are enough to accomplish the purpose."
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
        choicesTableView.translatesAutoresizingMaskIntoConstraints = false
        choicesTableView.delegate = choicesTableViewController
        choicesTableView.dataSource = choicesTableViewController
        choicesTableView.isScrollEnabled = false
        choicesTableView.maxHeight = 372
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
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint])
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
}
