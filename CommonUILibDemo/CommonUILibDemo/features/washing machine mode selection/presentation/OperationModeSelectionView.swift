//
//  OperationModeSelectionView.swift
//  CommonUILibDemo
//
//  Created by Jing Yu on 2024-08-26.
//

import SwiftUI
import CommonUILib

struct OperationModeSelectionView: View {
    @ObservedObject var viewModel: OperationModeSelectionViewModel
    
    init(viewModel: OperationModeSelectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        operationModesList
            .task {
                await viewModel.fetOperationModes()
            }
    }
    
    private var operationModesList: some View {
        List(viewModel.operationModes, id: \.id) { operationMode in
            SelectableItem(
                iconImage: UIImage(named: operationMode.iconImageName())!,
                title: operationMode.localized(),
                description: operationMode.localizedDescription(),
                isSelected: viewModel.selectedMode == operationMode,
                isEnabled: true
            )
            .onTapGesture {
                viewModel.willSelectMode(operationMode)
            }
        }
    }
}

#Preview {
    return OperationModeSelectionView(
        viewModel: PreviewViewModelFactory.operationModeSelectionViewModel()
    )
}
