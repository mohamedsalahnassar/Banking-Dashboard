import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardHomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Wealth")
                .tabItem {
                    Label("Wealth", systemImage: "chart.bar.fill")
                }
            
            Text("Transfer")
                .tabItem {
                    Label("Transfer", systemImage: "arrow.left.arrow.right")
                }
            
            Text("Services")
                .tabItem {
                    Label("Services", systemImage: "square.grid.2x2.fill")
                }
            
            Text("Rewards")
                .tabItem {
                    Label("Rewards", systemImage: "gift.fill")
                }
        }
    }
}

// DashboardHomeView is now defined in Components/DashboardHomeView.swift


#Preview {
    ContentView()
        .environmentObject(PrivacyManager())
}
