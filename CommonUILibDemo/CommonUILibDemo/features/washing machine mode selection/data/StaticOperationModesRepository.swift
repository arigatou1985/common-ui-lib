//
//  StaticOperationModesRepository.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import Foundation

actor StaticOperationModesRepository: OperationModesRepository {
    func getOperationModes() async -> [OperationMode] {
        return [
            .cottonEco,
            .cotton,
            .synthetics,
            .mixed,
            .delicates,
            .sports,
            .bedLinenXL
        ]
    }
}
