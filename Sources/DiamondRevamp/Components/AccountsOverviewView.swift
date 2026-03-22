import SwiftUI

struct AccountsOverviewView: View {
    @State private var selectedTab = 0
    let tabs = ["Accounts", "Cards", "Investments", "Loans"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Segmented/Tab Control
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        VStack(spacing: 8) {
                            Text(tabs[index])
                                .font(.system(size: 16, weight: selectedTab == index ? .semibold : .regular))
                                .foregroundStyle(selectedTab == index ? Color.primary : Color.secondary)
                            
                            // Active Indicator
                            if selectedTab == index {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(width: 20, height: 3)
                            } else {
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(width: 20, height: 3)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedTab = index
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 16)
            
            // Account Cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    AccountCard(
                        type: "Current Account",
                        number: "AE00 0000 0000 0000 0000",
                        balance: "250,000.00",
                        currency: "AED",
                        flag: "🇦🇪"
                    )
                    
                    AccountCard(
                        type: "Savings Account",
                        number: "AE00 0000 0000 1234 5678",
                        balance: "15,450.50",
                        currency: "AED",
                        flag: "🇦🇪"
                    )
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct AccountCard: View {
    let type: String
    let number: String
    let balance: String
    let currency: String
    let flag: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(type)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(number)
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
                Spacer()
                Text(flag) // Country Flag or Icon
                    .font(.title2)
                    .padding(8)
                    .background(Color.secondary.opacity(0.1))
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 4) {
                SensitiveMoneyView(
                    amount: balance,
                    currency: currency,
                    amountFont: .system(size: 28, weight: .bold, design: .rounded),
                    currencyFont: .caption,
                    color: .primary
                )
            }
        }
        .padding(20)
        .frame(width: 300)
        .background(Color.secondarySystemBackground)
        .cornerRadius(24)
        // Shadow for depth
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    AccountsOverviewView()
        .environmentObject(PrivacyManager())
}
