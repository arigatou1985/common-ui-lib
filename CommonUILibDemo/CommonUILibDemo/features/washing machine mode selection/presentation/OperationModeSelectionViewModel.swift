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
    @Published private(set) var selectedMode: OperationMode?
    @Published var showToast = false
    @Published private(set) var toastMessage: String = ""
    
    init(getOperationModesUseCase: GetOperationModesUseCase) {
        self.getOperationModesUseCase = getOperationModesUseCase
    }
    
    func fetOperationModes() async {
        operationModes = await getOperationModesUseCase.execute()
        selectedMode = operationModes.first
    }
    
    func willSelectMode(_ mode: OperationMode) {
        selectedMode = mode
        toastMessage = mode.localized() + " selected"
    }
    
    private let getOperationModesUseCase: GetOperationModesUseCase
}
