//
//  RootViewController.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-15.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct RootView: View {
	@EnvironmentObject var state: StateManager
	
	@State var isLoading: Bool = true
	var body: some View {
		VStack {
			if state.loadingState.isLoading {
				Text("Loading...")
//				Button(action: {
//					print(self.state.loadingState.isLoading)
//					print(self.state.allProducts?.count ?? -1)
//				}) {
//					Text("UPDATE")
//				}
			} else {
				ContentView().environmentObject(self.state)
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
