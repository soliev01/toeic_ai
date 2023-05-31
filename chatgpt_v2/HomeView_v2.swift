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
                VStack {
                    ForEach(0..<4) { number in
                        Spacer()
                    }
                    
                    Image("logo")
                    
                    ForEach(0..<2) { number in
                        Spacer()
                    }
                    LazyVGrid(columns: [GridItem(),GridItem()]){
                        NavigationLink(destination: WordView_v2()){
                            CardView(image:"image_word", heading:"WORD", author:"단어를 공부해보세요")
                        }
                        NavigationLink(destination: ChatView()){
                            CardView(image:"image_question", heading:"TOEIC", author:"GPT 추천 토익문제")
                        }
                        NavigationLink(destination: ChatView()){
                            CardView(image:"image_conversation", heading:"CHAT", author:"영어로 대화 해보세요")
                        }
                        NavigationLink(destination: CalendarView()){
                            CardView(image:"image_diary", heading:"DIARY", author:"영어로 일기를 써보세요!")
                        }
                    }
                    
                    Spacer()
                    Spacer()
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
                .aspectRatio(contentMode: .fit)
            
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
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 2)
        )
        .padding([.top, .horizontal])
    }
}

struct HomeView_v2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView_v2();
    }
}
