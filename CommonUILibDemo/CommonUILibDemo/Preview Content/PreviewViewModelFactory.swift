//
//  PreviewViewModelFactory.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import Foundation

@MainActor 
final class PreviewViewModelFactory {
    static func operationModeSelectionViewModel() -> OperationModeSelectionViewModel {
        OperationModeSelectionViewModel(
            getOperationModesUseCase: GetOperationModesUseCase(repository: StaticOperationModesRepository())
        )
    }
}
