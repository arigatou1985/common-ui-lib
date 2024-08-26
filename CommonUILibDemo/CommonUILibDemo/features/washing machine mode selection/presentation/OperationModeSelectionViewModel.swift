//
//  OperationModeSelectionViewModel.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import Foundation

@MainActor
class OperationModeSelectionViewModel: ObservableObject {
    @Published var operationModes: [OperationMode] = []
    
    private let getOperationModesUseCase: GetOperationModesUseCase
    
    init(getOperationModesUseCase: GetOperationModesUseCase) {
        self.getOperationModesUseCase = getOperationModesUseCase
    }
    
    func fetOperationModes() async {
        operationModes = await getOperationModesUseCase.execute()
    }
}
