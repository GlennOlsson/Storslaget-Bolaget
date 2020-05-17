//
//  State.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import SwiftUI

class StateManager: ObservableObject {
	
	class LoadingState: ObservableObject {
		@Published var isLoading: Bool = true
		@Published var error: Error? = nil
		
		init() {
			isLoading = true
			error = nil
		}
	}
	
	@Published var loadingState: LoadingState = LoadingState()
	@Published var allProducts: [Product]?
	
	func loadProducts() {
		print("Has assinged")
		getAllProcucts(callback: { products in
			print("Callback with \(products.count) products")
			DispatchQueue.main.async {
				self.allProducts = products
				self.loadingState.isLoading = false
			}
		})
		print("Gone")
	}
	
	//TODO: Handle nil categories
	func getProductsOf(category: String) -> [Product] {
		print("Get all prods")
		guard allProducts != nil else {
			return []
		}
		
		if category == "Ingen kategori" {
			return allProducts!.filter({(prod: Product) -> Bool in
				return prod.category == nil
			})
		} else {
			return allProducts!.filter({(prod: Product) -> Bool in
				return (prod.category != nil && prod.category == category)
			})
		}
	}
	
	func getCategories() -> [String?]{
		var categories: Set<String?> = []
		
		for product in allProducts ?? [] {
			categories.insert(product.category)
		}
		
		return categories.map({cat in
			return cat
		})
	}
}
