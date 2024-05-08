//
//  ListView.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/18/24.
//

import SwiftUI

struct ListView: View {
    
    @State var title: String
    @State var games: [Game]
    
    @ObservedObject var userVM: UserViewModel
    @State private var searchText = ""
    @State private var showingSheet: Bool = false
    @State var selectedGame: Game? = nil
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var filteredGames: [Game] {
            if searchText.isEmpty {
                return games
            } else {
                return games.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                ScrollView (showsIndicators: false) {
                    LazyVGrid (columns: columns) {
                        ForEach (filteredGames) { game in
                            Button {
                                selectedGame = game
                                showingSheet.toggle()
                            } label: {
                                Image(game.image)
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(width: 150, height: 210)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(title)
            .background(Color("GameTrackBackground"))
            .preferredColorScheme(.dark)
        }
        .sheet(item: $selectedGame) { game in
            GameView(userVM: userVM, game: game, currentOption: userVM.getGameSpot(game: game))
                .id(selectedGame)
        }
    }
}

#Preview {
    ListView(title: "Example", games: UserViewModel().playing, userVM: UserViewModel())
        //.environmentObject(UserViewModel())
}
