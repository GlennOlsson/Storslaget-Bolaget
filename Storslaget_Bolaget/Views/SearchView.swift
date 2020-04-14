//
//  SearchView.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct SearchView: View {
	@State var searchString: String = ""
	@State var products: [Product] = []
	
	@State var isLoading: Bool = false
	
	func onUpdateSearch(searchString: String){
		self.searchString = searchString
		self.isLoading = true
		performSearch(searchString: self.searchString, callback: {
			self.isLoading = false
		})
	}
	
	func renderContent() -> some View {
		if self.isLoading {
			return AnyView(
				ActivityIndicatorComponent(isAnimating: true)
			)
		} else if self.products.count > 0 {
			return AnyView(
				ProductListComponent(products: self.products)
			)
		} else if self.searchString.count > 0 {
			return AnyView(
				SearchResultString(text: "Inga resultat")
			)
		} else {
			return AnyView(
				SearchResultString(text: "Sök efter en produkt")
			)
		}
	}
	
	var body: some View {
		NavigationView {
			ScrollView {
				SearchBar(onUpdateSearch: onUpdateSearch(searchString: ))
				
				renderContent()
			}
			.navigationBarTitle(searchString.count > 0 ? searchString : "Sök")
		}
	}
}

private struct SearchResultString: View {
	let text: String
	
	var body: some View {
		HStack {
			Text(text)
				.font(.title)
				.multilineTextAlignment(.leading)
				.padding(.leading, getPixels(dimension: .horizontal, precent: 2.5) + 10)
			
			Spacer()
			
		}.frame(width: getPixels(dimension: .horizontal, precent: 100), alignment: .center)
	}
}

private struct SearchBar: View {
	@State var searchString: String = ""
	
	let onUpdateSearch: (String) -> Void
	
	init(onUpdateSearch: @escaping (String) -> Void){
		self.onUpdateSearch = onUpdateSearch
	}
	
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.opacity(0.5)
				.padding(.leading, 10)
				.padding(.trailing, 0)
				.scaleEffect(0.7)
			
			TextField("Sök", text: self.$searchString, onCommit: {
				self.onUpdateSearch(self.searchString)
			})
				.font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
				.textContentType(.name)
			
		}
		.frame(width: getPixels(dimension: .horizontal, precent: 95), height: 30, alignment: .center)
		.background(Color(.black).opacity(0.1))
		.cornerRadius(5)
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
