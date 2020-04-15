//
//  ServerHandler.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import JSON

enum FetchError: String, Error {
	case badURL = "Bad URL"
	case noData = "No data in response"
	case jsonParseError = "Could not parse JSON response"
}

func updateProductInDB(product: Product) {
	//TODO
	print("Updated \(product.id)")
}

private func parseToProducts(data: Data?) throws -> [Product] {
	guard let unwrappedData = data else {
		throw FetchError.noData
	}
	let json = try? JSONSerialization.jsonObject(with: unwrappedData, options: [])
	if let productsJson = json as? [[String: Any]]{
		var products: [Product] = []
		for productJson in productsJson {
			let product = Product(json: productJson)
			products.append(product)
		}
		return products
	} else {
		throw FetchError.jsonParseError
	}
}

func getAllProcucts(callback: @escaping ([Product]) -> Void, onError: @escaping (Error) -> Void){
	guard let url = URL(string: "https://glennolsson.se") else {
		onError(FetchError.badURL)
		return
	}
	print("Making request")
	URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
		print("Got response", data, error)
		if error != nil {
			onError(error!)
			return
		}
		do {
			let products = try parseToProducts(data: data)
			callback(products)
		} catch {
			print("Error")
			onError(error)
		}
	}).resume()
}

func getAllProcucts() -> [Product]{
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
		print("BAD JSON x\(error)")
	}
	return []
}

//TODO: Perform search and call callback
func performSearch(searchString: String, callback: @escaping ([Product]) -> Void){
	sleep(1)
	callback(state.allProducts.filter({(product) -> Bool in
		return product.productNameBold.lowercased().contains(searchString.lowercased())
	}))
}
