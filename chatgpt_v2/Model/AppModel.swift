//
//  AppModel.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/06/04.

import SwiftUI
import OpenAISwift

final class AppModel: ObservableObject {
    @Published var isThinking: Bool = false
    @Published var generatedWords: String = ""
    @Published var wordArray: [String?] = []
    @Published var meanArray: [String?] = []

    private var client: OpenAISwift?

    func setup(){
        client = OpenAISwift(authToken: Constants.openAIKey)
    }

    func send(text: String, completion: @escaping (String) -> Void) {
        isThinking = true
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                if let output = model.choices?.first?.text {
                    self.parseOutput(output)
                    completion(output)
                } else {
                    let output = "No output generated."
                    completion(output)
                }
            case .failure(_):
                let output = "Something went wrong, please try again."
                completion(output)
            }
        })
    }
    
    func makeWords(){
        send(text: "From now on all of your response is inside json structure I provide below. give me five random english words with their korean translation next to it. If i say refresh generate new answer. The JSON structure is as follows: { \"words\": [ {\"hello\": \"안녕\" }, {\"hello\": \"안녕\" }, {\"hello\": \"안녕\" }, {\"hello\": \"안녕\" }, {\"hello\": \"안녕\" } ] }") { output in
            DispatchQueue.main.async {
                self.generatedWords = output.trimmingCharacters(in: .whitespacesAndNewlines)
                self.isThinking = false
            }
        }
    }
    
    private func parseOutput(_ output: String) {
        guard let jsonData = output.data(using: .utf8) else {
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response.self, from: jsonData)
            let words = response.words
            wordArray = words.map { $0.word }
            meanArray = words.map { $0.meaning }
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
}

struct Response: Codable {
    let words: [Word]
}

struct Word: Codable {
    let word: String?
    let meaning: String?
}

