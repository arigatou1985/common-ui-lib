//
//  TestViewFactory.swift
//
//
//  Created by Jing Yu on 2024-08-26.
//

import SwiftUI
import CommonUILib

final class TestViewfactory {
    static func createUIView(for item: some View) -> UIView {
        let controller = UIHostingController(rootView: item)
        return controller.view
    }
}
