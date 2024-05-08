//
//  LibraryView.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/13/24.
//

import SwiftUI

struct LibraryView: View {
    
    @ObservedObject var userVM: UserViewModel
    @State private var showingSheet: Bool = false
    @State var selectedGame: Game? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    NavigationLink {
                        ListView(title: "All Games", games: userVM.ownedGames, userVM: UserViewModel())
                    } label: {
                        Image(systemName: "books.vertical.fill")
                            .padding(.leading)
                        Text("All Games")
                            .font(.title)
                            //.padding(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                            .bold()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(userVM.ownedGames) { game in
                                Button {
                                    selectedGame = game
                                    showingSheet.toggle()
                                } label: {
                                    Image(game.image)
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 150, height: 210)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            
                        }
                    }
                    NavigationLink {
                        ListView(title: "Wishlist", games: userVM.wishlist, userVM: UserViewModel())
                    } label: {
                        Image(systemName: "wand.and.rays")
                            .padding(.leading)
                        Text("Wishlist")
                            .font(.title)
                            //.padding(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                            .bold()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(userVM.wishlist) { game in
                                Button {
                                    selectedGame = game
                                    showingSheet.toggle()
                                } label: {
                                    Image(game.image)
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 150, height: 210)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            
                        }
                    }
                    NavigationLink {
                        ListView(title: "Backlog", games: userVM.backlog, userVM: UserViewModel())
                    } label: {
                        Image(systemName: "list.bullet")
                            .padding(.leading)
                        Text("Backlog")
                            .font(.title)
                            //.padding(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                            .bold()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(userVM.backlog) { game in
                                Button {
                                    selectedGame = game
                                    showingSheet.toggle()
                                } label: {
                                    Image(game.image)
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 150, height: 210)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            
                        }
                    }
                    NavigationLink {
                        ListView(title: "Archive", games: userVM.archive, userVM: UserViewModel())
                    } label: {
                        Image(systemName: "archivebox.fill")
                            .padding(.leading)
                        Text("Archive")
                            .font(.title)
                            //.padding(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing, 30)
                            .bold()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(userVM.archive) { game in
                                Button {
                                    selectedGame = game
                                    showingSheet.toggle()
                                } label: {
                                    Image(game.image)
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(width: 150, height: 210)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Library")
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
//
//#Preview {
//    LibraryView(userVM: UserViewModel())
//        //.environmentObject(UserViewModel())
//}
