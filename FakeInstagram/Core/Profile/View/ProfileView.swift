//
//  ProfileView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/13.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POST.filter { $0.user?.username == user.username }
    }
    
    
    var body: some View {
            ScrollView {
                VStack {
                    // MARK: - Header
                    ProfileHeaderView(user: user)
                   
                    
                    // MARK: - Post Grid View
                    PostGridView(posts: posts)

                        }
                        
                    }
                }
            }



#Preview {
    ProfileView(user: User.MOCK_USER[0])
}
