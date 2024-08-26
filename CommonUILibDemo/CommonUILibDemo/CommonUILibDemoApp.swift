//
//  CommonUILibDemoApp.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import SwiftUI

@main
struct CommonUILibDemoApp: App {
    var body: some Scene {
        let useCase = GetOperationModesUseCase(repository: StaticOperationModesRepository())
        WindowGroup {
            OperationModeSelectionView(
                viewModel: OperationModeSelectionViewModel(getOperationModesUseCase: useCase)
            )
        }
    }
}
