//
//  SelectableItem.swift
//  CommonUILib
//
//  Created by Jing Yu on 2024-08-26.
//

import SwiftUI

public struct SelectableItem: View {
    
    public init(
        iconImage: UIImage,
        selectionIndicatorImage: UIImage? = nil,
        title: String,
        description: String,
        isSelected: Bool,
        isEnabled: Bool
    ) {
        self.iconImage = iconImage
        self.selectionIndicatorImage = selectionIndicatorImage ?? ImageConstants.selectionIndicator
        self.title = title
        self.description = description
        self.isSelected = isSelected
        self.isEnabled = isEnabled
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            icon
            textContent
            Spacer()
            selectionIndicator
        }
        .frame(minHeight: LayoutConstants.minimumItemHeight)
        .listRowInsets(EdgeInsets(.zero))
        .opacity(isEnabled ? 1 : ColorConstants.disabledOpacity)
    }
    
    private var icon: some View {
        Image(uiImage: iconImage)
            .frame(
                width: LayoutConstants.iconSize,
                height: LayoutConstants.iconSize
            )
            .padding(.horizontal)
    }
    
    private var textContent: some View {
        VStack(alignment: .leading) {
            titleText
            if isSelected {
                Spacer()
                    .frame(height: 4)
                descriptionText
            }
        }
        .padding(.vertical)
    }
    
    private var titleText: some View {
        Text(title)
            .font(FontConstants.titleFont)
            .foregroundStyle(ColorConstants.titleColor)
    }
    
    private var descriptionText: some View {
        Text(description)
            .font(FontConstants.descriptionFont)
            .foregroundStyle(ColorConstants.subtitleColor)
    }
    
    @ViewBuilder
    private var selectionIndicator: some View {
        if isSelected {
            Image(uiImage: selectionIndicatorImage)
                .frame(
                    width: LayoutConstants.selectionIndicatorSize,
                    height: LayoutConstants.selectionIndicatorSize
                )
                .padding(.horizontal)
        } else {
            EmptyView()
        }
    }
    
    private let iconImage: UIImage
    private let selectionIndicatorImage: UIImage
    private let title: String
    private let description: String
    private let isSelected: Bool
    private let isEnabled: Bool
    private let titleFont = Font.system(size: 16)
    private let descriptionFont = Font.system(size: 14)
    
    private struct LayoutConstants {
        static let iconSize: CGFloat = 24
        static let selectionIndicatorSize: CGFloat = 24
        static let minimumItemHeight: CGFloat = 57
    }
    
    private struct FontConstants {
        static let titleFont = Font.system(size: 16)
        static let descriptionFont = Font.system(size: 14)
    }
    
    private struct ColorConstants {
        static let titleColor = Color("title_color", bundle: .module)
        static let subtitleColor = Color("subtitle_color", bundle: .module)
        static let disabledOpacity: Double = 0.4
    }
    
    private struct ImageConstants {
        static let selectionIndicator = UIImage(named: "check", in: .module, compatibleWith: nil)!
    }
}

#Preview {
    return List {
        SelectableItem(
            iconImage: UIImage(systemName: "star")!,
            title: "Cotton Eco",
            description: "Cupboard-dries cottons with maxi mum energy saving.",
            isSelected: true,
            isEnabled: true
        )
        
        SelectableItem(
            iconImage: UIImage(systemName: "star")!,
            title: "Cotton Eco",
            description: "Cupboard-dries cottons with maxi mum energy saving.",
            isSelected: false,
            isEnabled: true
        )
        
        SelectableItem(
            iconImage: UIImage(systemName: "star")!,
            title: "Cotton Eco",
            description: "Cupboard-dries cottons with maxi mum energy saving.",
            isSelected: true,
            isEnabled: false
        )
        
        SelectableItem(
            iconImage: UIImage(systemName: "star")!,
            title: "Cotton Eco",
            description: "Cupboard-dries cottons with maxi mum energy saving.",
            isSelected: false,
            isEnabled: false
        )
    }
}
