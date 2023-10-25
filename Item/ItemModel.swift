//
//  ItemModel.swift
//  SwiftUIPractice
//
//  Created by 김인섭 on 10/25/23.
//

import Foundation

struct ItemModel {
    
    let id: Int
    let name: String
    var size: ItemSize
    
    enum ItemSize {
        case small, medium, large
    }
}
