//
//  AppViewModels.swift
//  UltiScoreMaster
//
//  Created by 持田晴生 on 2024/01/21.
//

import Foundation
import Combine

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

class ScoreEntryViewModel: ObservableObject {
    @Published var matchTimer = 0
    @Published var isTimerRunning = false
    @Published var timelineEntries: [TimelineEntry] = []
    @Published var teamScores = [1: 0, 2: 0]

    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()

    struct TimelineEntry {
        let teamName: String
        let time: Int
        let assist: String
        let goal: String
        let notes: String
    }

    func toggleTimer() {
        isTimerRunning.toggle()
        if isTimerRunning {
            startTimer()
        } else {
            stopTimer()
        }
    }

    func incrementScore(for team: Int) {
        teamScores[team, default: 0] += 1
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.matchTimer += 1
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
class ScoreModalViewModel: ObservableObject {
    @Published var assist: String = ""
    @Published var goal: String = ""
    @Published var memo: String = ""

    // Add any additional logic needed for handling the score submission
    func submitScore() {
        // Logic to handle submission (e.g., update the ScoreEntryViewModel)
    }

    func cancel() {
        // Logic to handle cancellation (e.g., reset fields or close modal)
    }
}

class TOModalViewModel: ObservableObject {
    @Published var missType: String = ""
    @Published var defensivePlay: String = ""
    @Published var notes: String = ""

    var missTypeOptions = ["Type 1", "Type 2", "Type 3", "Type 4", "Type 5", "Type 6"]
    var defensivePlayOptions = ["Play 1", "Play 2", "Play 3", "Play 4", "Play 5"]

    func submitTurnover() {
        // Logic to handle turnover submission (e.g., update the ScoreEntryViewModel)
    }

    func cancelTurnover() {
        // Logic to handle cancellation (e.g., reset fields or close modal)
    }
}
