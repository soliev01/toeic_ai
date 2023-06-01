//
//  ContentView.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/04/23.
//

import SwiftUI

struct ToeicView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var selectedButton: Int?
    var body: some View {
        VStack {
            Text("")
            HStack{
                //question : Give me a short TOEIC multiple choice question
                Text("Choose the word or phrase that best completes the sentence.\n")
                    .bold()
                    .font(.title)
                Spacer()
            }
            HStack {
                Text("The conference room is ________ for the meeting.")
                    .bold()
                Spacer()
            }
            HStack{
                VStack(alignment: .leading){
                    Text("")
                    Text("a) available")
                    Text("b) accessible")
                    Text("c) affordable")
                    Text("d) adaptable")
                }
                Spacer()
            }
            HStack{
                ToEic_Button(spelling: "A", index : 1, selectedButton : $selectedButton)
                ToEic_Button(spelling: "B", index : 2, selectedButton : $selectedButton)
            }.padding(.top)
            HStack{
                ToEic_Button(spelling: "C", index : 3, selectedButton : $selectedButton)
                ToEic_Button(spelling: "D", index : 4,  selectedButton : $selectedButton)
            }
            Spacer()
            continue_Button(selectedButton: $selectedButton)
            
        }
        .padding()
        .navigationTitle("Solve the TOEIC question")
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

struct ToEic_Button: View{
    var spelling : String
    var index: Int
    @Binding var selectedButton: Int?
    
    var body : some View{
        Button(action: {
            //send to gpt "A" or "B" or "C" or "D"
            //클릭하면 색갈 바뀌고, 다시 클릭하면 원상태로 돌아옴.
            if selectedButton == index {
                selectedButton = nil
            } else {
                selectedButton = index
            }
        })
        {
            RoundedRectangle(cornerRadius: 20)
                .fill(selectedButton == index ? Color.black : Color.gray)
                .frame(width: 180, height: 60)
                .overlay(
                    Text(spelling)
                        .bold()
                        .font(.title)
                        .foregroundColor(Color.white)
                )
        }.buttonStyle(PlainButtonStyle())
    }
}

struct continue_Button : View{
    @Binding var selectedButton: Int?
    
    var body: some View{
        
        
        Button(action: {
            //question again to gpt
            //Give me a short TOEIC multiple choice question
            selectedButton = nil
        }){
            Capsule()
                .fill(Color.gray)
                .frame(width: 350, height: 70)
                .overlay(
                    Text("Continue")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                )
                .disabled(selectedButton == nil)
                .opacity(selectedButton == nil ? 0.5 : 1.0)
        }
    }
}

struct ToeicView_Previews: PreviewProvider {
    static var previews: some View {
        ToeicView()
    }
}
