//
//  State.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import JSON

class StateManager {
	
	var allProducts: [Product]
	
	init(){
		allProducts = getAllProcucts()
	}
	
	//TODO: Handle nil categories
	func getProductsOf(category: String) -> [Product] {
		return allProducts.filter({(prod: Product) -> Bool in
			return prod.category != nil && prod.category == category
		})
	}
	
	func updateRating(newRating: Int, productToChange: Product) {
		for product in allProducts {
			if product.id == productToChange.id {
				product.myRating = newRating
			}
		}
	}
}
