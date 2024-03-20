//
//  EditProfileView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/19.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedImageItem: PhotosPickerItem?
    @State private var fullname = ""
    @State private var bio = ""
    var body: some View {
        VStack {
            // MARK: - ToolBar
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    })
                    
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            
            // MARK: - edit pic
            PhotosPicker(selection: $selectedImageItem) {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .background(.gray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                        
                }
                .padding(.vertical, 8)
            }
            
            // MARK: - edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    
    @Binding var text: String
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
            
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView()
}
