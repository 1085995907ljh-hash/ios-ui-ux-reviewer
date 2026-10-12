import SwiftUI

// Synthetic review fixture. This is not a runnable Xcode project.
struct SaveRecipeView: View {
    let save: (String) async throws -> Void
    @State private var title = ""
    @State private var saving = false
    @State private var errorMessage: String?

    var body: some View {
        Form {
            TextField("Recipe name", text: $title)
            if let errorMessage { Text(errorMessage) }
            Button("Save Recipe") {
                saving = true
                Task { @MainActor in
                    do {
                        try await save(title)
                        title = ""
                        saving = false
                    } catch {
                        errorMessage = "Couldn't save. Try again."
                    }
                }
            }
            .disabled(saving || title.isEmpty)
        }
    }
}
