import SwiftUI

struct ProductsCarouselView: View {
    @State private var selectedTab = "Cards"
    let tabs = ["Accounts", "Cards", "Investment", "Loans"]
    
    // Init removed. Appearance setup moved to onAppear.
    
    var body: some View {
        VStack(spacing: 20) {
            // Native Segmented Picker
            Picker("Product Type", selection: $selectedTab) {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab).tag(tab)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            // Content
            TabView(selection: $selectedTab) {
                AccountsView()
                    .tag("Accounts")
                
                CardsView()
                    .tag("Cards")
                    
                Text("Investment Portfolio")
                    .foregroundStyle(.white)
                    .tag("Investment")
                
                Text("Active Loans")
                    .foregroundStyle(.white)
                    .tag("Loans")
            }
            #if os(iOS)
            .tabViewStyle(.page(indexDisplayMode: .never))
            #endif
            .frame(height: 320) // Fixed height for the card area
        }
        .onAppear {
            #if os(iOS)
            UISegmentedControl.appearance().selectedSegmentTintColor = .white
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
            UISegmentedControl.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.1)
            #endif
        }
    }
}

// MARK: - Cards View
struct CardsView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Card Items Container
            VStack(spacing: 0) {
                // Item 1
                ProductRowItem(
                    title: "Visa Infinite Card",
                    amount: "2,410.90",
                    currency: "AED",
                    subtitle: "Available: AED 2,985.30",
                    icon: nil 
                )
                
                Divider()
                    .padding(.leading, 20)
                
                // Item 2
                ProductRowItem(
                    title: "Mastercard Platinum Card",
                    amount: "8,342.32",
                    currency: "AED",
                    subtitle: "Available: AED 2,985.30",
                    icon: nil
                )
            }
            .padding(.vertical, 8)
            .background(Color.white)
            
            Divider()
            
            // Footer
            Button(action: {}) {
                Text("Apply for a card")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

// MARK: - Accounts View
struct AccountsView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                ProductRowItem(
                    title: "Current Account",
                    amount: "250,410.90",
                    currency: "AED",
                    subtitle: "AE00 0000 0000 0000 0000",
                    icon: nil
                )
                
                Divider()
                    .padding(.leading, 20)
                
                ProductRowItem(
                    title: "Savings Account",
                    amount: "15,342.32",
                    currency: "AED",
                    subtitle: "AE00 0000 0000 1234 5678",
                    icon: nil
                )
            }
            .padding(.vertical, 8)
            .background(Color.white)
            
            Divider()
            
            Button(action: {}) {
                Text("Open new account")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

// MARK: - Reusable Row
struct ProductRowItem: View {
    let title: String
    let amount: String
    let currency: String
    let subtitle: String
    let icon: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    SensitiveMoneyView(
                        amount: amount,
                        currency: currency,
                        amountFont: .system(size: 28, weight: .medium),
                        currencyFont: .system(size: 18, weight: .bold),
                        color: Color(red: 0.05, green: 0.1, blue: 0.25)
                    )
                }
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(0.8))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.blue.opacity(0.6))
                .font(.system(size: 14))
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black
        ProductsCarouselView()
    }
    .environmentObject(PrivacyManager())
}
