//
//  GameView.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/18/24.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var userVM: UserViewModel
    @State var game: Game
    @State var currentOption: Int?
    let options: [String] = ["Playing", "Backlog", "Archive", "Wishlist"]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(game.image)
                    .resizable()
                    .scaledToFit()
                Text(game.name)
                    .font(.system(size: 30, weight: .medium, design: .rounded))
                    .padding(.bottom, 8)
                    .padding(.leading)
                    .padding(.trailing)
                Text(game.year)
                    .foregroundColor(.gray)
                    .font(.system(size: 25, weight: .medium, design: .rounded))
                Picker(selection: $currentOption, label: Text("Options")) {
                    ForEach(0..<options.count, id: \.self) { index in
                        Text(options[index]).tag(index as Int?)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(10)
                .onChange(of: currentOption) { _, newValue in
                    userVM.updateGame(game: game, location: newValue!)
                }
                Text(game.description)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                Button {
                    userVM.deletingGame(game: game)
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color.red)
                            .cornerRadius(10)
                            .frame(width: 350, height: 60)
                            .opacity(0.75)
                        Text("Remove game")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .opacity(0.8)
                    }
                }
            }
        }
        .background(Color("GameTrackBackground"))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    GameView(userVM: UserViewModel(), game: Game.puttPuttZoo)
        //.environmentObject(UserViewModel())
}
