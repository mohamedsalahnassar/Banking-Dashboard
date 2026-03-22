import SwiftUI
import DiamondRevamp

@main
struct DiamondRevampApp: App {
    @StateObject private var privacyManager = PrivacyManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(privacyManager)
        }
    }
}
