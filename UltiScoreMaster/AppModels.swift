//
//  AppModels.swift
//  UltiScoreMaster
//
//  Created by 持田晴生 on 2024/01/21.
//

import Foundation

struct Match: Identifiable, Codable {
    var id = UUID().uuidString // Unique identifier for each match
    var matchDate: Date            // Date of the match
    var teamWhite: String     // Name of the 'white' team
    var teamBlack: String     // Name of the 'black' team
    var matchName: String     // Name of the match
    var finalScore: Int       // Final score threshold for the match

    // Default initializer
    init(matchDate: Date = Date(),
         teamWhite: String = "",
         teamBlack: String = "",
         matchName: String = "Practice match",
         finalScore: Int = 7) {
        self.matchDate = matchDate
        self.teamWhite = teamWhite
        self.teamBlack = teamBlack
        self.matchName = matchName
        self.finalScore = finalScore
    }
}
