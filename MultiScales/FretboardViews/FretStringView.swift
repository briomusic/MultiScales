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
	let showFinger: Bool
	let stringPosition: StringPosition

	var body: some View {
		GeometryReader { proxy in
			ZStack {
				stringView(with: proxy)
				FretLineView(stringPosition: stringPosition, proxy: proxy)
				if showFinger {
					fingerView(with: proxy)
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
	
	private func fingerView(with proxy: GeometryProxy) -> some View {
		ZStack {
			Color.primary
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
		FretStringView(showFinger: true, stringPosition: .middle)
    }
}
