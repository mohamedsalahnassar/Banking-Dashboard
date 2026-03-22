import SwiftUI

struct AmountLabel: View {
    let amount: Double
    let currencyCode: String
    
    // Formatting Options
    var locale: Locale = .current
    var showSymbol: Bool = false // If true, shows symbol ($), else code (USD)
    
    // Styling Options
    var currencyPlacement: CurrencyPlacement = .leading
    var amountFont: Font = .title
    var currencyFont: Font = .headline
    var amountColor: Color = .primary
    var currencyColor: Color = .secondary
    
    @EnvironmentObject var privacyManager: PrivacyManager
    
    enum CurrencyPlacement {
        case leading, trailing
    }

    init(
        amount: Double,
        currencyCode: String,
        locale: Locale = .current,
        showSymbol: Bool = false,
        currencyPlacement: CurrencyPlacement = .leading,
        amountFont: Font = .title,
        currencyFont: Font = .headline,
        amountColor: Color = .primary,
        currencyColor: Color = .secondary
    ) {
        self.amount = amount
        self.currencyCode = currencyCode
        self.locale = locale
        self.showSymbol = showSymbol
        self.currencyPlacement = currencyPlacement
        self.amountFont = amountFont
        self.currencyFont = currencyFont
        self.amountColor = amountColor
        self.currencyColor = currencyColor
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            if privacyManager.isMasked {
                maskedContent
            } else {
                unmaskedContent
            }
        }
    }
    
    @ViewBuilder
    private var maskedContent: some View {
        if currencyPlacement == .leading {
            GlassyAsterisks(course: 3, font: currencyFont)
            GlassyAsterisks(course: 6, font: amountFont)
        } else {
            GlassyAsterisks(course: 6, font: amountFont)
            GlassyAsterisks(course: 3, font: currencyFont)
        }
    }
    
    @ViewBuilder
    private var unmaskedContent: some View {
        if currencyPlacement == .leading {
            currencyText
            amountText
        } else {
            amountText
            currencyText
        }
    }
    
    private var currencyText: some View {
        Text(displayCurrency)
            .font(currencyFont)
            .foregroundStyle(currencyColor)
    }
    
    private var amountText: some View {
        Text(formattedAmount)
            .font(amountFont)
            .foregroundStyle(amountColor)
    }
    
    // MARK: - Helpers
    
    private var displayCurrency: String {
        if showSymbol {
            return locale.currencySymbol ?? currencyCode
        } else {
            return currencyCode
        }
    }
    
    private var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locale
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}

#Preview {
    VStack(spacing: 20) {
        AmountLabel(amount: 12450.88, currencyCode: "AED", showSymbol: false)
        AmountLabel(amount: 12450.88, currencyCode: "USD", showSymbol: true, amountColor: .blue)
        AmountLabel(amount: 50.00, currencyCode: "EUR", currencyPlacement: .trailing)
    }
    .environmentObject(PrivacyManager())
}
