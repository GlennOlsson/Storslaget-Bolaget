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
func getProductsOf(category: String) -> [[String: Any]] {
	do {
		let jsonRes = try JSON.from("Products.json")!
		if let products = jsonRes as? [[String: Any]]{
			return products
		} else {
			print("ERROR PARSE JSON \(category)")
		}
	} catch {
		print("BAD JSON \(error)")
	}
	return [[:]]
}

public class CategoryDetailViewController {
	var products: [[String: Any]]
	var category: String
	
	
	init(category: String){
		self.category = category
		self.products = [[:]]
	}
	
	public func getProducts(){
		products = getProductsOf(category: category)
	}
}
