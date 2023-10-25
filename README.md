# Repositoriable

## Interface
```swift
protocol Repositoriable {
    
    associatedtype Item
    
    func add(_ item: Item)
    func delete(_ item: Item)
    func updateItem(_ item: Item)
    
    func getAll() -> [Item]
    func get<T: Equatable>(keyPath: KeyPath<Item, T>, value: T) -> Item?
    func get(_ filter: (Item) -> Bool) -> [Item]
}
```

## Implement
```swift
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
```

## UseCase
```swift
private let repository = ItemRepository()

let item: ItemModel = .....

repository.add(item)
repository.updateItem(item)
repository.delete(item)

let foundIten = repository.get(keyPath: \.id, value: 1)
let filteredItems = repository.get { $0.size == .large && $0.name == "item" }
let allItems = repository.getAll()
```
