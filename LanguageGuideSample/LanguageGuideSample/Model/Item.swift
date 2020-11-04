//
//  Item.swift
//  LanguageGuideSample
//
//  Created by Camila Campana on 18/10/20.
//

enum ItemType {
    case typealiases
    case tuples
    case arrays
}

struct Item {
    let title: String
    let description: String
    let type: ItemType
}
