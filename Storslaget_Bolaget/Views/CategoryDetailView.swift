//
//  CategoryDetailView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct CategoryDetailView: View {
	
	@EnvironmentObject var state: StateManager
	
	@State var products: [Product]?
	
	var category: String
	
	init(category: String) {
		self.category = category
		
	}
	
	var body: some View {
		VStack {
			if self.products == nil {
				Text("Loading")
			} else {
//				ScrollView {
					ProductListComponent(products: self.products!)
						.navigationBarTitle(category)
//				}
			}
		}.onAppear() {
			print("GET THOSE PRODS")
			DispatchQueue.global(qos: .background).async {
				let products = self.state.getProductsOf(category: self.category)
				print("Got all prods")
				DispatchQueue.main.async {
					self.products = products
					print("Assigned, \(self.products?.count ?? -1)")
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
