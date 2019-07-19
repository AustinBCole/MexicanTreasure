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
    private let choicesTableViewController = ChoicesTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        storyScrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private func createViews() {
        formatStoryScrollView()
        formatStoryContentView()
        createStoryTextLabel()
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
    
    private func createStoryTextLabel() {
        let storyTextLabel = UILabel()
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
    
    private func createChoicesTableView() {
        let choicesTableView = SelfSizedTableView()
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
    //MARK: UIScrollViewDelegate Methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}
