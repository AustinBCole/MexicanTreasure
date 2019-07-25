//
//  StoryTree.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class StoryTree {
    
    //MARK: Singleton
    static let shared = StoryTree()
    private init () {}
    
    internal var storyDelegate: StoryDelegate?
    
    private var originalStoryTreeNode: StoryTreeNode = StoryTreeNode(fileName: "opening", uniqueID: 1, requiredStatsDict: nil, next: [], choiceText: nil)
    private var storyTreeNode: StoryTreeNode = StoryTreeNode(fileName: "opening", uniqueID: 1, requiredStatsDict: nil, next: [], choiceText: nil)
    
    //MARK: Internal Methods
    internal func initializeStoryTree() {
        let friendScout = StoryTreeNode(fileName: "friend_scout", uniqueID: 15, requiredStatsDict: nil, next: [], choiceText: "You decide that you and yoru friend should scout out the area before going after the treasure.")
        let friendTogether = StoryTreeNode(fileName: "friend_together", uniqueID: 14, requiredStatsDict: nil, next: [], choiceText: "You decide that you and your friend should go search for the treasure immediately.")
        let aloneWithoutRobber = StoryTreeNode(fileName: "alone_without_robber", uniqueID: 13, requiredStatsDict: nil, next: [], choiceText: "You decide that you don't trust the robber and sneak off to get the treasure alone.")
        let robberAlone = StoryTreeNode(fileName: "robber_alone", uniqueID: 12, requiredStatsDict: nil, next: [], choiceText: "You decide that the robber should risk his neck alone.")
        let robberScout = StoryTreeNode(fileName: "robber_scout", uniqueID: 11, requiredStatsDict: nil, next: [], choiceText: "You decide that the two of you should spend some time scouting out the area.")
        let robberTogetherGetIt = StoryTreeNode(fileName: "robber_together_get_it", uniqueID: 10, requiredStatsDict: nil, next: [], choiceText: "You decide that you had best stick together and go to get the treasure.")
        let fly = StoryTreeNode(fileName: "fly", uniqueID: 9, requiredStatsDict: nil, next: [friendTogether, friendScout], choiceText: nil)
        let flee = StoryTreeNode(fileName: "flee", uniqueID: 8, requiredStatsDict: [.strength: 1], next: [robberTogetherGetIt, robberScout, robberAlone, aloneWithoutRobber], choiceText: "The robber must know what is going on. You bust the robber out of jail.")
        let mexico = StoryTreeNode(fileName: "mexico", uniqueID: 7, requiredStatsDict: nil, next: [], choiceText: "You decide to go it alone and do your own research.")
        let friend = StoryTreeNode(fileName: "friend", uniqueID: 6, requiredStatsDict: nil, next: [fly], choiceText:  "You get help from an archeaoligist friend.")
        let theft = StoryTreeNode(fileName: "theft", uniqueID: 5, requiredStatsDict: nil, next: [friend, mexico, flee], choiceText: "You hide in a closet.")
        let defend = StoryTreeNode(fileName: "defend", uniqueID: 4, requiredStatsDict: nil, next: [friend, mexico], choiceText: "You run for your handgun to shoot the robber.")
        let pizza = StoryTreeNode(fileName: "pizza", uniqueID: 3, requiredStatsDict: nil, next: [], choiceText: "You make the robber a pizza as a peace offering and hope he leaves.")
        let robber = StoryTreeNode(fileName: "robber", uniqueID: 2, requiredStatsDict: nil, next: [pizza, defend, theft], choiceText: nil)
        let opening = StoryTreeNode(fileName: "opening", uniqueID: 1, requiredStatsDict: nil, next: [robber], choiceText: nil)
        self.originalStoryTreeNode = opening
        self.storyTreeNode = opening
        
    }
    
    internal func getScene() -> StoryTreeNode {
        return storyTreeNode
    }
    internal func advanceToNextScene(index: Int, player: Player) {
        if player.doesMeetSceneStatRequirements(scene: self.storyTreeNode.next[index]) {
            storyTreeNode = storyTreeNode.next[index]
            storyDelegate?.storyHasChanged()
        }
    }
    internal func resetStoryTree() {
        self.storyTreeNode = originalStoryTreeNode
        storyDelegate?.storyHasChanged()
    }
}
