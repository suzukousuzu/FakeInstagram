//
//  UploadPostViewModel.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/16.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        postImage = Image(uiImage: uiImage)
        
    }
}
