import SwiftUI

struct NumberedFretView: View {
	var fretNumber: Int
	init(fretNumber: Int = 0) {
		self.fretNumber = fretNumber
	}
	
    var body: some View {
		GeometryReader { proxy in
			HStack(alignment: .center) {
				FretNumberView(fretNumber: fretNumber)
					.frame(width: proxy.size.width / 7)
				FretView()
			}
		}
    }
}

struct NumberedFretView_Previews: PreviewProvider {
    static var previews: some View {
		NumberedFretView(fretNumber: 4)
    }
}
