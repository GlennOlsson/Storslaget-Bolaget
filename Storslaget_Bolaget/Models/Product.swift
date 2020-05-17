//
//  Product.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation

class Product: Identifiable, ObservableObject {
	
	var id: ObjectIdentifier
	
	var avgRating: NSNumber?
	var myRating: Int?
	
	//Required
	var productId: String
    var productNameBold: String
    var alcoholPercentage: NSNumber
    var volume: NSNumber
    var price: NSNumber
	
	//Optional
	var productNameThin: String?
	var category: String?
	var productNumberShort: String?
	var producerName: String?
	var supplierName: String?
	var country: String?
	var subCategory: String?
	var type: String?
	var style: String?
	var assortmentText: String?
    var beverageDescriptionShort: String?
	
	init(json: [String: Any]){
		productId = json["ProductId"] as! String
		
		productNameBold = json["ProductNameBold"] as! String
		
		alcoholPercentage = json["AlcoholPercentage"] as! NSNumber
		volume = json["Volume"] as! NSNumber
		price = json["Price"] as! NSNumber

		productNameThin = json["ProductNameThin"] as? String
		category = json["Category"] as? String
		productNumberShort = json["ProductNumberShort"] as? String
		producerName = json["ProducerName"] as? String
		supplierName = json["SupplierName"] as? String
		
		country = json["Country"] as? String
		
		subCategory = json["SubCategory"] as? String
		type = json["Type"] as? String
		style = json["Style"] as? String
		assortmentText = json["AssortmentText"] as? String
		beverageDescriptionShort = json["BeverageDescriptionShort"] as? String
	
		id = ObjectIdentifier(productId as AnyObject)
		avgRating = json["AvgRating"] as? NSNumber
		myRating = json["MyRating"] as? Int
		
		//Can remove 23 (13 required)
		//18 left (5 required)
	}
	
	func setRating(rating: Int){
		self.myRating = rating
	}
}
