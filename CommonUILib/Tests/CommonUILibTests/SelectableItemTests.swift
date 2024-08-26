import XCTest
import SwiftUI
import SnapshotTesting
@testable import CommonUILib
            
final class SelectableItemTests: XCTestCase {
    
    func testSelectableItemShouldShowDescriptionIfSelected() throws {
        
        let item = SelectableItem(
            iconImage: icon,
            title: title,
            description: subtitle,
            isSelected: true,
            isEnabled: true
        )
        
        let view = TestViewfactory.createUIView(for: item)
        let size = itemSizeWithTitleAndDescription
        assertSnapshot(of: view, as: .image(size: size, traits: lightStyle))
        assertSnapshot(of: view, as: .image(size: size, traits: darkStyle))
    }
    
    func testSelectableItemShouldNotShowDescriptionIfNotSelected() throws {
        
        let item = SelectableItem(
            iconImage: icon,
            title: title,
            description: subtitle,
            isSelected: false,
            isEnabled: true
        )
        
        let view = TestViewfactory.createUIView(for: item)
        let size = itemSizeWithTitle
        assertSnapshot(of: view, as: .image(size: size, traits: lightStyle))
        assertSnapshot(of: view, as: .image(size: size, traits: darkStyle))
    }
    
    func testSelectableItemShouldBeABitTransparentIfDisabled() throws {
        
        let item = SelectableItem(
            iconImage: icon,
            title: title,
            description: subtitle,
            isSelected: true,
            isEnabled: false
        )

        let view = TestViewfactory.createUIView(for: item)
        let size = itemSizeWithTitleAndDescription
        assertSnapshot(of: view, as: .image(size: size, traits: lightStyle))
        assertSnapshot(of: view, as: .image(size: size, traits: darkStyle))
    }
    
    func testSelectableItemShouldNotShowDescriptionIfNotSelectedAndShouldBeABitTransparentIfDisabled() throws {
        
        let item = SelectableItem(
            iconImage: icon,
            title: title,
            description: subtitle,
            isSelected: false,
            isEnabled: false
        )

        let view = TestViewfactory.createUIView(for: item)
        let size = itemSizeWithTitle
        assertSnapshot(of: view, as: .image(size: size, traits: lightStyle))
        assertSnapshot(of: view, as: .image(size: size, traits: darkStyle))
    }
    
    private let itemSizeWithTitleAndDescription = CGSize(width: 375, height: 102)
    private let itemSizeWithTitle = CGSize(width: 375, height: 57)
    private let lightStyle = UITraitCollection(userInterfaceStyle: .light)
    private let darkStyle = UITraitCollection(userInterfaceStyle: .dark)
    private let icon = UIImage(systemName: "star")!
    private let title = "Cotton Eco"
    private let subtitle = "Cupboard-dries cottons with maximum energy saving."
}
