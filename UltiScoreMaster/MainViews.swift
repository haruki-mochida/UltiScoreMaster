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
            List {
                ForEach(viewModel.matches) { match in
                    NavigationLink(destination: DetailScreen(match: match)) {
                        Text("\(match.teamWhite) vs \(match.teamBlack)")
                    }
                }
                .onDelete(perform: viewModel.deleteMatch)
            }
            .navigationTitle("Matches")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeViewModel())
    }
}

