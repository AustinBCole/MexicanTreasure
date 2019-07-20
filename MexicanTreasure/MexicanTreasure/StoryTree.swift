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
    
    //MARK: Internal Methods
    internal func initializeStoryTree() {
        let friendScout = StoryTreeNode(fileName: "friend_scout", uniqueID: 15, requiredStatsDict: nil, next: [])
        let friendTogether = StoryTreeNode(fileName: "friend_together", uniqueID: 14, requiredStatsDict: nil, next: [])
        let aloneWithoutRobber = StoryTreeNode(fileName: "alone_without_robber", uniqueID: 13, requiredStatsDict: nil, next: [])
        let robberAlone = StoryTreeNode(fileName: "robber_alone", uniqueID: 12, requiredStatsDict: nil, next: [])
        let robberScout = StoryTreeNode(fileName: "robber_scout", uniqueID: 11, requiredStatsDict: nil, next: [])
        let robberTogetherGetIt = StoryTreeNode(fileName: "robber_together_get_it", uniqueID: 10, requiredStatsDict: nil, next: [])
        let fly = StoryTreeNode(fileName: "fly", uniqueID: 9, requiredStatsDict: nil, next: [friendTogether, friendScout])
        let flee = StoryTreeNode(fileName: "flee", uniqueID: 8, requiredStatsDict: [.strength: 1], next: [robberTogetherGetIt, robberScout, robberAlone, aloneWithoutRobber])
        let mexico = StoryTreeNode(fileName: "mexico", uniqueID: 7, requiredStatsDict: nil, next: [])
        let friend = StoryTreeNode(fileName: "friend", uniqueID: 6, requiredStatsDict: nil, next: [fly])
        let theft = StoryTreeNode(fileName: "theft", uniqueID: 5, requiredStatsDict: nil, next: [friend, mexico, flee])
        let defend = StoryTreeNode(fileName: "defend", uniqueID: 4, requiredStatsDict: nil, next: [friend, mexico])
        let pizza = StoryTreeNode(fileName: "pizza", uniqueID: 3, requiredStatsDict: nil, next: [])
        let robber = StoryTreeNode(fileName: "robber", uniqueID: 2, requiredStatsDict: nil, next: [pizza, defend, theft])
        let opening = StoryTreeNode(fileName: "opening", uniqueID: 1, requiredStatsDict: nil, next: [robber])
        storyTreeNode = opening
        
    }
    
    internal func getScene() -> StoryTreeNode {
        return storyTreeNode
    }
    internal func advanceToNextScene(index: Int) {
        storyTreeNode = storyTreeNode.next[index]
    }
}
