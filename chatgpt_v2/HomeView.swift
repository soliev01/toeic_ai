//
//  HomeView.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/04/25.
//

import SwiftUI
import Combine


struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Chat!")
//                NavigationLink(destination: QuizWithAI(), label:{
//                    Text("Chat quizz")
//                        .bold()
//                        .frame(width: 280, height: 50)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(40)
//                })
                NavigationLink(destination: ChatView(), label:{
                    Text("Chat with AI")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                })
            }
            .padding()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
