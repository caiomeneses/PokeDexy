//
//  PokemonDetailViewModel.swift
//  PokeDexy
//
//  Created by Caio Lopes on 22/02/23.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    
    @Published var id: Int = 0
    @Published var height: Double = 0.0
    @Published var weight: Double = 0.0
    
    var urlString = ""
    
    private struct PokemonReturned: Decodable {
        var id: Int
        var height: Double
        var weight: Double
    }
    
    func getData() async {
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let data = try? JSONDecoder().decode(PokemonReturned.self, from: data) else {
                return
            }
            
            self.id = data.id
            self.height = data.height
            self.weight = data.weight
            
        } catch {
            print("Algo deu errado")
        }
    }
}
