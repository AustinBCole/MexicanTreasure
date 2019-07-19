//
//  StoryViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    private let storyScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        // Do any additional setup after loading the view.
    }
    
    private func createViews() {
        formatStoryScrollView()
        createStoryTextLabel()
    }
    
    private func formatStoryScrollView() {
        storyScrollView.translatesAutoresizingMaskIntoConstraints = false
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
        storyScrollView.addSubview(storyTextLabel)
        
        let topConstraint = NSLayoutConstraint(item: storyTextLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: storyScrollView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: storyTextLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: storyScrollView,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: storyTextLabel,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: storyScrollView,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint])
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
