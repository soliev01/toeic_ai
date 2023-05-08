//
//  DiaryChatView.swift
//  chatgpt_v2
//
//  Created by 신영재 on 2023/05/03.
//

import SwiftUI

struct DiaryChatView: View {
    static var input_diary: String = ""
    @ObservedObject var diarymodel: DiaryModel
    init(input: String) {
        DiaryChatView.input_diary = input
        diarymodel = DiaryModel(input: DiaryChatView.input_diary)
    }
    
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(diarymodel.diary_msgs.filter({$0.role != .system}), id: \.id){ message in
                    messageView(message: message)
                }
                
            }
            HStack {
                TextField("Enter a message..", text: $diarymodel.diary_current_msg)
                Button{
                    diarymodel.sendMessage()
                } label: {
                    Text("send")
                }
            }
        }
        .padding()
        .navigationTitle("Diary with ")
    }
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {Spacer()}
            Text(message.content)
                .foregroundColor(message.role == .user ? .white: .black)
                .padding()
                .background(message.role == .user ? Color.blue: Color.gray.opacity(0.2))
                .cornerRadius(20)
            if message.role == .assistant {Spacer()}
        }
    }
}


struct DiaryChatView_Preview: PreviewProvider {
    static var previews: some View {
        DiaryChatView(input: "")
    }
}
