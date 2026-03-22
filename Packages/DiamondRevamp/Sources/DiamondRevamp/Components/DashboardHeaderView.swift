import SwiftUI

struct DashboardHeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // 1. Background Layer
            BackgroundVideoView()
                .frame(height: 200) // Adjust height as needed for the header area
                .mask {
                    LinearGradient(stops: [
                        .init(color: .black, location: 0.0),
                        .init(color: .black, location: 0.8),
                        .init(color: .clear, location: 1.0)
                    ], startPoint: .top, endPoint: .bottom)
                }
            
            // 2. Content Layer
            VStack(spacing: 20) {
                // Top Detail (Signal, Battery etc are mostly system, so we focus on our UI)
                // We'll place the main header content here
                
                HStack(spacing: 16) {
                    // AI Search Pill
                    HStack(spacing: 12) {
                        Image(systemName: "sparkles") // AI/Chat Icon
                            .font(.system(size: 18))
                            .foregroundStyle(.blue)
                            .padding(8)
                            .background(.white)
                            .clipShape(Circle())
                        
                        Text("How can I help you ?")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Spacer()
                    }
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
        }
        .frame(height: 180) // Fixed height for the header container
        // Ensure it ignores safe area at the top
    }

}

#Preview {
    DashboardHeaderView()
}
