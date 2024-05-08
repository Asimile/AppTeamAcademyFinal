//
//  HomeView.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/13/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var userVM: UserViewModel
    @State private var showingSheet: Bool = false
    @State var selectedGame: Game? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    NavigationLink {
                        ListView(title: "In Progress", games: userVM.playing, userVM: userVM)
                    } label: {
                        Text("In Progress")
                            .font(.title)
                            .padding(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing)
                            .bold()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(userVM.playing) { game in
                                Button {
                                    selectedGame = game
                                    showingSheet.toggle()
                                } label: {
                                    Image(game.image)
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 330)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            
                        }
                    }
                    
                }
                .padding(.top)
            }
            .navigationTitle("GameTrack")
            //.font(Font.custom("ArialRoundedMTBold", size: 10))
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
    HomeView(userVM: UserViewModel())
        //.environmentObject(UserViewModel())
}
