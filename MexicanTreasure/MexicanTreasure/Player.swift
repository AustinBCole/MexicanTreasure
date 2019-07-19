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
    
    init(statsDict: [Stats: Int], name: String, infamy: Int) {
        self.statsDict = statsDict
        self.name = name
        self.infamy = infamy
    }
    
    var statsDict: [Stats: Int]
    let name: String
    var infamy: Int
    
    private func setStat(stat: Stats, value: Int) {
        statsDict[stat] = value
    }
    private func getStat(stat: Stats) -> Int {
        return statsDict[stat] ?? 0
    }
    private func getName() -> String {
        return name
    }
    private func setInfamy(value: Int) {
        infamy = value
    }
    private func getInfamy() -> Int {
        return infamy
    }
}
