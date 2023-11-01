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
				adaptiveFretView(with: proxy)
				if showFinger {
					fingerView(with: proxy)
				}
			}
			.frame(width: proxy.size.width, height: proxy.size.height)
		}
    }
	
	private func stringView(with proxy: GeometryProxy) -> some View {
		Color.primary
			.frame(width: 1, height: proxy.size.height + 6)
			.offset(CGSize(width: 0, height: -5))
	}
	
	private func adaptiveFretView(with proxy: GeometryProxy) -> some View {
		Color.primary
			.frame(width: width(stringPosition: stringPosition, proxy: proxy),
				   height: 3)
			.offset(CGSize(width: offset(stringPosition: stringPosition, proxy: proxy),
						   height: proxy.size.height / 2))
	}
	
	private func offset(stringPosition: StringPosition, proxy: GeometryProxy) -> CGFloat {
		switch stringPosition {
		case .first:
			return proxy.size.width / 2 - 5
		case .middle, .fretNumbers:
			return 0
		case .last:
			return -proxy.size.width / 2 + 5
		}
	}
	
	private func width(stringPosition: StringPosition, proxy: GeometryProxy) -> CGFloat {
		switch stringPosition {
		case .first, .last, .fretNumbers:
			return proxy.size.width / 2 // + 10
		case .middle:
			return proxy.size.width // + 10
		}
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
			.background(.orange)
			.padding()
    }
}
