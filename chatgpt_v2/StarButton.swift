//
//  StarButton.swift
//  chatgpt_v2
//
//  Created by 김다훈 on 2023/05/10.
//

import SwiftUI

struct StarButton: View {
    @State private var isStarred = false
        var body: some View {
            Button(action: {
                self.isStarred.toggle()
            }) {
                Image(systemName: isStarred ? "star.fill" : "star")
                    .font(.system(size: 20))
                    .foregroundColor(.yellow)
            }
        }
}

struct StarButton_Previews: PreviewProvider {
    static var previews: some View {
        StarButton()
    }
}
