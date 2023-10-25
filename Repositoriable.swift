//
//  Repository.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

protocol Repositoriable {
    
    associatedtype Item
    
    func add(_ item: Item)
    func delete(_ item: Item)
    func updateItem(_ item: Item)
    
    func getAll() -> [Item]
    func get<T: Equatable>(keyPath: KeyPath<Item, T>, value: T) -> Item?
    func get(_ filter: (Item) -> Bool) -> [Item]
}
