//
//  Scene.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

///This object contains information relevant to a scene in the story.
public class StoryTreeNode {
    
    init(fileName: String, uniqueID: Int, requiredStatsDict: [Stats: Int]?, next: [StoryTreeNode], choiceText: String?) {
        self.fileName = fileName
        self.uniqueID = uniqueID
        self.requiredStatsDict = requiredStatsDict
        self.next = next
        self.choiceText = choiceText
    }
    
    ///This is the name of the scene's file.
    private let fileName: String
    ///The unique ID associated with this scene. The unique ID can be any integer, though it is recommended to use some kind of ordered system of IDing each scene.
    private let uniqueID: Int
    ///This dictionary takes a Stats enum case as a key, and the required level of the desired sat as a value.
    private let requiredStatsDict: [Stats: Int]?
    ///This is an array of nodes adjacent to this node.
    private let next: [StoryTreeNode]
    ///This is the text that the user will see in the choices table view.
    private let choiceText: String?
    ///This boolean is true if the player meets the scene's stat requirements, or false if not.
    private var isEnabled = true
    
    internal func readFromFile() -> String {
        let file = self.fileName
        let path = Bundle.main.path(forResource: file, ofType: "txt", inDirectory: "StoryFiles")
        let text: String
        do {
            text = try String(contentsOfFile: path!, encoding: .utf8)
        } catch {
            fatalError()
        }
        return text
    }
    internal func getNextScenes() -> [StoryTreeNode] {
        return self.next
    }
    internal func getUniqueID() -> Int {
        return self.uniqueID
    }
    internal func getRequiredStatsDict() -> [Stats: Int]? {
        return self.requiredStatsDict
    }
    internal func getchoiceText() -> String? {
        return self.choiceText
        
    }
    
}
