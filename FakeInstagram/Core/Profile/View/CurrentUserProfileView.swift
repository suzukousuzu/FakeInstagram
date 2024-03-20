//
//  CurrentUserProfileView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/16.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var posts: [Post] {
        return Post.MOCK_POST.filter { $0.user?.username == user.username }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // MARK: - Header
                    ProfileHeaderView(user: user)
                    
                    // MARK: - Post Grid View
                    PostGridView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        AuthService.shared.signout()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
