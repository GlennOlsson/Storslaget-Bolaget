//
//  Constants.swift
//  Storslaget_Bolaget
//
//  Created by Glenn Olsson on 2020-04-12.
//  Copyright © 2020 Glenn Olsson. All rights reserved.
//

import Foundation
import SwiftUI

let COLORS: [Color] = [
	Color(red: 0.012, green: 0.22, blue: 0.376),
	Color(red: 0.168, green: 0.346, blue: 0.421),
	Color(red: 0.062, green: 0.25, blue: 0.329),
	Color(red: 0.337, green: 0.554, blue: 0.717),
	Color(red: 0.01, green: 0.346, blue: 0.6),
	Color(red: 0.078, green: 0.475, blue: 0.642),
]

public func HASH(_ str: String) -> Int {
	var val = 1
	for char in str {
		if let asciiVal = char.asciiValue {
			val *= 7 * Int(asciiVal)
		} else {
			val *= 7 * 13
		}
		if val > 1000 {
			val = Int(val / 1000)
		}
		val = abs(val)
	}
	return val
}

var state: StateManager!

//Get pixels reprecenting x precent of said dimension
public func getPixels(dimension: DIMENSION, precent: CGFloat) -> CGFloat{
	let bounds = UIScreen.main.bounds
	switch dimension {
	case .vertical:
		return CGFloat(precent / CGFloat(100)) * bounds.height
	case .horizontal:
		return CGFloat(precent / CGFloat(100)) * bounds.width
	}
}

public enum DIMENSION {
	case vertical, horizontal
}

extension String {
	func indexOf(char: String.Element) -> Int {
		var i = 0
		for c in self {
			if c == char {
				return i
			}
			i += 1
		}
		return -1
	}
}
