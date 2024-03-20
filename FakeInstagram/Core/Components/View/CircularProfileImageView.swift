//
//  CircularProfileImageView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/20.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch(self) {
        case .xSmall:
            return 40
        case .small:
            return 48
        case . medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let profileImageSize: ProfileImageSize
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: profileImageSize.dimension, height: profileImageSize.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(Color(.systemGray4))
//                .scaledToFill()
                .frame(width: profileImageSize.dimension, height: profileImageSize.dimension)
                .clipShape(Circle())
            
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USER[0], profileImageSize: .large)
}
