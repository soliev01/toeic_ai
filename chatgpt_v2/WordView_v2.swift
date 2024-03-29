//
//  WordView_v2.swift
//  chatgpt_v2
//
//  Created by 김다훈 on 2023/05/10.
//

import SwiftUI

//var wordArray = ["school","book","pencil", "apple", "desk"]
//var meanArray = ["학교","책","연필","사과", "책상"]

struct WordView_v2: View {
    @ObservedObject var model = AppModel()
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("\t" + "Words")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                    ForEach(model.wordMap.keys.sorted(), id: \.self) { index in
                        WordView1(word: index, meaning: model.wordMap[index] ?? "안돼!")
                    }
                
             
//                ForEach(model.wordArray.indices, id: \.self) { index in
//                    if let word = model.wordArray[index], let meaning = model.meanArray[index] {
//                        WordView1(word: word, meaning: meaning)
//                    }
//                }
//                ForEach(0..<wordArray.count) { number in
//                    //show word and it's meaning
//                    WordView1(word:wordArray[number], meaning:meanArray[number])
//                }
            }
   
            HStack{
                RefreshButton()
                TestButton()
            }
            Spacer()
        }
       
    }
   
}


struct TestButton: View{

    var body: some View {
        Button {
            //action for refresh the words
        } label: {
            VStack (alignment: .leading){
                HStack {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                    Text("Test")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
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
}

struct RefreshButton: View{
    @ObservedObject var model = AppModel()

    var body: some View {
        Button {
            model.makeWords()
        } label: {
            VStack (alignment: .leading){
                HStack {
                    Image("refresh")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                    Text("Refrsh")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
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
        .onAppear(perform: model.initPrompt)
    }
       
}

struct WordView1: View{
    var word: String
    var meaning: String

    var body: some View {
        VStack {
            HStack {
                Text(word)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                Spacer()
                Text(meaning.uppercased())
                    .font(.title3)
                    .foregroundColor(.secondary)

                Spacer()
                //for Favorites
                StarButton()
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

struct WordView_v2_Previews: PreviewProvider {
    static var previews: some View {
        WordView_v2()
    }
}
