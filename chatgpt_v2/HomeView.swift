//
//  HomeView.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/04/25.
// word recomenation TOEIC related - 단어추천 ( 토익단어, 일상단어)
// 일상 회화 ( chat with gpt in English)
// 토익문제 (토익기출)
// 영어 일기장 작성 및 첨삭 (+ 감정 코멘트 ex. you seem like unhappy or tired ?? )

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
