//
//  PokemonViewModel.swift
//  PokeDexy
//
//  Created by Caio Lopes on 21/02/23.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    
    @Published var count: Int = 0
    @Published var pokemonArray: [PokemonResult] = []
    
    var urlString = "https://pokeapi.co/api/v2/pokemon?limit=101&offset=0"
    
    private struct PokemonReturned: Decodable {
        var count: Int
        var results: [PokemonResult]
    }
    
    func getData() async {
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let data = try? JSONDecoder().decode(PokemonReturned.self, from: data) else {
                return
            }
            
            self.count = data.count
            self.pokemonArray = data.results
            
        } catch {
            print("Algo deu errado")
        }
    }
}
