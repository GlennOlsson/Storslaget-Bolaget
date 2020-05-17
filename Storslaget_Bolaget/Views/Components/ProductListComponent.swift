//
//  ProductListComponent.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI
import JSON

struct ProductListComponent: View {
	
	@State var showModal: Bool = false
	@State var currentProduct: Product?
	
	var products: [Product]
	
	init(products: [Product]){
		self.products = products
	}
	
	func onProductPressed(product: Product){
		self.showModal = true
		self.currentProduct = product
	}
	
	var body: some View {
		VStack {
			Spacer()
			ForEach(products) {product in
				ProductListItem(product: product, onPress: self.onProductPressed(product:))
					.listRowInsets(EdgeInsets())
					.clipped()
			}
			.listRowInsets(EdgeInsets())
		}
		.sheet(isPresented: self.$showModal, content: {
			ProductDetailView(product: self.currentProduct!)
		}).onDisappear(perform: {
			print("DISAPEAR")
		})
	}
}

private struct ProductListItem: View {
	var product: Product
	
	func getBGColor() -> Color {
		let index = HASH(product.price.stringValue) % COLORS.count
		return COLORS[index]
	}
	
	let onPress: (Product) -> Void
	
	init(product: Product, onPress: @escaping (Product) -> Void) {
		self.onPress = onPress
		self.product = product
	}
	
	var body: some View {
		VStack {
			Button(action: {
				self.onPress(self.product)
			}){
				HStack(){
					VStack{
						HStack {
							Text(product.productNameBold)
								.padding(.leading, 10)
							Spacer()
							
							if product.avgRating != nil {
								Text(product.avgRating!.stringValue)
							} else {
								Text("-")
							}
							Text("/ 5")
								.fontWeight(.light)
								.padding(.trailing, 10)
								.padding(.leading, -2)
							
						}
						Spacer().frame(height: 5)
						HStack {
							if product.productNameThin != nil {
								Text(product.productNameThin!)
//									.font(.subheadline)
							} else {
								Text("\(product.alcoholPercentage.stringValue)%")
//									.font(.subheadline)
							}
							Spacer()
							//TODO: Round value somewhat, 1 decimal?
							Text("\(product.price.stringValue) kr")
//								.font(.subheadline)
							
						}
						.padding(.horizontal, 10)
						.font(.subheadline)
					}
					.frame(width: getPixels(dimension: .horizontal, precent: 95), height: 100, alignment: .center)
					.background(getBGColor())
					.cornerRadius(20)
				}
				.frame(width: getPixels(dimension: .horizontal, precent: 100), alignment: .center)
				.foregroundColor(.white)
			}
			Spacer().frame(height: getPixels(dimension: .vertical, precent: 2), alignment: .center)
		}
	}
}

struct ProductListComponent_Previews: PreviewProvider {
	static var previews: some View {
		ProductListComponent(products: TEST_PRODUCT_LIST)
	}
}
