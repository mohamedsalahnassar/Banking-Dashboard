import SwiftUI

struct QuickActionsGridView: View {
    let actions: [(title: String, icon: String, color: Color)] = [
        ("Transfer", "arrow.left.arrow.right", .blue),
        ("Pay Bills", "newspaper", .orange),
        ("Top Up", "plus.circle", .green),
        ("Rewards", "gift.fill", .purple),
        ("Services", "square.grid.2x2", .pink),
        ("More", "ellipsis.circle", .gray)
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title removed, handled by parent

            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<actions.count, id: \.self) { index in
                    VStack(spacing: 8) {
                        Image(systemName: actions[index].icon)
                            .font(.system(size: 24))
                            .foregroundStyle(actions[index].color)
                            .frame(width: 60, height: 60)
                            .background(Color.secondarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        Text(actions[index].title)
                            .font(.caption)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    }
                }
            }
            // Removed padding(.horizontal) to let parent control edges

        }
        .padding(.vertical)
    }
}

#Preview {
    QuickActionsGridView()
}
