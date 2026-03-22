import SwiftUI

struct DashboardBottomContent: View {
    var body: some View {
        VStack(spacing: 24) {
            // Quick Tools Header
            HStack {
                Text("Quick tools")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                
                Spacer()
                
                Button("Edit") {
                    // Edit action
                }
                .font(.subheadline)
                .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            .padding(.top, 24)
            
            // Quick Actions Grid (Existing)
            QuickActionsGridView()
                .padding(.horizontal, -16) // Reset padding from parent if grid has its own
            
            // Promo Banner (Placeholder for now based on design "Build your financial future")
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Build your financial future")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(red: 0.05, green: 0.1, blue: 0.25))
                    
                    Text("with confidence")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(red: 0.05, green: 0.1, blue: 0.25))
                }
                Spacer()
                // Placeholder for banner image
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 50, height: 50)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            .padding(.horizontal)
            
            // To Do's
            ToDoSectionView()
            
            // Transactions
            TransactionListView()
            
            // Bottom Spacer
            Spacer(minLength: 100)
        }
        .background(Color.white)
    }
}




#Preview {
    ZStack {
        Color.gray
        DashboardBottomContent()
    }
    .environmentObject(PrivacyManager())
}
