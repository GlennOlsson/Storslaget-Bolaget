//
//  Product.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation

struct Product {
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
    var alcoholPercentage: Float
    var volume: Float
    var price: Float
    var vintage: Int32
    var recycleFee: Float
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
	var isInStoreSearchAssortment: String?
}
