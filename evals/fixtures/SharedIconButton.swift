import SwiftUI

// Negative control: a small symbol has a larger labeled button target.
struct SharedIconButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 18))
                .frame(width: 44, height: 44)
                .contentShape(Rectangle())
        }
        .accessibilityLabel("Share recipe")
    }
}
