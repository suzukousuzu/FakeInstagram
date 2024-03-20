//
//  IGTextFieldModifier.swift
//  FakeInstagram
//
//  Created by 鈴木航太 on 2024/03/15.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
        
    }
}

