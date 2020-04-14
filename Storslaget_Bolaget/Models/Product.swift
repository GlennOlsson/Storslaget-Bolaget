//
//  Product.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation

class Product: Identifiable {
	
	var id: ObjectIdentifier
	
	var avgRating: NSNumber?
	var myRating: Int?
	
	//Required
	var productId: String
    var productNumber: String
    var productNameBold: String
    var isKosher: Bool
    var restrictedParcelQuantity: Int32
    var isOrganic: Bool
    var isEthical: Bool
    var isWebLaunch: Bool
    var sellStartDate: String //Date-time
    var isCompletelyOutOfStock: Bool
    var isTemporaryOutOfStock: Bool
    var alcoholPercentage: NSNumber
    var volume: NSNumber
    var price: NSNumber
    var vintage: Int32
    var recycleFee: NSNumber
    var isManufacturingCountry: Bool
    var isRegionalRestricted: Bool
    var isNews: Bool
	
	//Optional
	var productNameThin: String?
	var category: String?
	var productNumberShort: String?
	var producerName: String?
	var supplierName: String?
	var bottleTextShort: String?
    var seal: String?
	var ethicalLabel: String?
	var country: String?
    var originLevel1: String?
    var originLevel2: String?
	var subCategory: String?
	var type: String?
	var style: String?
	var assortmentText: String?
    var beverageDescriptionShort: String?
    var usage: String?
    var taste: String?
    var assortment: String?
	var isInStoreSearchAssortment: Bool?
	
	
	init(json: [String: Any]){
		productId = json["ProductId"] as! String
		productNumber = json["ProductNumber"] as! String
		productNameBold = json["ProductNameBold"] as! String
		isKosher = json["IsKosher"] as! Bool
		restrictedParcelQuantity = json["RestrictedParcelQuantity"] as! Int32
		isOrganic = json["IsOrganic"] as! Bool
		isEthical = json["IsEthical"] as! Bool
		isWebLaunch = json["IsWebLaunch"] as! Bool
		sellStartDate = json["SellStartDate"] as! String
		isCompletelyOutOfStock = json["IsCompletelyOutOfStock"] as! Bool
		isTemporaryOutOfStock = json["IsTemporaryOutOfStock"] as! Bool
		alcoholPercentage = json["AlcoholPercentage"] as! NSNumber
		volume = json["Volume"] as! NSNumber
		price = json["Price"] as! NSNumber
		vintage = json["Vintage"] as! Int32
		recycleFee = json["RecycleFee"] as! NSNumber
		isManufacturingCountry = json["IsManufacturingCountry"] as! Bool
		isRegionalRestricted = json["IsRegionalRestricted"] as! Bool
		isNews = json["IsNews"] as! Bool

		productNameThin = json["ProductNameThin"] as? String
		category = json["Category"] as? String
		productNumberShort = json["ProductNumberShort"] as? String
		producerName = json["ProducerName"] as? String
		supplierName = json["SupplierName"] as? String
		bottleTextShort = json["BottleTextShort"] as? String
		seal = json["Seal"] as? String
		ethicalLabel = json["EthicalLabel"] as? String
		country = json["Country"] as? String
		originLevel1 = json["OriginLevel1"] as? String
		originLevel2 = json["OriginLevel2"] as? String
		subCategory = json["SubCategory"] as? String
		type = json["Type"] as? String
		style = json["Style"] as? String
		assortmentText = json["AssortmentText"] as? String
		beverageDescriptionShort = json["BeverageDescriptionShort"] as? String
		usage = json["Usage"] as? String
		taste = json["Taste"] as? String
		assortment = json["Assortment"] as? String
		isInStoreSearchAssortment = json["IsInStoreSearchAssortment"] as? Bool
		
		id = ObjectIdentifier(productId as AnyObject)
		avgRating = json["AvgRating"] as? NSNumber
		myRating = json["MyRating"] as? Int
	}
	
	func setRating(rating: Int){
		self.myRating = rating
	}
}
