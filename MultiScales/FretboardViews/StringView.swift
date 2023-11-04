import SwiftUI

struct StringView: View {
	let viewModel: StringViewModel
	
    var body: some View {
		GeometryReader { proxy in
			VStack(spacing: 0) {
				if case .fretNumbers = viewModel.stringPosition
				{
					EmptyView()
				} else {
					FretLineView(lineWidth: 4, stringPosition: viewModel.stringPosition, proxy: proxy)
						.offset(CGSize(width: 0, height: -proxy.size.height / 2))
				}

				VStack(spacing: 0) {
					ForEach(viewModel.fretMarkers) { fretMarker in
						self.fretStringView(viewModel: viewModel, fretMarker: fretMarker, proxy: proxy)
					}
				}
			}
		}
    }
	
	func fretStringView(viewModel: StringViewModel, fretMarker: FretMarker, proxy: GeometryProxy) -> some View {
		ZStack {
			switch viewModel.stringPosition {
			case .fretNumbers:
				FretNumberView(fretNumber: fretMarker.number)
					.frame(height: proxy.size.height / CGFloat(viewModel.fretMarkers.count))
			default:
				if fretMarker.id > viewModel.fretColors.count {
					EmptyView()
				} else {
					FretStringView(fretColors: viewModel.fretColors[fretMarker.id], stringPosition: viewModel.stringPosition)
				}
			}
		}
	}
}


struct StringView_Previews: PreviewProvider {
    static var previews: some View {
		StringView(viewModel: StringViewModel(string: .d3, fretMarkers: FretMarker.standard, fretColors: [[.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear]]))
		StringView(viewModel: StringViewModel(string: nil, fretMarkers: FretMarker.standard, fretColors: [[.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear]]))
    }
}
