//
//  SwiftUIView.swift
//  CommonUILib
//
//  Created by Jing Yu on 2024-08-26.
//

import SwiftUI

public struct ToastView: View {
    public init(message: String) {
        self.message = message
    }
    
    public var body: some View {
        messageView
    }
    
    private var messageView: some View {
        Text(message)
            .foregroundStyle(ColorConstants.textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .frame(minHeight: LayoutConstants.minimumViewHeight)
            .background(ColorConstants.backgroundColor)
            .clipShape(RoundedRectangle(cornerSize: LayoutConstants.cornerSize))
            .padding()
    }
    
    private let message: String
    
    private struct LayoutConstants {
        static let cornerSize = CGSize(width: 8, height: 8)
        static let minimumViewHeight: CGFloat = 56
    }
    
    private struct FontConstants {
        static let messageFont = Font.system(size: 16)
    }
    
    private struct ColorConstants {
        static let textColor = Color("toast_message_color", bundle: .module)
        static let backgroundColor = Color("toast_background_color", bundle: .module)
    }
}

#Preview {
    ToastView(message: "Element selected")
}
