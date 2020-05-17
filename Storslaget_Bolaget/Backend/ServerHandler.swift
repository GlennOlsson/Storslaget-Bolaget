//
//  ServerHandler.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import Combine

enum FetchError: String, Error {
	case badURL = "Bad URL"
	case noData = "No data in response"
	case jsonParseError = "Could not parse JSON response"
}

func updateProductInDB(product: Product) {
	//TODO
	print("Updated \(product.id)")
}

private func parseToProducts(jsonString: String) throws -> [Product] {
	do {
		let json = try? JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!)
		if let productsJson = json as? [[String: Any]]{
			var products: [Product] = []
			for productJson in productsJson {
				let product = Product(json: productJson)
				products.append(product)
			}
			return products
		} else {
			print("JSON PARSE ERROR")
			throw FetchError.jsonParseError
		}
	} catch {
		print("Error with JSON Serilizaton")
		throw FetchError.jsonParseError
	}
}

//TODO: On error
func getAllProcucts(callback: @escaping (_ products: [Product]) -> Void) {
	guard let url = URL(string: "https://us-central1-storslaget-bolaget.cloudfunctions.net/getAllProductsURL") else {
		//		onError(FetchError.badURL)
		return
	}
	print("Making request")
	let request = URLRequest(url: url)
	
	//if no error, data is the url to the file on firebase
	URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
		guard let data = data else  {
			callback([])
			return
		}
		print("Got response", data.count)
		if data.count < 100 {
			print("data: \(String(data: data, encoding: .utf8))")
		}
		do {
			let dataString = String(data: data, encoding: .utf8)
			guard let jsonURL = URL(string: dataString!) else {
				print("Could not get url out of response")
				//					onError(FetchError.badURL)
				callback([])
				return
			}
			print("getting json from \(jsonURL.baseURL)")
			let json = try String(contentsOf: jsonURL, encoding: .utf8)
			print("got json, parsing")
			let products = try parseToProducts(jsonString: json)
			print("Parsed")
			//				callback(products)
			callback(products)
		} catch {
			print("Error")
			//				onError(error)
			callback([])
		}
		}).resume()
}
//
//func getAllProcucts() -> [Product]{
//	do {
//		let jsonRes = try JSON.from("Products.json")!
//		if let productsJson = jsonRes as? [[String: Any]]{
//			var products: [Product] = []
//			for productJson in productsJson {
//				let product = Product(json: productJson)
//				products.append(product)
//			}
//			return products
//		} else {
//			print("ERROR PARSE JSON")
//		}
//	} catch {
//		print("BAD JSON x\(error)")
//	}
//	return []
//}
