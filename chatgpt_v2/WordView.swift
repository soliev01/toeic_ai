//
//  WordView.swift
//  chatgpt_v2
//
//  Created by 김다훈 on 2023/05/06.
//

import SwiftUI

struct WordView: View {
    var body: some View {
        VStack{
            Text("WORD")
                .padding(20)
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            HStack{
                Spacer()
                //for weekly 5 words
                VStack(){
                    Text("DAILY WORDS")
                        .bold()
                    ForEach(0..<5) { number in
                        Text("Row \(number+1)")
                            .underline()
                    }.padding()
                }
                Spacer()
                //for toeic 5 words
                VStack{
                    Text("TOEIC WORDS")
                        .bold()
                    ForEach(0..<5) { number in
                        Text("Row \(number+1)")
                            .underline()
                    }.padding()
                }
                Spacer()
            }
            //Spacer()
            HStack{
                Spacer()
                
                Button {
                    //action for refresh the words
                } label: {
                    Text(" ")
                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
//                    Text("Refresh")
//                        .padding()
                }//.buttonStyle(NormalButtonStyle())
                
                Spacer()
                
                Button {
                    //action for refresh the words
                } label: {
                    
                    Text("Refresh")
                        .padding()
                }.buttonStyle(NormalButtonStyle())
                
                Spacer()
            }
            
            // 단어 퀴즈 버튼
            HStack{
                Spacer()
                Button {
                    //action for test the words
                } label: {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                    Text(" ")
                    Text(" ")
                    Text(" ")
                    
//                    Text("Refresh")
//                        .padding()
                }//.buttonStyle(NormalButtonStyle())
                
                Spacer()
                
                Button {
                    //action for test the words
                } label: {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }//.buttonStyle(NormalButtonStyle())
                
                Spacer()
            }
            Spacer()
            Spacer()
        }
        
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}


extension WordView{
    struct NormalButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: 90, height: 45)
                .font(.system(size: 14))
                .foregroundColor(Color.black)
                .background(Color.gray)
                .cornerRadius(6.0)
        }
    }
}
