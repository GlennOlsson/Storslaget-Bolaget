//
//  RootViewController.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-15.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct RootView: View {
	
	@State var isLoading: Bool = true
	var body: some View {
		VStack {
			if state.loadingState.isLoading {
				Text("Hello, World, loading atm!")
				Button(action: {
					print(state.loadingState.isLoading)
					print(state.allProducts?.count ?? -1)
				}) {
					Text("UPDATE")
				}
			} else {
				ContentView()
			}
		}
//		.onAppear {
//			self.state.loadProducts()
//		}
	}
}

struct RootView_Previews: PreviewProvider {
	static var previews: some View {
		RootView()
	}
}
