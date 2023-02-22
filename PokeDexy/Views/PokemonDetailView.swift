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
    @Environment(\.dismiss) var dissmissView
    
    var body: some View {
        VStack {
            Ellipse()
                .fill(Colors.gradientGrassColor)
                .frame(width: 498, height: 498)
                .offset(y: -185)
                .ignoresSafeArea(edges: .top)
                .padding(.bottom, -235)
            
            AsyncImage(url: URL(string: pokemonDetail.front_default),
                       scale: 0.215)
                .frame(width: 150, height: 150)
                .offset(y: -215)
                .padding(.bottom, -215)
            
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                pokemonID
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Spacer()
            
            .navigationBarBackButtonHidden(true)
        }
        .font(.largeTitle)
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dissmissView.callAsFunction()
                } label: {
                    Image(systemName: "chevron.left")
                        .bold()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .bold()
                }

            }
        }
        .task {
            pokemonDetail.urlString = pokemon.url
            await pokemonDetail.getData()
        }
    }
    
    var pokemonID: some View {
        VStack {
            if pokemonDetail.id < 10 {
                Text("Nº00\(pokemonDetail.id)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            } else if pokemonDetail.id < 100 {
                Text("Nº0\(pokemonDetail.id)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            } else {
                Text("Nº\(pokemonDetail.id)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonResult(name: "Bulbasaur", url: ""))
    }
}
