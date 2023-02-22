//
//  PokemonDetailView.swift
//  PokeDexy
//
//  Created by Caio Lopes on 22/02/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @StateObject var pokemonDetail = PokemonDetailViewModel()
    
    @State var pokemon: PokemonResult
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.fill")
            
            Text(pokemon.name.capitalized)
            
            if pokemonDetail.id < 10 {
                Text("00\(pokemonDetail.id)")
            } else if pokemonDetail.id < 100 {
                Text("0\(pokemonDetail.id)")
            } else {
                Text("\(pokemonDetail.id)")
            }
        }
        .font(.largeTitle)
        .task {
            pokemonDetail.urlString = pokemon.url
            await pokemonDetail.getData()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonResult(name: "Bulbasaur", url: "https://bulbasaur"))
    }
}
