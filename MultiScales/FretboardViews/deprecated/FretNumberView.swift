import SwiftUI

struct FretNumberView: View {
	var fretNumber: Int
	var fretNumberString: String {
		if fretNumber == 0 {
			return ""
		} else {
			return "\(fretNumber)"
		}
	}
	
	var body: some View {
		Text(fretNumberString)
			.font(.system(size: 26, weight: .medium))
	}
}

struct FretNumberView_Previews: PreviewProvider {
    static var previews: some View {
		FretNumberView(fretNumber: 3)
    }
}
