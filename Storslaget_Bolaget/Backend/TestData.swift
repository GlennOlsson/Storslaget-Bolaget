//
//  TestData.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-26.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

let TEST_CATEGORIES = ["Öl", "Vin", "Sprit"]
let TEST_PRODUCT = Product(json: [
	"ProductId": "14212174",
	"ProductNumber": "8001015",
	"ProductNameBold": "PangPang",
	"ProductNameThin": "Peach Preacher",
	"Category": "Öl",
	"ProductNumberShort": "80010",
	"ProducerName": "PangPang Brewery",
	"SupplierName": "Brill & Co AB",
	"IsKosher": false,
	"BottleTextShort": "Burk",
	"RestrictedParcelQuantity": 0,
	"IsOrganic": false,
	"IsEthical": false,
	"IsWebLaunch": false,
	"SellStartDate": "2019-06-03T00:00:00",
	"IsCompletelyOutOfStock": false,
	"IsTemporaryOutOfStock": false,
	"AlcoholPercentage": 6,
	"Volume": 330,
	"Price": 59,
	"Country": "Sverige",
	"OriginLevel1": "Stockholms län",
	"OriginLevel2": "Stockholms stad",
	"Vintage": 0,
	"SubCategory": "Öl",
	"Style": "Övrig syrlig öl",
	"AssortmentText": "Lokalt & Småskaligt",
	"BeverageDescriptionShort": "Öl, Övrig syrlig öl",
	"Usage": "Serveras vid 6-8°C som sällskapsdryck.",
	"Taste": "Fruktig, syrlig smak med inslag av persika, ananas, vanilj och citrus.",
	"Assortment": "TSLS",
	"RecycleFee": 1,
	"IsManufacturingCountry": true,
	"IsRegionalRestricted": false,
	"IsInStoreSearchAssortment": "0132;0140;0170;0171;0172;0174;0177;0178",
	"IsNews": false,
	"MyRating": 5,
	"AvgRating": 3.141597
])

let TEST_PRODUCT_LIST = [
	TEST_PRODUCT,
	TEST_PRODUCT,
	TEST_PRODUCT
]
