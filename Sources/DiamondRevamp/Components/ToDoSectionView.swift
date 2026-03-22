import SwiftUI

struct ToDoSectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("To-Do's")
                    .font(.headline)
                Spacer()
                Text("See All")
                    .font(.subheadline)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ToDoCard(
                        title: "Update Emirates ID",
                        subtitle: "Required for account verification",
                        status: "Urgent",
                        statusColor: .red,
                        icon: "person.text.rectangle"
                    )
                    
                    ToDoCard(
                        title: "Add Card to Wallet",
                        subtitle: "Enjoy seamless payments",
                        status: "Suggested",
                        statusColor: .blue,
                        icon: "wallet.pass"
                    )
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct ToDoCard: View {
    let title: String
    let subtitle: String
    let status: String
    let statusColor: Color
    let icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundStyle(.blue)
                .frame(width: 50, height: 50)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text(status)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(statusColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(statusColor.opacity(0.1))
                    .clipShape(Capsule())
            }
            Spacer()
        }
        .padding()
        .frame(width: 280)
        .background(Color.secondarySystemBackground)
        .cornerRadius(16)
    }
}

#Preview {
    ToDoSectionView()
}
