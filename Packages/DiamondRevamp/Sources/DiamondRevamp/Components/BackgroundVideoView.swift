import SwiftUI
import AVKit

struct BackgroundVideoView: View {
    var videoName: String? = nil
    
    var body: some View {
        ZStack {
            // base dark layer
            Color.black.ignoresSafeArea()
            
            // Premium Dark Blue Gradient (Fallback or Overlay)
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.05, green: 0.1, blue: 0.25), // Deep Navy
                    Color(red: 0.0, green: 0.05, blue: 0.15), // Darker Navy
                    Color.black
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Mesh/Aurora effect overlay (simulated with gradients)
            GeometryReader { proxy in
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 300, height: 300)
                    .blur(radius: 60)
                    .offset(x: -50, y: -50)
                
                Circle()
                    .fill(Color.purple.opacity(0.15))
                    .frame(width: 250, height: 250)
                    .blur(radius: 50)
                    .offset(x: proxy.size.width - 150, y: 50)
            }
        }
        .drawingGroup()
    }
}

#Preview {
    BackgroundVideoView()
}
