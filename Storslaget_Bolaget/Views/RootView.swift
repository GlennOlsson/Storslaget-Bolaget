//
//  RootViewController.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-15.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI

struct RootView: View {
	var body: some View {
		VStack {
			if state.loadingState.isLoading {
				Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
				Button(action: {
					print(state.loadingState.isLoading)
				}) {
					Text("UPDATE")
				}
			} else {
				Text("Loaded")
			}
		}
	}
}

struct RootView_Previews: PreviewProvider {
	static var previews: some View {
		RootView()
	}
}
