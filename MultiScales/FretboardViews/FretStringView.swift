//
//  FretStringView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

enum StringPosition {
	case fretNumbers
	case first
	case middle
	case last
}

struct FretStringView: View {
//	let showFinger: Bool
	let fretColor: Color
	let stringPosition: StringPosition

	var body: some View {
		GeometryReader { proxy in
			ZStack {
				stringView(with: proxy)
				FretLineView(stringPosition: stringPosition, proxy: proxy)
				if fretColor != .clear {
					fingerView(with: proxy, color: fretColor)
				}
			}
			.frame(width: proxy.size.width, height: proxy.size.height)
			.padding(0)
		}
    }
	
	private func stringView(with proxy: GeometryProxy) -> some View {
		Color.primary
			.frame(width: 1, height: proxy.size.height )
	}
	
	private func fingerView(with proxy: GeometryProxy, color: Color) -> some View {
		ZStack {
			color
				.clipShape(Circle())
				.padding(proxy.size.width / 8)
//			Text("1")
//				.font(.system(size: proxy.size.width / 2, weight: .bold))
//				.foregroundColor(.white)
			
		}
		.frame(width: proxy.size.width,
			   height: proxy.size.height)
		.offset(CGSize(width: 0, height: 0))
	}
}


struct FretStringView_Previews: PreviewProvider {
    static var previews: some View {
		FretStringView(fretColor: .red, stringPosition: .middle)
    }
}
