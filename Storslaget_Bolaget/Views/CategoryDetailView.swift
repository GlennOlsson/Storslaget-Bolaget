//
//  CategoryDetailView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI
import JSON

struct CategoryDetailView: View {
	
	@State var showModal: Bool = false
	@State var currentProduct: Product?
	
	var category: String
//	var controller: CategoryDetailViewController
	
//	var products: [Product]
	
	init(category: String){
		self.category = category
		//		products = getProductsOf(category: category)
		//
		//		controller.getProducts()
//		products = getProductsOf(category: category)
//		controller = CategoryDetailViewController(category: category)
		
		
	}
	
	func updateProduct(id: ObjectIdentifier, newProduct: Product){
		print("UPDATE ")
	}
	
	var body: some View {
		ScrollView { 
			Spacer()
			ForEach(state.getProductsOf(category: category)) {product in
				Button(action: {
					self.showModal = true
					self.currentProduct = product
				}){
					ListItem(product: product)
						.listRowInsets(EdgeInsets())
						.clipped()
				}
				
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
		.sheet(isPresented: self.$showModal, content: {
			ProductDetailView(product: self.currentProduct!)
			.onDisappear(perform: {() -> Void in
				print("DISAPEAR")
			})
		})
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
							.font(.subheadline)
							.padding(.leading, 10)
					} else {
						Text("\(product.alcoholPercentage.stringValue)%")
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
			CategoryDetailView(category: "Öl")
		}
	}
}
