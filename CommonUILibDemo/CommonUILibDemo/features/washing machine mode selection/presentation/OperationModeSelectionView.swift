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
    @State private var toastClosingTimer: Timer?
    
    init(viewModel: OperationModeSelectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            operationModesList
                .task {
                    await viewModel.fetOperationModes()
                }
            VStack {
                Spacer()
                toastView
            }
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
                
                withAnimation {
                    viewModel.showToast = true
                }
                
                toastClosingTimer?.invalidate()
                toastClosingTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
                    withAnimation {
                        viewModel.showToast = false
                    }
                }
            }
        }
    }
    
    private var toastView: some View {
        ToastView(message: viewModel.toastMessage, isShowing: $viewModel.showToast)
    }
}

#Preview {
    return OperationModeSelectionView(
        viewModel: PreviewViewModelFactory.operationModeSelectionViewModel()
    ).preferredColorScheme(.light)
}

#Preview {
    return OperationModeSelectionView(
        viewModel: PreviewViewModelFactory.operationModeSelectionViewModel()
    ).preferredColorScheme(.dark)
}
