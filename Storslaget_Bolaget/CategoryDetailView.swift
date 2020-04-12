//
//  CategoryDetailView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI
import JSON

//Show with
//Button.sheet(isPresented: self.$isPushing)

struct CategoryDetailView: View {
	
	var category: String
	//	var controller: CategoryDetailViewController
	
	let products: [Product]
	
	init(category: String){
		self.category = category
		//		products = getProductsOf(category: category)
		//		controller = CategoryDetailViewController(category: category)
		//		controller.getProducts()
		products = getProductsOf(category: category)
	}
	
	var body: some View {
		ScrollView {
			Spacer()
			ForEach(products) {product in
				ListItem(product: product)
					.listRowInsets(EdgeInsets())
					.clipped()
				Spacer().frame(height: getPixels(dimension: .vertical, precent: 2), alignment: .center)
			}
				//			.padding(.leading, -18.0)
				//			.lineSpacing(50)
				.listRowInsets(EdgeInsets())
				
				
				//		}}
				.navigationBarTitle(category)
			//		.onAppear(){
			//			//				self.controller.getProducts()
		}
	}
}

struct ListItem: View {
	var product: Product
	
	func getBGColor() -> Color {
		let index = HASH(product.price.stringValue) % COLORS.count
		return COLORS[index]
	}
	
	var body: some View {
		HStack(){
			VStack{
				HStack {
					Text(product.productNameBold)
						.padding(.leading, 10)
					Spacer()
					Text(product.rating.stringValue)
					Text("/ 5")
						.fontWeight(.light)
						.padding(.trailing, 10)
						.padding(.leading, -2)
					
				}
				Spacer().frame(height: 5)
				HStack {
					if product.productNameThin != nil {
						Text(product.productNameThin!)
							.font(.subheadline)
							.padding(.leading, 10)
					} else {
						Text(product.alcoholPercentage.stringValue)
							.font(.subheadline)
							.padding(.leading, 10)
					}
					Spacer()
					//TODO: Round value somewhat, 1 decimal?
					Text("\(product.price.stringValue) kr")
					.padding(.trailing, 10)
						.font(.subheadline)
					
				}
			}
			.frame(width: getPixels(dimension: .horizontal, precent: 95), height: 100, alignment: .center)
			.background(getBGColor())
			.cornerRadius(20)
		}
		.frame(width: getPixels(dimension: .horizontal, precent: 100), alignment: .center)
			
		.foregroundColor(.white)
		
		
		
	}
}

struct CategoryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			CategoryDetailView(category: "Vita viner")
		}
	}
}
