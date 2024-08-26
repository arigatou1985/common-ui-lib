//
//  OperationMode.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import Foundation

enum OperationMode: String, Identifiable {
    case cottonEco
    case cotton
    case synthetics
    case mixed
    case delicates
    case sports
    case bedLinenXL
    
    var id: String { rawValue }
    
    func localized() -> String {
        switch self {
        case .cottonEco:
            return "Cotton Eco"
        case .cotton:
            return "Cotton"
        case .synthetics:
            return "Synthetics"
        case .mixed:
            return "Mixed+"
        case .delicates:
            return "Delicates"
        case .sports:
            return "Sports"
        case .bedLinenXL:
            return "Bed Linen XL"
        }
    }
    
    func localizedDescription() -> String {
        switch self {
        case .cottonEco:
            return "Cupboard-dries cottons with maximum energy saving."
        case .cotton:
            return "100% cotton fabrics."
        case .synthetics:
            return "For a mix of mostly synthetic fabrics, like polyester, or polyamide."
        case .mixed:
            return "Cotton, cotton-synthetic blends, and synthetics that don’t need ironing."
        case .delicates:
            return "Viscose, rayon, acrylic, and other blends. "
        case .sports:
            return "Athletic clothes made of synthetics like polyester, elastane, or polyamide."
        case .bedLinenXL:
            return "Up to 2 single and 1 double sets of bedding. "
        }
    }
    
    func iconImageName() -> String {
        switch self {
        case .cottonEco:
            return "cotton 2"
        case .cotton:
            return "cotton"
        case .synthetics:
            return "synthetics"
        case .mixed:
            return "mixed"
        case .delicates:
            return "delicates"
        case .sports:
            return "sport"
        case .bedLinenXL:
            return "bedding"
        }
    }
}
