//
//  CategoryDetailWC.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import JSON

//TODO: Actually implement
func getProductsOf(category: String) -> [Product] {
	do {
		let jsonRes = try JSON.from("Products.json")!
		if let productsJson = jsonRes as? [[String: Any]]{
			var products: [Product] = []
			for productJson in productsJson {
				let product = Product(json: productJson)
				products.append(product)
			}
			return products
		} else {
			print("ERROR PARSE JSON \(category)")
		}
	} catch {
		print("BAD JSON \(error)")
	}
	return []
}

public class CategoryDetailViewController {
	var products: [Product]
	var category: String
	
	init(category: String){
		self.category = category
		self.products = []
	}
	
	public func getProducts(){
		products = getProductsOf(category: category)
	}
}
