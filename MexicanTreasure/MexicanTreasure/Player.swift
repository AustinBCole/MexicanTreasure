//
//  Player.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

enum Stats: String {
    case strength = "strength"
    case agility = "agility"
    case ancientLanguages = "ancientLanguages"
}

class Player {
    
    //MARK: Singleton
    
    init(statsDict: [Stats: Int], name: String, infamy: Int) {
        self.statsDict = statsDict
        self.name = name
        self.infamy = infamy
    }
    
    var statsDict: [Stats: Int]
    let name: String
    var infamy: Int
    
    //MARK: Static Methods
    static func guardPlayer(player: Player?) -> Player {
        let player = player ?? Player(statsDict: [.strength: 0, .agility: 0, .ancientLanguages: 0], name: "Corrupted", infamy: 0)
        return player
    }
    
    internal func setStat(stat: Stats, value: Int) {
        statsDict[stat] = value
    }
    internal func getStat(stat: Stats) -> Int {
        return statsDict[stat] ?? 0
    }
    internal func getName() -> String {
        return name
    }
    internal func setInfamy(value: Int) {
        infamy = value
    }
    internal func getInfamy() -> Int {
        return infamy
    }
    internal func doesMeetSceneStatRequirements(scene: StoryTreeNode) -> Bool {
        // If the scene has required stats
        if let requiredStatsDict = scene.getRequiredStatsDict() {
            // Loop through the required stats
            for (key, value) in requiredStatsDict {
                // If player stat is lower than a required stat
                // Hopefully because I am using an enum for the dict keys, all possible requirement dict keys will be in player statsDict
                if statsDict[key] ?? 0 < value {
                    // Return false
                    return false
                }
            }
        }
        // Base case is return true
        return true
    }
}
