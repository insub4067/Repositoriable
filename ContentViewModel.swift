//
//  ContentViewModel.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/15/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    private let useCase = ItemUseCase()
    
    func didTap() {
        useCase.excute()
    }
}
