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

