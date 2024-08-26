//
//  UseCaseFactory.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import Foundation

final class UseCaseFactory {
    static func makeGetOperationModesUseCase() -> GetOperationModesUseCase {
        return GetOperationModesUseCase(
            repository: StaticOperationModesRepository()
        )
    }
}
