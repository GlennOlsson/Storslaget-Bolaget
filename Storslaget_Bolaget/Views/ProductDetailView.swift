//
//  ProductDetailView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
	
	var product: Product
	
	//Keep track of old rating so we only update in DB if changed
	private var oldRating: Int?
	
	init(product: Product){
		self.product = product
		oldRating = self.product.myRating
	}
	
	func getBGColor() -> Color {
		let index = HASH(product.price.stringValue) % COLORS.count
		return COLORS[index]
	}
	
	func onUpdate(newRating: Int){
		product.myRating = newRating
	}
	
	var body: some View {
		VStack{
			VStack (spacing: .some(100)) {
				Spacer()
				VStack{
					Text(product.productNameBold)
						.font(.title)
						.multilineTextAlignment(.center)
						.fixedSize(horizontal: false, vertical: true)
					if product.productNameThin != nil {
						Text(product.productNameThin!)
							.font(.headline)
					}
				}
				.frame(maxWidth: getPixels(dimension: .horizontal, precent: 90), alignment: .center)
				.scaledToFit()
				VStack(spacing: .some(10)) {
					HStack {
						Text("\(product.alcoholPercentage.stringValue)%")
							.multilineTextAlignment(.center).frame(width: getPixels(dimension: .horizontal, precent: 30), alignment: .center)
							.fixedSize(horizontal: false, vertical: true)
						Spacer()
						if product.category != nil {
							Text(product.category!)
								.multilineTextAlignment(.center)
								.frame(width: getPixels(dimension: .horizontal, precent: 40), alignment: .center)
								.fixedSize(horizontal: false, vertical: true)
						}
					}.frame(width: getPixels(dimension: .horizontal, precent: 80), alignment: .center)
					HStack {
						Text("\(product.volume)ml")
							.multilineTextAlignment(.center)
							.frame(width: getPixels(dimension: .horizontal, precent: 30), alignment: .center)
							.fixedSize(horizontal: false, vertical: true)
						Spacer()
						if product.type != nil {
							Text(product.type!)
								.multilineTextAlignment(.center)
								.frame(width: getPixels(dimension: .horizontal, precent: 40), alignment: .center)
								.fixedSize(horizontal: false, vertical: true)
						}
					}.frame(width: getPixels(dimension: .horizontal, precent: 80), alignment: .center)
					HStack {
						Text("\(product.price)kr")
							.multilineTextAlignment(.center)
							.frame(width: getPixels(dimension: .horizontal, precent: 30), alignment: .center)
							.fixedSize(horizontal: false, vertical: true)
						Spacer()
						if product.country != nil {
							Text(product.country!)
								.multilineTextAlignment(.center)
								.frame(width: getPixels(dimension: .horizontal, precent: 40), alignment: .center)
								.fixedSize(horizontal: false, vertical: true)
						}
					}.frame(width: getPixels(dimension: .horizontal, precent: 80), alignment: .center)
				}.padding(.horizontal, getPixels(dimension: .horizontal, precent: 30))
				Rater(myRating: product.myRating, onUpdate: self.onUpdate(newRating:))
				Spacer()
			}
			.padding(.horizontal, 30.0)
			.frame(width: getPixels(dimension: .horizontal, precent: 100))
		}
		.background(getBGColor())
		.foregroundColor(.white)
		.frame(width: getPixels(dimension: .horizontal, precent: 100), height: getPixels(dimension: .vertical, precent: 100), alignment: .center)
		.onDisappear(perform: {() -> Void in
			if self.oldRating != self.product.myRating {
				//Must update rating in DB
				updateProductInDB(product: self.product)
			}
		})
	}
}

struct Rater: View {
	@State var rating: Int = 3
	
	let onUpdate: (Int) -> Void
	
	let starSize: CGFloat
	
	//onUpdate takes one parameter, the new rating, and should update the product accordingly
	init(myRating: Int?, onUpdate: @escaping (Int) -> Void){
		self._rating = State(initialValue: myRating ?? 0)
		
		self.onUpdate = onUpdate
		
		starSize = getPixels(dimension: .horizontal, precent: 13)
	}
	
	var body: some View {
		HStack {
			if rating > 0 {
				ForEach((1...rating), id: \.self) { index in
					Button(action: {
						self.rating = index
						self.onUpdate(index)
					}) {
						Image(systemName: "star.fill")
							.resizable()
							.frame(width: self.starSize, height: self.starSize, alignment: .center)
					}
				}
			}
			if rating < 5 {
				ForEach((rating + 1...5), id: \.self) { index in
					Button(action: {
						self.rating = index
						self.onUpdate(index)
					}) {
						Image(systemName: "star")
							.resizable()
							.frame(width: self.starSize, height: self.starSize, alignment: .center)
					}
				}
			}
		}
	}
}

struct ProductDetailView_Previews: PreviewProvider {
	static var previews: some View {
		ForEach(["iPhone XS Max", "iPhone SE"], id: \.self) { deviceName in
			ProductDetailView(product: state.getProductsOf(category: "Öl")[2]).previewDevice(PreviewDevice(rawValue: deviceName))
		}
	}
}
