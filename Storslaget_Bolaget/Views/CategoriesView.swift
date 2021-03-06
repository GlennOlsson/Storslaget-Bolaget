//
//  CategoriesView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

let squareSize = getPixels(dimension: .horizontal, precent: 40)
let spacingSize = getPixels(dimension: .horizontal, precent: 5)

struct CategoriesView: View {
	private var pairList: [[String]]
	
	@EnvironmentObject var state: StateManager
	
	init(categoriesList: [String?]){
		pairList = []
		var i = 0
		while i < categoriesList.count {
			if i + 1 < categoriesList.count {
				pairList.append([categoriesList[i] ?? "Ingen kategori", categoriesList[i+1] ?? "Ingen kategori"])
			} else {
				pairList.append([categoriesList[i] ?? "Ingen kategori"])
			}
			i += 2
		}
	}
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(spacing: .some(spacingSize)) {
					ForEach(pairList, id: \.self) { catList in
						CategoryRow(categories: catList).environmentObject(self.state)
					}
				}
				Spacer()
			}
			.navigationBarTitle("Kategorier")
		}
	}
}

private struct CategoryRow: View {
	
	private let cat1: String
	private let cat2: String?
	
	@EnvironmentObject var state: StateManager
	
	init(categories: [String]){
		cat1 = categories[0]
		if categories.count > 1 {
			cat2 = categories[1]
		} else {
			cat2 = nil
		}
	}
	
	var body: some View {
		HStack(spacing: .some(spacingSize)){
			Category(name: cat1)
			if cat2 != nil {
				
				Category(name: cat2!).environmentObject(self.state)
			} else {
				Spacer()
					.frame(width: squareSize, height: squareSize, alignment: .center)
			}
		}
		.frame(width: getPixels(dimension: .horizontal, precent: 100))
	}
}

private struct Category: View {
	let name: String
	
	@EnvironmentObject var state: StateManager
	
	private func getBGColor() -> Color {
		let index = HASH(name) % COLORS.count
		return COLORS[index]
	}
	
	
	
	var body: some View {
		NavigationLink(destination: CategoryDetailView(category: name)) {
			Text(name)
				.foregroundColor(Color.white)
				.frame(width: squareSize, height: squareSize, alignment: .center)
				.background(getBGColor())
				.cornerRadius(20)
		}
	}
}

struct CategoriesView_Previews: PreviewProvider {
	
	static var previews: some View {
		ForEach(["iPhone XS Max"], id: \.self) { deviceName in
			CategoriesView(categoriesList: TEST_CATEGORIES)
				.previewDevice(PreviewDevice(rawValue: deviceName))
		}
	}
}
