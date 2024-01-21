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
