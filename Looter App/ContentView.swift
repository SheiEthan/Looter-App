//
//  ContentView.swift
//  Looter App
//
//  Created by Ethan TILLIER on 1/20/25.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure"]

    func addItem(item: String) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject private var inventory = Inventory()  // Utilisation de @StateObject pour garder l'état
    @State private var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            List {
                Button(action: {
                    // Ajouter un objet directement à loot via l'inventaire
                    inventory.addItem(item: "Magie de feu - rare")  // Exemple d'ajout d'objet
                }) {
                    Text("Ajouter un objet")
                }
                
                ForEach(inventory.loot, id: \.self) { item in
                    HStack {
                        // Extraire la rareté de l'item et obtenir la couleur associée
                        let rarity = getRarity(from: item)
                        Circle()
                            .fill(rarity.color)
                            .frame(width: 20, height: 20)  // Taille de la pastille
                        
                        Text(item)  // Nom de l'item
                    }
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView()
                    .environmentObject(inventory)
            }
            .navigationBarTitle("Loot")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showAddItemView.toggle() // Afficher la vue pour ajouter un item
                    }) {
                        Image(systemName: "plus.circle.fill")  // Icône "plus"
                    }
                }
            }
        }
    }
    
    // Fonction pour récupérer la rareté à partir du nom de l'item
    func getRarity(from item: String) -> AddItemView.Rarity {
        let rarityString = item.split(separator: "-").last?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "common"
        return AddItemView.Rarity(rawValue: rarityString) ?? .common
    }
}

#Preview {
    ContentView()
}
