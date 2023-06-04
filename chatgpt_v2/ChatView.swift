//
//  ContentView.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/04/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    // used for systeme theme mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id){ message in
                    messageView(message: message)
                }
                
            }
            HStack {
                TextField("Enter a message..", text: $viewModel.currentInput)
                Button{
                    viewModel.sendMessage()
                } label: {
                    Text("send")
                }
            }
        }
        .padding()
        .navigationTitle("Chat with Assistent")
    }
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {Spacer()}
            Text(message.content)
                .foregroundColor(message.role == .user ? .white: colorScheme == .dark ? .white: .black)
                .padding()
                .background(message.role == .user ? Color.blue: Color.gray.opacity(0.2))
                .cornerRadius(20)
            if message.role == .assistant {Spacer()}
        }
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
