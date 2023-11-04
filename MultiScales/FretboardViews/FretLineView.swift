import SwiftUI

struct FretLineView: View {
	let lineWidth: CGFloat
	let stringPosition: StringPosition
	let proxy: GeometryProxy
	
	init(lineWidth: CGFloat = 3, stringPosition: StringPosition, proxy: GeometryProxy) {
		self.lineWidth = lineWidth
		self.stringPosition = stringPosition
		self.proxy = proxy
	}
    var body: some View {
		Color.primary
			.frame(width: width(stringPosition: stringPosition, proxy: proxy),
				   height: lineWidth)
			.offset(CGSize(width: offset(stringPosition: stringPosition, proxy: proxy),
						   height: proxy.size.height / 2))
    }
		
	private func offset(stringPosition: StringPosition, proxy: GeometryProxy) -> CGFloat {
		switch stringPosition {
		case .first:
			return proxy.size.width / 4
		case .middle, .fretNumbers:
			return 0
		case .last:
			return -proxy.size.width / 4
		}
	}
	
	private func width(stringPosition: StringPosition, proxy: GeometryProxy) -> CGFloat {
		switch stringPosition {
		case .first, .last, .fretNumbers:
			return proxy.size.width / 2
		case .middle:
			return proxy.size.width
		}
	}

}

struct FretLineView_Previews: PreviewProvider {
    static var previews: some View {
		GeometryReader { proxy in
			FretLineView(stringPosition: .middle, proxy: proxy)
		}
    }
}
