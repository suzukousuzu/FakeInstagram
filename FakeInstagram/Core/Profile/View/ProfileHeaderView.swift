//
//  ProfileHeaderView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/16.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    @State private var showEditProfile = false
    var body: some View {
        VStack(spacing: 10) {
            // pick and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 12, title: "Following")
                    UserStatView(value: 24, title: "Follower")
                
                }
                
                
                
            }
            .padding(.horizontal)
//                .padding(.bottom, 8)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text(user.username)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // MARK: - ActionButton
            Button(
                action: {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                        
                    } else {
                        showEditProfile.toggle()
                    }
                    
                },
                label: {
                    Text(user.isCurrentUser ? "Edit Profile": "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                    
                })
            .frame(maxWidth: .infinity, minHeight: 32)
            .background(
                RoundedRectangle(cornerRadius: 6).stroke(.gray, lineWidth: 1)
            )
            .background(
                user.isCurrentUser ? .white : Color(.systemBlue)
            )
            .cornerRadius(6)
            .padding(.horizontal)
            
            
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            Text("Edit Profile View")
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
