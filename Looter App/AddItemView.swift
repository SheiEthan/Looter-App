//
//  AddItemView.swift
//  Looter App
//
//  Created by Ethan TILLIER on 1/20/25.
//

import SwiftUI

struct AddItemView: View {
    enum Rarity: String, CaseIterable, Identifiable {
        case common
        case uncommon
        case rare
        case epic
        case legendary
        case unique
        
        var id: String { self.rawValue }
        
        var color : Color {
            switch self{
            case .common:
                return .gray
            case .uncommon:
                return .green
            case .rare:
                return .blue
            case .epic:
                return .purple
            case .legendary:
                return .yellow
            case .unique:
                return .indigo
            }
        }
        
    }
    
    @EnvironmentObject var inventory: Inventory
    
    @State private var name: String = ""  // Nom de l'objet
    @State private var rarity: String = Rarity.common.rawValue  // Rareté de l'objet sous
    @State public var game: Game = Game.emptyGame
    @State public var quantity: Int = 1
    @State public var type: ItemType = .unknown
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)  // Champ pour entrer le nom de l'objet
                    
                    Picker("Rareté", selection: $rarity) {
                        ForEach(Rarity.allCases) { rarity in
                            Text(rarity.rawValue.capitalized)
                                .foregroundColor(self.getRarityColor(from: rarity.rawValue))  // Appliquer la couleur correspondante
                        }
                    }
                }
                Section {
                    Picker("Jeu", selection: $game) {
                        ForEach(availableGames) { game in
                            Text(game.name)
                        }
                    }
                    Stepper{
                        Text ("Quantité: \(quantity)")
                    } onIncrement: {
                        quantity += 1
                    } onDecrement: {
                        if (quantity > 1) {
                            quantity -= 1
                        }
                    }
                }
                
                Section{
                    Picker("Type", selection: $type) {
                        ForEach(ItemType.allCases, id: \.self) { type in
                            Text(type.RowValue)
                                .font(.title)
                        }
                    }
                    .pickerStyle(.palette)
                }
                
                Button(action: {
                    // Ajouter un nouvel objet à loot avec la rareté en tant que chaîne
                    inventory.addItem(item: "\(name) - \(rarity)")
                    // Fermer la vue
                    dismiss()
                }) {
                    Text("Ajouter")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Ajouter un objet")
        }
    }
    
    // Fonction pour obtenir la couleur en fonction de la rareté en String
    func getRarityColor(from rarity: String) -> Color {
        guard let rarityEnum = Rarity(rawValue: rarity) else {
            return .gray // Valeur par défaut
        }
        return rarityEnum.color
    }

    @Environment(\.dismiss) var dismiss
}
