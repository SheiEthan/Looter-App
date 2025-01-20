//
//  Game.swift
//  Looter App
//
//  Created by Ethan TILLIER on 1/20/25.
//

import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "eldenring.png"),
    Game(name: "Skyrim", genre: .rpg, coverName: "skyrim.png"),
    Game(name: "WoW", genre: .mmorpg, coverName: "wow.png"),
    Game(name: "CS:GO", genre: .fps, coverName: "csgo.png"),
    Game(name: "Diablo IV", genre: .looter, coverName: "diablo.png")
]
