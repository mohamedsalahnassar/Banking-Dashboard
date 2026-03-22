import SwiftUI
import Combine

// Simple Environment Object for Global State
public class PrivacyManager: ObservableObject {
    @Published public var isMasked: Bool = true
    
    public init() {}
}
