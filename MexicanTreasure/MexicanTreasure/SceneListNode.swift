//
//  Scene.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 7/19/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

struct SceneListNode {
    
    let fileName: String
    let uniqueID: Int
    let requiredStatsDict: [Stats: Int]
    let next: [SceneListNode]
    
    internal func readFromFile() -> String {
        var text = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let file = "\(fileName).txt"
            let fileURL = dir.appendingPathComponent(file)
            //reading
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {
                fatalError("Error reading from \(fileName).txt: \(error.localizedDescription)")
            }
        }
        return text
    }
    internal func getUniqueID() -> Int {
        return uniqueID
    }
    internal func getRequiredStatsDict() -> [Stats: Int] {
        return requiredStatsDict
    }
    
}
