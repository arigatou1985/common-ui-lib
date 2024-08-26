//
//  GetOperationModesUseCase.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import Foundation

protocol OperationModesRepository: Sendable {
    func getOperationModes() async -> [OperationMode]
}

actor GetOperationModesUseCase {
    init(repository: OperationModesRepository) {
        self.repository = repository
    }
    
    func execute() async -> [OperationMode] {
        await repository.getOperationModes()
    }
    
    private let repository: OperationModesRepository
}
