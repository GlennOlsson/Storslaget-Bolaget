//
//  State.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import JSON
import SwiftUI

class StateManager {
	
	class LoadingState {
		@State var isLoading: Bool = true
		@State var error: Error? = nil
		
		init() {
			isLoading = false
			error = nil
		}
	}
	
	var loadingState: LoadingState
	var allProducts: [Product]!
	
	init(){
		loadingState = LoadingState()
		getAllProcucts(callback: {
			self.allProducts = $0
			self.loadingState.isLoading = false
		}) { (error) in
			self.loadingState.isLoading = false
			self.loadingState.error = error
		}
	}
	
	//TODO: Handle nil categories
	func getProductsOf(category: String) -> [Product] {
		return allProducts.filter({(prod: Product) -> Bool in
			return prod.category != nil && prod.category == category
		})
	}
	
	func getCategories() -> [String]{
		let placeholderCategories = ["Öl", "Vita viner", "Roséviner", "Röda viner", "Sprit", "Dessert & appertif", "Högst betyg", "Högst betyg", "Högst betyg", "Högst betyg", "Högst betyg"]
		return placeholderCategories
	}
}
