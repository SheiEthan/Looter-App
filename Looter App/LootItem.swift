//
//  LootItem.swift
//  Looter App
//
//  Created by Ethan TILLIER on 1/20/25.
//

import SwiftUI

enum ItemType : String{
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

struct LootItem: View {
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: AddItemView.Rarity
    var attackStrenght: Int?
    var game: Game
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

