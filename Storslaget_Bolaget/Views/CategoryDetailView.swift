//
//  CategoryDetailView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI
import JSON

struct CategoryDetailView: View {
	
	@EnvironmentObject var state: StateManager
	
	@State var products: [Product]?
	
	var category: String
	
	init(category: String) {
		self.category = category
		self.products = state.getProductsOf(category: category)
	}
	
	var body: some View {
		VStack {
			if self.products == nil {
				Text("Loading")
			} else {
				ScrollView {
					ProductListComponent(products: self.products!)
						.navigationBarTitle(category)
				}
			}
		}
	}
	
}

struct CategoryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			CategoryDetailView(category: "Öl")
		}
	}
}
