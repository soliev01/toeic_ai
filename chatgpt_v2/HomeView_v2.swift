//
//  HomeView_v2.swift
//  chatgpt_v2
//
//  Created by 김다훈 on 2023/05/10.
//

import SwiftUI

struct HomeView_v2: View {
    var body: some View {
        NavigationView{
            ScrollView {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack {
                    Text("D A I L _ E")
                        .bold()
                        .font(.largeTitle)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    NavigationLink(destination: WordView()){
                        CardView(image:"image_word", heading:"WORD", author:"단어를 외우고 공부해보세요")
                    }
                    NavigationLink(destination: ChatView()){
                        CardView(image:"image_question", heading:"TOEIC QUESTION", author:"Chat GPT가 추천해주는 토익문제")
                    }
                    NavigationLink(destination: ChatView()){
                        CardView(image:"image_conversation", heading:"DAILY CONVERSATION", author:"영어로 대화하여 영어실력을 향상시켜보세요")
                    }
                    NavigationLink(destination: ChatView()){
                        CardView(image:"image_diary", heading:"WRITNG DIARY", author:"영어로 일기를 써보세요! 오늘 당신의 기분을 알려드려요")
                    }
                }
            }
        }
        .navigationTitle("Home")
    }
}


struct CardView :View {
    var image: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct HomeView_v2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView_v2();
    }
}
