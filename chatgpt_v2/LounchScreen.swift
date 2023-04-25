//
//  LounchScreen.swift
//  chatgpt_v2
//
//  Created by Sherzod Makhmudov on 2023/04/25.
//

import SwiftUI

struct LounchScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
            if isActive {
                HomeView()
            } else {
                VStack {
                    VStack {
                        Image(systemName: "ellipsis.message.fill")
                            .font(.system(size: 90))
                            .foregroundColor(.accentColor)
                        Text("TOEIC Chat")
                            .font(Font.custom("Baskerville-Bold", size: 36))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
}

struct LounchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LounchScreenView()
    }
}
