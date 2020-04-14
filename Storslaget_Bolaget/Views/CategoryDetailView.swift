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
	
	init(category: String){
		self.category = category
	}
	
	var body: some View {
		ScrollView {
			ProductListComponent(products: state.getProductsOf(category: category))
				.navigationBarTitle(category)
		}
	}
}

struct CategoryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			CategoryDetailView(category: "Öl")
		}
	}
}
