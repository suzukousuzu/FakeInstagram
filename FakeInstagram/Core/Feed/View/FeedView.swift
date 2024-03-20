//
//  FeedView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/14.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32){
                    ForEach(Post.MOCK_POST) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 4)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    // instaのロゴの代わり
                    Image(systemName: "playstation.logo")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                            .imageScale(.large)
                            
                    })
                }
              
                
            }
        }
    }
}

#Preview {
    FeedView()
}
