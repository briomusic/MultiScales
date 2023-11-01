//
//  Fret.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import Foundation

struct Fret: Identifiable {
	let id: Int
	let number: Int
	
	static var frets: [Fret] = {
		[Fret(id: 0, number: 0),
		Fret(id: 1, number: 0),
		Fret(id: 2, number: 0),
		Fret(id: 3, number: 3),
		Fret(id: 4, number: 0),
		Fret(id: 5, number: 5),
		Fret(id: 6, number: 0),
		Fret(id: 7, number: 7),
		Fret(id: 8, number: 0),
		Fret(id: 9, number: 9),
		Fret(id: 10, number: 0),
		Fret(id: 11, number: 0),
		Fret(id: 12, number: 12)]
	}()
}
