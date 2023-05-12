//
//  WordTestView.swift
//  chatgpt_v2
//
//  Created by 김다훈 on 2023/05/12.
//

import SwiftUI


struct WordTestView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Spacer()
                Text("\t" + "Test")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                WordTest(word:wordArray[1])
            }
            
            HStack {
                ForEach (0..<3) { number in
                    MeanTest(meaning: meanArray[number])
                }
            }
            HStack{
                ForEach (3..<wordArray.count) { number in
                    Button{
                        
                    } label: {
                        MeanTest(meaning: meanArray[number])
                    }
                }
            }
            ForEach(0..<13) { number in
                Spacer()
            }
        }
    }
}


struct WordTest: View{
    var word: String
    
    var body: some View {
        VStack {
            HStack {
                Text(word)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }.padding(130)
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 2)
        )
        .padding([.top, .horizontal])
    }
}

struct MeanTest: View{
    var meaning: String
    
    var body: some View {
        Button {
            //action for correct the test
        } label: {
            VStack (alignment: .leading){
                HStack {
                    Text(meaning)
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .fontWeight(.black)
                        .lineLimit(1)
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

struct WordTestView_Previews: PreviewProvider {
    static var previews: some View {
        WordTestView()
    }
}
