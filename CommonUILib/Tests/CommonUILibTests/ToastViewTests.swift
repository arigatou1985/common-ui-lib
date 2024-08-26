//
//  ToastViewTests.swift
//
//
//  Created by Jing Yu on 2024-08-26.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import CommonUILib
            
final class ToastViewTests: XCTestCase {
    
    func testToastViewShouldHaveCorrectLayout() throws {
        let toastView = ToastView(message: "Element selected", isShowing: .constant(true))
        
        let view = TestViewfactory.createUIView(for: toastView)
        let size = CGSize(width: 375, height: 102)
        assertSnapshot(of: view, as: .image(size: size, traits: lightStyle))
        assertSnapshot(of: view, as: .image(size: size, traits: darkStyle))
    }
    
    private let lightStyle = UITraitCollection(userInterfaceStyle: .light)
    private let darkStyle = UITraitCollection(userInterfaceStyle: .dark)
}
