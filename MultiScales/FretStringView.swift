//
//  FretStringView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretStringView: View {
	let showFret: Bool
	let showFinger: Bool

	var body: some View {
		GeometryReader { proxy in
			ZStack {
				stringView(with: proxy)
				fretView(with: proxy, visible: showFret)
				if showFinger {
					fingerView(with: proxy)
				}
			}
		}
    }
	
	private func stringView(with proxy: GeometryProxy) -> some View {
		Group {
			Color.primary
		}
		.frame(width: 1, height: proxy.size.height + 6)
		.offset(CGSize(width: proxy.size.width / 2, height: -5))
	}

	private func fretView(with proxy: GeometryProxy, visible: Bool) -> some View {
		Group {
			if visible {
				Color.primary
			} else {
				Color.clear
			}
		}
		.frame(width: proxy.size.width + 10, height: 3)
		.offset(CGSize(width: -4, height: proxy.size.height / 2))
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
		.offset(CGSize(width: proxy.size.width / 2, height: 0))
	}
}


struct FretStringView_Previews: PreviewProvider {
    static var previews: some View {
		FretStringView(showFret: true, showFinger: true)
    }
}
