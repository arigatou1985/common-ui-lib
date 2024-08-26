//
//  OperationModeSelectionView.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import SwiftUI

struct OperationModeSelectionView: View {
    @ObservedObject var viewModel: OperationModeSelectionViewModel
    
    init(viewModel: OperationModeSelectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    return OperationModeSelectionView(
        viewModel: PreviewViewModelFactory.operationModeSelectionViewModel()
    )
}
