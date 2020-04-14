//
//  ActivityIndicatorComponent.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-14.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicatorComponent: UIViewRepresentable {
	
	typealias UIViewType = UIActivityIndicatorView
	var isAnimating: Bool
	
	func makeUIView(context: Context) -> UIViewType {
		UIViewType()
	}
	
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
		isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
	}
}

struct ActivityIndicatorComponent_Previews: PreviewProvider {
    static var previews: some View {
		ActivityIndicatorComponent(isAnimating: true)
    }
}
