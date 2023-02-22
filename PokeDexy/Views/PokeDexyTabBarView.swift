//
//  PokeDexyTabBar.swift
//  PokeDexy
//
//  Created by Caio Lopes on 22/02/23.
//

import SwiftUI

struct PokeDexyTabBarView: View {
    
    @State var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PokeDexyListView()
                .tabItem {
                    Image(selectedTab == 1 ?
                          "pokedexIconEnabled" : "pokedexIcon")
                    Text(selectedTab == 1 ?
                         "Pokédex" : "")
                }
                .tag(1)
            
            PokeDexyRegionsView()
                .tabItem {
                    Image(selectedTab == 2 ?
                          "regionsIconEnabled" : "regionsIcon")
                    Text(selectedTab == 2 ?
                         "Regiões" : "")
                }
                .tag(2)
            
            PokeDexyFavoritesView()
                .tabItem {
                    Image(selectedTab == 3 ?
                          "favoritesIconEnabled" : "favoritesIcon")
                    Text(selectedTab == 3 ?
                         "Favoritos" : "")
                }
                .tag(3)
            
            PokeDexyProfileView()
                .tabItem {
                    Image(selectedTab == 4 ?
                          "profileIconEnabled" : "profileIcon")
                    Text(selectedTab == 4 ?
                         "Conta" : "")
                }
                .tag(4)
        }
        .tint(Colors.tabBarAccentColor)
    }
}

struct PokeDexyTabBar_Previews: PreviewProvider {
    static var previews: some View {
        PokeDexyTabBarView()
    }
}
