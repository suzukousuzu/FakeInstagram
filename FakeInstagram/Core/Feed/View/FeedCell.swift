//
//  FeedCell.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/14.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // MARK: - Image and UserName
            if let user = post.user {
                HStack {
                    CircularProfileImageView(user: user, profileImageSize: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                }
                .padding(.leading, 8)
            }
            
            
            // MARK: - Post Image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            
            // MARK: - Action Button
            HStack(spacing: 16) {
                Button(action: {
                    print("like a post")
                }, label: {
                Image(systemName: "heart")
                        .imageScale(.large)
                })
                
                Button(action: {
                    print("comment a post")
                }, label: {
                    Image(systemName: "bubble.right")
                            .imageScale(.large)
                })
                
                Button(action: {
                    print("share post")
                }, label: {
                    Image(systemName: "paperplane")
                            .imageScale(.large)
                })
                
                Spacer()
                
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            // MARK: - Likes Label
            Text("\(post.likes) Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // MARK: - Caption Label
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold)
                + Text(post.caption)
                Spacer()
            }
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
            
           
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[0])
}
