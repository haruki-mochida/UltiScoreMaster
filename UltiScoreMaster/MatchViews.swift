//
//  MatchViews.swift
//  UltiScoreMaster
//
//  Created by 持田晴生 on 2024/01/24.
//

import SwiftUI

struct ScoreEntryView: View {
    @ObservedObject var viewModel = ScoreEntryViewModel()

    var body: some View {
        VStack {
            // Timer Display
            Text("Match Time: \(viewModel.matchTimer)")
            Button("Start/Stop Timer") {
                viewModel.toggleTimer()
            }

            HStack {
                // Score Button for Team 1
                Button("Score Team 1") {
                    // Implement logic to open Score modal
                }

                // Score Button for Team 2
                Button("Score Team 2") {
                    // Implement logic to open Score modal
                }
            }

            // Turnover (TO) Buttons
            HStack {
                Button("TO Team 1") {
                    // Implement logic to open TO modal
                }

                Button("TO Team 2") {
                    // Implement logic to open TO modal
                }
            }

            // Dynamic Timeline
            List(viewModel.timelineEntries, id: \.time) { entry in
                Text("Time: \(entry.time), Team: \(entry.teamName), Goal: \(entry.goal), Assist: \(entry.assist), Notes: \(entry.notes)")
            }

            // Save and Edit Buttons
            HStack {
                Button("Save") {
                    // Implement save logic
                }
                Button("Edit") {
                    // Implement edit logic
                }
            }
        }
        .navigationTitle("Score Entry")
    }
}
