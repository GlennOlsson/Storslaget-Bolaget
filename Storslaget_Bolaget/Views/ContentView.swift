//
//  ContentView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
	@EnvironmentObject var state: StateManager
 
//	var isLoading: Bool
//	var error: Error?
	
    var body: some View {
        TabView(selection: $selection){
			CategoriesView(categoriesList: state.getCategories())
                .tabItem {
                    VStack {
						Image(systemName: "list.bullet")
                        Text("Kategorier")
                    }
			}
                .tag(0)
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Sök")
                    }
                }
                .tag(1)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
