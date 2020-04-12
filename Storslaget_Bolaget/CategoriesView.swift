//
//  CategoriesView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
	
	private let placeholderCategories = ["Öl", "Vita viner", "Roséviner", "Röda viner", "Sprit", "Dessert & appertif", "Högst betyg", "Högst betyg", "Högst betyg", "Högst betyg", "Högst betyg"]
	
	private var pairList: [[String]]
	
	init(categoriesList: [String] = []){
		let list = categoriesList.count > 0 ? categoriesList : placeholderCategories
		
		pairList = []
		var i = 0
		while i < list.count {
			if i + 1 < list.count {
				pairList.append([list[i], list[i+1]])
			} else {
				pairList.append([list[i]])
			}
			i += 2
		}
	}
	
    var body: some View {
		ScrollView {
			VStack(spacing: .some(30)) {
				ForEach(pairList, id: \.self) { catList in
					CategoryRow(categories: catList)
				}
			}
		}
    }
}

private struct CategoryRow: View {
	
	private let cat1: String
	private let cat2: String?
	
	init(categories: [String]){
		cat1 = categories[0]
		if categories.count > 1 {
			cat2 = categories[1]
		} else {
			cat2 = nil
		}
	}
	
	var body: some View {
		HStack(spacing: .some(30)){
			Category(name: cat1)
			if cat2 != nil {
				Category(name: cat2!)
			} else {
				Spacer()
					.frame(width: 150, height: 150, alignment: .center)
			}
		}
		.frame(width: UIScreen.main.bounds.width)
	}
}

private struct Category: View {
	let name: String
	
	private func getBGColor() -> Color {
		let index = HASH(name) % COLORS.count
		return COLORS[index]
	}
	
	var body: some View {
		Text(name)
			.foregroundColor(Color.white)
			.frame(width: 150, height: 150, alignment: .center)
			.background(getBGColor())
			.cornerRadius(20)
	}
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
