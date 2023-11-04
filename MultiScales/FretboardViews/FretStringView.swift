import SwiftUI

enum StringPosition {
	case fretNumbers
	case first
	case middle
	case last
}

struct FretStringView: View {
	let fingerScale = CGFloat(1.2)
	let fretColors: [Color]
	let stringPosition: StringPosition

	var body: some View {
		GeometryReader { proxy in
			ZStack {
				stringView(with: proxy)
				FretLineView(stringPosition: stringPosition, proxy: proxy)
				fingerView(with: proxy, colors: fretColors)
			}
			.frame(width: proxy.size.width, height: proxy.size.height)
			.padding(0)
		}
    }
	
	private func stringView(with proxy: GeometryProxy) -> some View {
		Color.primary
			.frame(width: 1, height: proxy.size.height )
	}
	
	private func fingerView(with proxy: GeometryProxy, colors: [Color]) -> some View {
		ZStack {
			let wedges = wedges(colors: colors)
			ForEach(wedges, id:\.start) { wedge in
				PieView(start: wedge.start, end: wedge.end, color: wedge.color)
			}			
		}
		.frame(width: proxy.size.width / fingerScale,
			   height: proxy.size.height / fingerScale)
	}
	
	private func wedges(colors: [Color]) -> [Wedge] {
		let validColors = colors.filter {
			$0 != .clear
		}
		var wedges = [Wedge]()
		let wedgeCount = validColors.count
		if wedgeCount > 0 {
			let wedgeWidth = Double(360) / Double(wedgeCount)
			wedges = validColors.enumerated().map { index, color in
				Wedge(start: wedgeWidth * Double(index),
					  end: wedgeWidth * Double(index + 1), color: color)
			}
		}
		return wedges
	}
}

struct Wedge {
	let start: Double
	let end: Double
	let color: Color
}


struct FretStringView_Previews: PreviewProvider {
    static var previews: some View {
		FretStringView(fretColors: [.red, .blue, .yellow], stringPosition: .middle)
    }
}
