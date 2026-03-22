import SwiftUI

// MARK: - Glass Toolbar Icon (Visual only)
struct GlassToolbarIcon: View {
    let icon: String
    let hasBadge: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white) // Ensure icon is white
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                )

            if hasBadge {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .offset(x: -3, y: 1)
            }
        }
    }
}

// MARK: - Glass Toolbar Button (Button Wrapper)
struct GlassToolbarButton: View {
    let icon: String
    let hasBadge: Bool
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            GlassToolbarIcon(icon: icon, hasBadge: hasBadge)
        }
    }
}
