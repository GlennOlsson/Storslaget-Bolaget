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
	var controller: CategoryDetailViewController
	
	init(category: String){
		self.category = category
		//		products = getProductsOf(category: category)
		controller = CategoryDetailViewController(category: category)
	}
	
	var body: some View {
		Text("Category \(category)")
			.navigationBarTitle(category)
			.onAppear(){
				self.controller.getProducts()
		}
	}
}

struct CategoryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		CategoryDetailView(category: "Vita viner")
	}
}
