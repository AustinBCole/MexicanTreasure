//
//  Scene.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class StoryTreeNode {
    
    init(fileName: String, uniqueID: Int, requiredStatsDict: [Stats: Int]?, next: [StoryTreeNode], choiceText: String?) {
        self.fileName = fileName
        self.uniqueID = uniqueID
        self.requiredStatsDict = requiredStatsDict
        self.next = next
        self.choiceText = choiceText
    }
    
    let fileName: String
    let uniqueID: Int
    let requiredStatsDict: [Stats: Int]?
    let next: [StoryTreeNode]
    let choiceText: String?
    
    internal func readFromFile() -> String {
        let file = self.fileName
        let path = Bundle.main.path(forResource: file, ofType: "txt")
        let text: String
        do {
            text = try String(contentsOfFile: path!, encoding: .utf8)
        } catch {
            fatalError()
        }
        return text
    }
    internal func getNextScenes() -> [StoryTreeNode] {
        return next
    }
    internal func getUniqueID() -> Int {
        return uniqueID
    }
    internal func getRequiredStatsDict() -> [Stats: Int]? {
        return requiredStatsDict
    }
    
}
