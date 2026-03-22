import SwiftUI

extension Color {
    #if os(iOS)
    static let systemGroupedBackground = Color(uiColor: .systemGroupedBackground)
    static let secondarySystemBackground = Color(uiColor: .secondarySystemBackground)
    #elseif os(macOS)
    static let systemGroupedBackground = Color(nsColor: .windowBackgroundColor)
    static let secondarySystemBackground = Color(nsColor: .controlBackgroundColor)
    #else
    static let systemGroupedBackground = Color.gray
    static let secondarySystemBackground = Color.gray
    #endif
}
