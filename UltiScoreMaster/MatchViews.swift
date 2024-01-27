//
//  MatchViews.swift
//  UltiScoreMaster
//
//  Created by 持田晴生 on 2024/01/24.
//

import SwiftUI

import SwiftUI

struct ScoreEntryView: View {
    @ObservedObject var viewModel = ScoreEntryViewModel()
    @State private var showingScoreModalForTeam1 = false
    @State private var showingScoreModalForTeam2 = false
    @State private var showingTOModalForTeam1 = false
    @State private var showingTOModalForTeam2 = false

    var body: some View {
        VStack {
            // Timer Display
            Text("Match Time: \(viewModel.matchTimer)")
            Button("Start/Stop Timer") {
                viewModel.toggleTimer()
            }

            // Score Display
            HStack {
                Text("Team 1 Score: \(viewModel.teamScores[1] ?? 0)")
                Spacer()
                Text("Team 2 Score: \(viewModel.teamScores[2] ?? 0)")
            }.padding()

            // Score Buttons
            HStack {
                // Score Button for Team 1
                Button("Score Team 1") {
                    viewModel.incrementScore(for: 1)
                    showingScoreModalForTeam1 = true
                }
                .sheet(isPresented: $showingScoreModalForTeam1) {
                    ScoreModalView(isPresented: $showingScoreModalForTeam1, viewModel: ScoreModalViewModel(), team: "Team 1")
                }

                // Score Button for Team 2
                Button("Score Team 2") {
                    viewModel.incrementScore(for: 2)
                    showingScoreModalForTeam2 = true
                }
                .sheet(isPresented: $showingScoreModalForTeam2) {
                    ScoreModalView(isPresented: $showingScoreModalForTeam2, viewModel: ScoreModalViewModel(), team: "Team 2")
                }
            }

            // Turnover (TO) Buttons
            HStack {
                Button("TO Team 1") {
                    showingTOModalForTeam1 = true
                }
                .sheet(isPresented: $showingTOModalForTeam1) {
                    TOModalView(isPresented: $showingTOModalForTeam1, viewModel: TOModalViewModel(), team: "Team 1")
                }

                Button("TO Team 2") {
                    showingTOModalForTeam2 = true
                }
                .sheet(isPresented: $showingTOModalForTeam2) {
                    TOModalView(isPresented: $showingTOModalForTeam2, viewModel: TOModalViewModel(), team: "Team 2")
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

struct ScoreModalView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ScoreModalViewModel
    var team: String

    var body: some View {
        VStack {
            TextField("Assist", text: $viewModel.assist)
            TextField("Goal", text: $viewModel.goal)
            TextField("Memo", text: $viewModel.memo)
            Button("OK") {
                viewModel.submitScore()
                isPresented = false
            }
            Button("Cancel") {
                viewModel.cancel()
                isPresented = false
            }
        }
        .padding()
        // Customize the UI as needed
    }
}

struct TOModalView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: TOModalViewModel
    var team: String

    var body: some View {
        VStack {
            Picker("MISS TYPE", selection: $viewModel.missType) {
                ForEach(viewModel.missTypeOptions, id: \.self) { type in
                    Text(type).tag(type)
                }
            }
            Picker("Defensive Play", selection: $viewModel.defensivePlay) {
                ForEach(viewModel.defensivePlayOptions, id: \.self) { play in
                    Text(play).tag(play)
                }
            }
            TextField("Notes", text: $viewModel.notes)

            Button("OK") {
                viewModel.submitTurnover()
                isPresented = false
            }
            Button("Cancel") {
                viewModel.cancelTurnover()
                isPresented = false
            }
        }
        .padding()
    }
}


// Implement the detailed design for these modal views


