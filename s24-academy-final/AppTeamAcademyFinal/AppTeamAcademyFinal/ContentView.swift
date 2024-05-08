//
//  ContentView.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userVM: UserViewModel = UserViewModel()
    
    var body: some View {
        TabView {
            Group {
                HomeView(userVM: userVM)
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                LibraryView(userVM: userVM)
                    .tabItem {
                        Label("", systemImage: "square.stack")
                    }
                SearchView(userVM: userVM)
                    .tabItem {
                        Label("", systemImage: "magnifyingglass")
                    }
            }
            .toolbarBackground(Color("GameTrackTab"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
