//
//  SearchView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/14.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USER) { user in
                        
                        NavigationLink(value: user) {
                            HStack {
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                   
                                }
                                .font(.footnote)
                                
                                Spacer()
                                
                            
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                        .navigationDestination(for: User.self) { user in
                            ProfileView(user: user)
                        }
                        
                    }
                }
                .searchable(text: $searchText, prompt: "Search ...")
                .padding(.top, 8)
            }
            .navigationTitle("Exprore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
