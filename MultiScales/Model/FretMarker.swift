//
//  Fret.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import Foundation

struct FretMarker: Identifiable {
	let id: Int
	let number: Int
	
	static var standard: [FretMarker] = {
		[
			FretMarker(id: 0, number: 0),
			FretMarker(id: 1, number: 0),
			FretMarker(id: 2, number: 3),
			FretMarker(id: 3, number: 0),
			FretMarker(id: 4, number: 5),
			FretMarker(id: 5, number: 0),
			FretMarker(id: 6, number: 7),
			FretMarker(id: 7, number: 0),
			FretMarker(id: 8, number: 9),
			FretMarker(id: 9, number: 0),
			FretMarker(id: 10, number: 0),
			FretMarker(id: 11, number: 12)
		]
	}()
}
