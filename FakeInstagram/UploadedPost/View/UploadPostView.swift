//
//  UploadPostView.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/16.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding  var tabIndex: Int
    var body: some View {
        VStack {
            // MARK: - action tool bar
            HStack {
                Button(action: {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                })
            }
            .padding(.horizontal)
            
            
            // MARK: - post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                
                TextField("Enter your caption", text: $caption, axis: .vertical)
                
                
            }
            
            Spacer()
        }
        .onAppear(perform: {
            imagePickerPresented.toggle()
        })
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
