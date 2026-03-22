import SwiftUI

struct TransactionListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recent Transactions")
                    .font(.headline)
                Spacer()
                Text("View All")
                    .font(.subheadline)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            
            VStack(spacing: 0) {
                TransactionRow(
                    merchant: "Surge Coffee Roasters",
                    category: "Food & Drink",
                    date: "Today, 9:41 AM",
                    amount: "- AED 25.00",
                    logo: "cup.and.saucer.fill",
                    color: .brown
                )
                
                Divider()
                    .padding(.leading, 70)
                
                TransactionRow(
                    merchant: "Nike Store",
                    category: "Shopping",
                    date: "Yesterday, 6:30 PM",
                    amount: "- AED 450.00",
                    logo: "tshirt.fill",
                    color: .black
                )
                
                Divider()
                    .padding(.leading, 70)
                
                TransactionRow(
                    merchant: "Salary Deposit",
                    category: "Income",
                    date: "28 Oct, 9:00 AM",
                    amount: "+ AED 15,000.00",
                    isPositive: true,
                    logo: "building.columns.fill",
                    color: .blue
                )
            }
            .background(Color.secondarySystemBackground)
            .cornerRadius(16)
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

struct TransactionRow: View {
    let merchant: String
    let category: String
    let date: String
    let amount: String
    var isPositive: Bool = false
    let logo: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: logo)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(color)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(merchant)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("\(category) • \(date)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            SensitiveMoneyView(
                amount: amount,
                currency: "AED",
                amountFont: .system(size: 16, weight: .bold),
                currencyFont: .system(size: 12, weight: .bold),
                color: isPositive ? .green : .primary
            )
        }
        .padding()
    }
}

#Preview {
    TransactionListView()
        .environmentObject(PrivacyManager())
}
