//
//  ContentView.swift
//  PokeDexy
//
//  Created by Caio Lopes on 21/02/23.
//

import SwiftUI

struct PokeDexyList: View {
    
    @StateObject var pokemon = PokemonViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(searchText.isEmpty
                 ? pokemon.pokemonArray
                 : pokemon.pokemonArray.filter {$0.name.localizedCaseInsensitiveContains(searchText)},
                 id: \.self) { pokemon in
                NavigationLink {
                    
                } label: {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                }
            }
            
            .navigationTitle("PokéDexy")
            .searchable(text: $searchText,
                        prompt: "Procurar Pokémons...")
        }
        .task {
            await pokemon.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDexyList()
    }
}
