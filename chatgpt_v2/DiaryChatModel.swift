//
//  ChatViewModel.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/04/23.
//

import Foundation

extension DiaryChatView{
    class DiaryModel: ObservableObject{
        @Published var diary_input: String = ""
        @Published var diary_msgs: [Message] = [Message(id: "First message", role: .user, content: "Please give me the appropriate comment according to my feelings.", createAt: Date())]
        @Published var command_feeling: String = ""
        @Published var diary_current_msg:String = ""
        private let openAIService = OpenAIService()
        init(input:String)
        {
            self.diary_input = input
            self.sendMessage()
        }
        func sendMessage(){
            command_feeling = "Please give me the appropriate comment according to my feelings."
            command_feeling.append(diary_input)
            let feelingmsg = Message(id: UUID().uuidString, role: .user, content: command_feeling, createAt: Date())
            diary_msgs.append(feelingmsg)
            diary_input = ""
            
//            Task{
//                let response = await openAIService.sendMessage(messages: messages)
//                guard let receivedOpenAIMessage = response?.choices.first?.message else {
//                    print("Message not received yet")
//                    return
//                }
//                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content, createAt: Date())
//                await MainActor.run {
//                    messages.append(receivedMessage)
//                }
//            }
            openAIService.sendStreamMessage(messages: diary_msgs).responseStreamString {[weak self] stream in
                guard let self = self else { return }
                switch stream.event{
                case .stream(let response):
                    switch response {
                    case .success(let string):
                        let streamResponse = self.parseStreamData(string)
                        
                        streamResponse.forEach {newMessageResponse in
                            guard let messageContent = newMessageResponse.choices.first?.delta.content else {
                                return
                            }
                            guard let existingMessageIndex = self.diary_msgs.lastIndex(where: {$0.id == newMessageResponse.id}) else {
                                let newMessage = Message(id: newMessageResponse.id, role: .assistant, content: messageContent, createAt: Date())
                                self.diary_msgs.append(newMessage)
                                return
                            }
                            let newMessage = Message(id: newMessageResponse.id, role: .assistant, content: self.diary_msgs[existingMessageIndex].content + messageContent, createAt: Date())
                            self.diary_msgs[existingMessageIndex] = newMessage
                        }
                    case .failure(_):
                        print("Failed")
                    }
                    print(response)
                case .complete(_):
                    print("Complete")
                }
            }
        }
        
        func parseStreamData(_ data: String) -> [ChatStreamCompletionResponse]{
            let responseString = data.split(separator: "data:").map({$0.trimmingCharacters(in: .whitespacesAndNewlines)}).filter({!$0.isEmpty})
            let jsonDecoder = JSONDecoder()
            
            return responseString.compactMap { jsonString in
                guard let jsonData = jsonString.data(using: .utf8), let streamResponse = try? jsonDecoder.decode(ChatStreamCompletionResponse.self, from: jsonData) else {
                    return nil
                }
                return streamResponse
            }
        }
    }
}
