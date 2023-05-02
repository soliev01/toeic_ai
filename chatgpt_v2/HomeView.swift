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
                Spacer()
                Text("D A I L _ E")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                NavigationLink(destination: ChatView(), label:{
                    HStack {
                            Image(systemName: "character.book.closed")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            Spacer()
                            Text("WORD")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50, alignment: .center) // 가운데 정렬
                            Spacer()
                        }
                        .frame(width: 280, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                        .padding()
                })
                NavigationLink(destination: ChatView(), label:{
                    HStack {
                            Image(systemName: "questionmark.bubble")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            Spacer()
                            Text("TOEIC QUESTION")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50, alignment: .center) // 가운데 정렬
                            Spacer()
                        }
                        .frame(width: 280, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                        .padding()
                })
                NavigationLink(destination: ChatView(), label:{
                    HStack {
                            Image(systemName: "text.bubble")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            Spacer()
                            Text("DAILY CONVERSATION")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50, alignment: .center) // 가운데 정렬
                            Spacer()
                        }
                        .frame(width: 280, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                        .padding()
                })
                NavigationLink(destination: ChatView(), label:{
                    HStack {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            Spacer()
                            Text("WRITING DIARY")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50, alignment: .center) // 가운데 정렬
                            Spacer()
                        }
                        .frame(width: 280, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                        .padding()
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
