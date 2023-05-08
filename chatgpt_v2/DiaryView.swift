//
//  Diary.swift
//  chatgpt_v2
//
//  Created by 신영재 on 2023/05/03.
//

import SwiftUI

struct DiaryView: View{
    @State var txt: String
    var body: some View
    {
        NavigationView()
        {
            VStack(alignment: .center)
            {
                //1.제목 : Let's try write your diary
                Text("Let's try write your diary!")
                    .font(.title2)
                //2.글상자
                VStack{
                    //1.Hstack(Date, Place)
                    HStack{
                        //1. Date with calendar api
                        Button("Date")
                        {
                            
                        }
                        Spacer()
                        //2. Place with map with api?
                        Button("Place")
                        {
                            
                        }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    
                    //2. Textfield
                    TextEditor(text: $txt)
                          .cornerRadius(15)
                          .padding()
                          .background(.blue)
                }
                
                //3. 제출 버튼
                NavigationLink(destination: DiaryChatView(input: txt), label:{
                    HStack {
                            Image(systemName: "text.bubble")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading)
                            Spacer()
                            Text("Complete!")
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
            .navigationTitle("Diary")
        }
        
    }
    
    
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(txt: "")
    }
}


