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
	print("Hashing \(str)")
	var val = 1
	for char in str {
		if let asciiVal = char.asciiValue {
			print(val)
			val *= 7 * Int(asciiVal)
		} else {
			print(val)
			val *= 7 * 13
		}
		if val > 1000 {
			val = Int(val / 1000)
		}
		val = abs(val)
	}
	return val
}
