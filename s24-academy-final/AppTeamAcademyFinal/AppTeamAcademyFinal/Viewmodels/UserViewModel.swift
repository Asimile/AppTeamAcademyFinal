//
//  UserViewModel.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/20/24.
//

import Foundation

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var playing: [Game] = []
    @Published var backlog: [Game] = []
    @Published var archive: [Game] = []
    @Published var wishlist: [Game] = []
    @Published var ownedGames: [Game] = []
    
    init() {
        // Load data from UserDefaults
        if let playingData = UserDefaults.standard.data(forKey: "playing"),
           let playingGames = try? JSONDecoder().decode([Game].self, from: playingData) {
            playing = playingGames
        }
        if let backlogData = UserDefaults.standard.data(forKey: "backlog"),
           let backlogGames = try? JSONDecoder().decode([Game].self, from: backlogData) {
            backlog = backlogGames
        }
        if let archiveData = UserDefaults.standard.data(forKey: "archive"),
           let archiveGames = try? JSONDecoder().decode([Game].self, from: archiveData) {
            archive = archiveGames
        }
        if let wishlistData = UserDefaults.standard.data(forKey: "wishlist"),
           let wishlistGames = try? JSONDecoder().decode([Game].self, from: wishlistData) {
            wishlist = wishlistGames
        }
        if let gamesData = UserDefaults.standard.data(forKey: "ownedGames"),
           let gamesGames = try? JSONDecoder().decode([Game].self, from: gamesData) {
            ownedGames = gamesGames
        }
        
        ownedGames = playing + backlog + archive + wishlist
    }
    
    func getGameSpot(game: Game) -> Int? {
        if playing.contains(game) {
            return 0
        }
        if backlog.contains(game) {
            return 1
        }
        if archive.contains(game) {
            return 2
        }
        if wishlist.contains(game) {
            return 3
        }
        return nil
    }
    
    func fillGames() {
        ownedGames = playing + backlog + archive
    }
    
    func updateGame(game: Game, location: Int) {
        switch (location) {
        case 0:
            playingGame(game: game)
        case 1:
            backloggingGame(game: game)
        case 2:
            archivingGame(game: game)
        case 3:
            wishlistingGame(game: game)
        default:
            break
        }
        fillGames()
        saveData()
    }
    
    func playingGame(game: Game) {
        if !playing.contains(game) {
            playing.append(game)
        }
        if backlog.contains(game) {
            backlog.remove(at: backlog.firstIndex(of: game)!)
        }
        if archive.contains(game) {
            archive.remove(at: archive.firstIndex(of: game)!)
        }
        if archive.contains(game) {
            wishlist.remove(at: wishlist.firstIndex(of: game)!)
        }
    }
    
    func backloggingGame(game: Game) {
        if playing.contains(game) {
            playing.remove(at: playing.firstIndex(of: game)!)
        }
        if !backlog.contains(game) {
            backlog.append(game)
        }
        if archive.contains(game) {
            archive.remove(at: archive.firstIndex(of: game)!)
        }
        if wishlist.contains(game) {
            wishlist.remove(at: wishlist.firstIndex(of: game)!)
        }
    }
    
    func archivingGame(game: Game) {
        if playing.contains(game) {
            playing.remove(at: playing.firstIndex(of: game)!)
        }
        if backlog.contains(game) {
            backlog.remove(at: backlog.firstIndex(of: game)!)
        }
        if !archive.contains(game) {
            archive.append(game)
        }
        if wishlist.contains(game) {
            wishlist.remove(at: wishlist.firstIndex(of: game)!)
        }
    }
    
    func wishlistingGame(game: Game) {
        if playing.contains(game) {
            playing.remove(at: playing.firstIndex(of: game)!)
        }
        if backlog.contains(game) {
            backlog.remove(at: backlog.firstIndex(of: game)!)
        }
        if archive.contains(game) {
            archive.remove(at: archive.firstIndex(of: game)!)
        }
        if !wishlist.contains(game) {
            wishlist.append(game)
        }
    }
    
    func deletingGame(game: Game) {
        if playing.contains(game) {
            playing.remove(at: playing.firstIndex(of: game)!)
        }
        if backlog.contains(game) {
            backlog.remove(at: backlog.firstIndex(of: game)!)
        }
        if archive.contains(game) {
            archive.remove(at: archive.firstIndex(of: game)!)
        }
        if wishlist.contains(game) {
            wishlist.remove(at: wishlist.firstIndex(of: game)!)
        }
        fillGames()
    }
    
    func saveData() {
        // Save data to UserDefaults
        if let playingData = try? JSONEncoder().encode(playing) {
            UserDefaults.standard.set(playingData, forKey: "playing")
        }
        if let backlogData = try? JSONEncoder().encode(backlog) {
            UserDefaults.standard.set(backlogData, forKey: "backlog")
        }
        if let archiveData = try? JSONEncoder().encode(archive) {
            UserDefaults.standard.set(archiveData, forKey: "archive")
        }
        if let wishlistData = try? JSONEncoder().encode(wishlist) {
            UserDefaults.standard.set(wishlistData, forKey: "wishlist")
        }
        if let gamesData = try? JSONEncoder().encode(ownedGames) {
            UserDefaults.standard.set(gamesData, forKey: "games")
        }
    }
}
