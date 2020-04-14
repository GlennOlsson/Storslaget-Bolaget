//
//  ServerHandler.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import JSON

func updateProductInDB(product: Product){
	//TODO
	print("Updated \(product.id)")
}

func getAllProcucts() -> [Product]{
	print("GETT PRODUCTS")
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
			print("ERROR PARSE JSON")
		}
	} catch {
		print("BAD JSON \(error)")
	}
	return []
}
