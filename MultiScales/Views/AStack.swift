import SwiftUI

struct AStack<Content: View>: View {
	var geometry: GeometryProxy
	var reverseGeometry: Bool = false
	@ViewBuilder
	var content: () -> Content
	
	var alignHorizontally: Bool {
		var alignHorizontally = geometry.size.width > geometry.size.height
		alignHorizontally = reverseGeometry ? !alignHorizontally : alignHorizontally
		return alignHorizontally
	}
	
	var body: some View {
		if alignHorizontally {
			HStack(content: content)
		} else {
			VStack(content: content)
		}
	}
}
