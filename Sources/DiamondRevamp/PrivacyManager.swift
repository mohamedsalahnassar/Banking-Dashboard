import SwiftUI
import Combine

// Simple Environment Object for Global State
class PrivacyManager: ObservableObject {
    @Published var isMasked: Bool = true
}
