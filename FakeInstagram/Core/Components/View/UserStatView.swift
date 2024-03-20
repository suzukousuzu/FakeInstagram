//
//  UserStatView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/13.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack() {
            Text(String(value))
                .font(.headline)
                .fontWeight(.semibold)
        
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(value: 12, title: "Posts")
        .previewLayout(.sizeThatFits)
        .padding()
}
