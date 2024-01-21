//
//  AppViewModels.swift
//  UltiScoreMaster
//
//  Created by 持田晴生 on 2024/01/21.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var matches: [Match] = []

    func fetchMatches() {
        // Implement fetching logic
    }

    func deleteMatch(matchId: String) {
        // Implement deletion logic
    }
}

class MatchSetupViewModel: ObservableObject {
    @Published var teamWhite: String = ""
    @Published var teamBlack: String = ""
    @Published var matchName: String = "Practice Match"
    @Published var matchDate: Date = Date()
    @Published var finalScore: Int = 7

    // Function to handle the saving of match settings
    func saveMatchDetails() {
        let match = Match(matchDate: matchDate,
                          teamWhite: teamWhite,
                          teamBlack: teamBlack,
                          matchName: matchName,
                          finalScore: finalScore)
        // Logic to save this data to Firestore or your preferred database
    }
}
