import SwiftUI

struct LiquidNavBar: View {
    var body: some View {
        HStack(spacing: 12) {
            // Left: AI Search Pill
            HStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(Color.blue)
                    .clipShape(Circle())
                
                Text("How can I help you ?")
                    .font(.subheadline) // Slightly smaller to fit nav bar
                    .foregroundStyle(.white.opacity(0.8))
                
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity) // Take available space
            
            // Right: Action Buttons
            HStack(spacing: 10) {
                NavBarButton(icon: "bell.fill", hasBadge: true)
                NavBarButton(icon: "eye.slash", hasBadge: false)
                NavBarButton(icon: "gearshape", hasBadge: false)
            }
        }
        .padding(.horizontal)
        .padding(.top, 40) // Status bar padding (or use safe area in parent)
        .padding(.bottom, 10)
    }
}

struct NavBarButton: View {
    let icon: String
    let hasBadge: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold)) // Standard nav bar icon size
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                // Subtle border to enhance glass effect
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                )
            
            if hasBadge {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .offset(x: 2, y: -2)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        LiquidNavBar()
    }
}
