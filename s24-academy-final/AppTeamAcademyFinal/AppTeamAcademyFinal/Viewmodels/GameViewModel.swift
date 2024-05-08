//
//  GameViewModel.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/14/24.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var name: String {
        game.name
    }
    
    var description: String {
        game.description
    }
}
