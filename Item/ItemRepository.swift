//
//  ItemRepository.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

class ItemRepository: Repositoriable {
    
    typealias Item = ItemModel
    
    private var db: [Item] = []
    
    func add(_ item: ItemModel) {
        db.append(item)
    }
    
    func delete(_ item: ItemModel) {
        db = db.filter { $0.id != item.id }
    }
    
    func updateItem(_ item: ItemModel) {
        for (index, element) in db.enumerated() {
            guard element.id == item.id else { continue }
            db[index] = item
        }
    }
    
    func getAll() -> [ItemModel] {
        db
    }
    
    func get<T: Equatable>(keyPath: KeyPath<ItemModel, T>, value: T) -> ItemModel? {
        db.filter { $0[keyPath: keyPath] == value }.first
    }
    
    func get(_ filter: (ItemModel) -> Bool) -> [ItemModel] {
        db.filter(filter)
    }
}
