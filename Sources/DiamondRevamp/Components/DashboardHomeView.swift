import SwiftUI
import ScrollAnimationKit
import LiquidGlassKit

struct DashboardHomeView: View {
    @EnvironmentObject var privacyManager: PrivacyManager
    
    var body: some View {
        NavigationStack {
            ScrollEffectView(
                style: .parallax,
                heroTopPadding: 30,
                stickyHeaderConfig: StickyHeaderConfiguration(
                    revealThreshold: 120,
                    revealDistance: 50,
                    height: 84,
                    usesMaterial: false,
                    showsShadow: false
                )
            ) {
                // Hero: Products Carousel
                ProductsCarouselView()
            } background: {
                // Fixed Background
                BackgroundVideoView()
            } bottomContent: {
                // Bottom Sheet
                DashboardBottomContent()
            } stickyHeader: {
                // MARK: - Floating Glass Pill
                HStack(spacing: 16) {
                    // Balance section
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Total Balance")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundStyle(.white.opacity(0.6))
                            .textCase(.uppercase)
                        
                        SensitiveMoneyView(
                            amount: "265,753.22",
                            currency: "AED",
                            amountFont: .system(size: 16, weight: .bold, design: .rounded),
                            currencyFont: .system(size: 11, weight: .semibold),
                            color: .white
                        )
                    }
                    
                    Spacer()
                    
                    // Notification bell
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                        
                        Text("3")
                            .font(.system(size: 9, weight: .heavy))
                            .foregroundStyle(.white)
                            .frame(width: 16, height: 16)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 2, y: -2)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .liquidGlassEffect(
                    .clear.interactive().tint(.black),
                    in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                )
                .shadow(color: Color.black.opacity(0.3), radius: 12, y: 6)
                .padding(.horizontal, 16)
            }
            // MARK: - Native Navigation Bar Setup
            .toolbar {
                // Leading: Search Pill
                ToolbarItem(placement: .navigation) {
                    HStack(spacing: 8) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 14))

                        Text("How can I help you ?")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.white.opacity(0.9))
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                }
                
                // Trailing: Action Buttons
                ToolbarItemGroup(placement: .automatic) {
                    GlassToolbarButton(icon: "bell.fill", hasBadge: true)
                    
                    // Mask/Unmask Button
                    Button(action: {
                        withAnimation {
                            privacyManager.isMasked.toggle()
                        }
                    }) {
                        GlassToolbarIcon(icon: privacyManager.isMasked ? "eye" : "eye.slash", hasBadge: false)
                    }
                    
                    GlassToolbarButton(icon: "gearshape", hasBadge: false)
                }
            }
            // Make Navigation Bar Transparent
            #if os(iOS)
            .toolbarBackground(.hidden, for: .navigationBar)
            #endif
        }
    }
}

#Preview {
    DashboardHomeView()
        .environmentObject(PrivacyManager())
}
