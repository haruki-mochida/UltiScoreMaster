//
//  MainViews.swift
//  UltiScoreMaster
//
//  Created by 持田晴生 on 2024/01/21.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.matches) { match in
                        NavigationLink(destination: DetailScreen(match: match)) {
                            Text("\(match.teamWhite) vs \(match.teamBlack)")
                        }
                    }
                    .onDelete(perform: viewModel.deleteMatch)
                }
                .navigationTitle("Matches")

                Spacer() // Creates space between the list and the menu bar

                MenuBarView() // Include the Menu Bar here
            }
        }
    }
}

struct MatchSettingsView: View {
    @ObservedObject var viewModel = MatchSetupViewModel()

    var body: some View {
        NavigationView {
            Form {
                TextField("Team white", text: $viewModel.teamWhite)
                TextField("Team black", text: $viewModel.teamBlack)
                TextField("Match Name", text: $viewModel.matchName)
                DatePicker("Match Date", selection: $viewModel.matchDate, displayedComponents: .date)
                Picker("Final Score", selection: $viewModel.finalScore) {
                    ForEach(0..<15) { score in
                        Text("\(score)").tag(score)
                    }
                }

                // Forward Navigation Button
                NavigationLink(destination: ScoreEntryView(viewModel: ScoreEntryViewModel())) {
                    Text("Go to Score Entry")
                }

                // Additional button if needed to manually navigate back to the Home Screen
                // Only necessary if you are not using the default NavigationView back button
                Button("Back to Home") {
                    // Logic to go back
                }
            }
            .navigationTitle("Match Settings")
        }
    }
}

// Assuming ScoreEntryView is defined elsewhere



struct MatchHistoryView: View {
    var body: some View {
        Text("Match History")
        // Implement the view content
    }
}

struct CalendarView: View {
    var body: some View {
        Text("Calendar")
        // Implement the view content
    }
}

struct DictionaryView: View {
    var body: some View {
        Text("Dictionary")
        // Implement the view content
    }
}

struct MenuBarView: View {
    var body: some View {
        HStack {
            // Match History Button
            NavigationLink(destination: MatchHistoryView()) {
                Image(systemName: "clock")
                Text("History")
            }

            Spacer()

            // Calendar Button
            NavigationLink(destination: CalendarView()) {
                Image(systemName: "calendar")
                Text("Calendar")
            }

            Spacer()

            // Dictionary Button
            NavigationLink(destination: DictionaryView()) {
                Image(systemName: "book")
                Text("Dictionary")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1)) // Customize color as needed
        .cornerRadius(10)
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeViewModel())
    }
}

