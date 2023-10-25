//
//  ItemUseCase.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

struct ItemUseCase {
    
    private let repository = ItemRepository()
    
    func excute() {
        
        let mock = ItemModel(id: 0, name: "", size: .small)
        var mock2 = ItemModel(id: 1, name: "item", size: .medium)
        
        repository.add(mock)
        repository.add(mock2)
        repository.delete(mock)
        mock2.size = .large
        repository.updateItem(mock2)
        
        let matchedKeypath = repository.get(keyPath: \.id, value: 1)
        let filteredItems = repository.get { $0.size == .large && $0.name == "item" }
        let getAll = repository.getAll()
        
        print(matchedKeypath) // ItemModel(id: 1, name: "item", size: SwiftUIPractice.ItemModel.ItemSize.large)
        print(filteredItems) // [ItemModel(id: 1, name: "item", size: SwiftUIPractice.ItemModel.ItemSize.large)]
        print(getAll) // [ItemModel(id: 1, name: "item", size: SwiftUIPractice.ItemModel.ItemSize.large)]
    }
}
