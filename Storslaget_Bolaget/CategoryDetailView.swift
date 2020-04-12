//
//  CategoryDetailView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

//Show with
//Button.sheet(isPresented: self.$isPushing)

//TODO: Actually implement
func getProductsOf(category: String) -> [[String: Any]] {
	
}

struct CategoryDetailView: View {
	
	var category: String
	
    var body: some View {
		Text("Category \(category)")
		.navigationBarTitle(category)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(category: "Vita viner")
    }
}
