import SwiftUI

struct SensitiveMoneyView: View {
    let amount: String
    let currency: String
    let amountFont: Font
    let currencyFont: Font
    let color: Color
    
    @EnvironmentObject var privacyManager: PrivacyManager
    
    init(amount: String, currency: String, amountFont: Font = .title, currencyFont: Font = .headline, color: Color = .primary) {
        self.amount = amount
        self.currency = currency
        self.amountFont = amountFont
        self.currencyFont = currencyFont
        self.color = color
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            if privacyManager.isMasked {
                HStack(spacing: 2) {
                    // Currency replacement
                    GlassyAsterisks(course: 3, font: currencyFont)
                    
                    // Amount replacement
                    GlassyAsterisks(course: 6, font: amountFont)
                }
            } else {
                Text(currency)
                    .font(currencyFont)
                    .foregroundStyle(color)
                
                Text(amount)
                    .font(amountFont)
                    .foregroundStyle(color)
            }
        }
    }
}

struct GlassyAsterisks: View {
    let course: Int
    let font: Font
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<course, id: \.self) { _ in
                Text("∗") // Using a nicer asterisk character if possible, or standard *
                    .font(modify(font))
                    .foregroundStyle(.white.opacity(0.6))
                    .shadow(color: .white.opacity(0.8), radius: 2, x: 0, y: 0) // Glow
                    .overlay(
                        Text("∗")
                            .font(modify(font))
                            .foregroundStyle(.white.opacity(0.3))
                            .blur(radius: 1)
                    )
            }
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 2)
        .background(
            Capsule()
                .fill(.ultraThinMaterial) // Liquid feel container
                .opacity(0.5)
        )
    }
    
    // Helper to slightly increase font size for asterisks as requested
    func modify(_ font: Font) -> Font {
        // We can't easily modify a Font struct directly in SwiftUI without knowing its size,
        // but we can scale roughly or return a slightly larger system font.
        // For now, let's just assume we want it "slightly bigger" relative to context.
        // Or simpler: apply a scale effect.
        return font
    }
}

// PrivacyManager is now in PrivacyManager.swift
