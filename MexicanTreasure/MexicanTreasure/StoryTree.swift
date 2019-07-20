//
//  StoryTree.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class StoryTree {
    
    init(storyTreeNode: StoryTreeNode) {
        self.storyTreeNode = storyTreeNode
    }
    
    private var storyTreeNode: StoryTreeNode
    
    internal func getScene() -> StoryTreeNode {
        return storyTreeNode
    }
    internal func advanceToNextScene(index: Int) {
        storyTreeNode = storyTreeNode.next[index]
    }
}
