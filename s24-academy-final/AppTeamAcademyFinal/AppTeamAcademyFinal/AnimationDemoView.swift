//
//  AnimationDemoView.swift
//  AppTeamAcademyFinal
//
//  Created by asimraja on 4/18/24.
//

//import SwiftUI
//
//struct AnimationDemoView: View {
//    @State private var isExpanded = false
//    var body: some View {
//        VStack {
//            Button {
//                withAnimation(.easeInOut(duration: 3))
//                    isExpanded.toggle()
//            } label: {
//                VStack {
//                    HStack {
//                        Text("Show more")
//                            .foregroundColor(.black)
//                            .padding(.trailing)
//                        
//                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
//                            .foregroundColor(.black)
//                    }
//                    if isExpanded {
//                        Text("Hello!")
//                            .transition(.scale.combined(with: .blurReplace))
//                    }
//                }
//            }
//            .foregroundColor(.primary)
//            .padding()
//            .background(.gray)
//            .clipShape(RoundedRectangle(cornerRadius: 15))
//        }
//    }
//}

//#Preview {
//    AnimationDemoView()
//}
