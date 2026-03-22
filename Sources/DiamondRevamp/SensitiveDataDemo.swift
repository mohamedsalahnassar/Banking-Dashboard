//
//  SensitiveDataDemo.swift
//  DiamondRevamp
//
//  Created by Mohamed Nassar on 18/01/2026.
//

import SwiftUI

//struct SensitiveDataDemo: View {
//    @State private var isMasked: Bool = true
//    let balance = "$12,450.88"
//    
//    var body: some View {
//        ZStack {
//            // A vibrant background helps visualize the glass refraction
//            Color.indigo.ignoresSafeArea()
//            
//            VStack(spacing: 50) {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Total Balance")
//                        .font(.subheadline)
//                        .foregroundStyle(.secondary)
//                    
//                    HStack(spacing: 4) {
//                        if isMasked {
//                            Text("******")
//                                .font(.system(size: 34, weight: .bold, design: .rounded))
//                                .foregroundStyle(.white)
//                        } else {
//                            Text(balance)
//                                .font(.system(size: 34, weight: .bold, design: .rounded))
//                                .foregroundStyle(.white)
//                                .transition(.opacity.combined(with: .scale))
//                        }
//                    }
//                }
//                .padding(30)
//                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
//                
//                // Toggle Button
//                Button(action: { withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) { isMasked.toggle() } }) {
//                    Label(isMasked ? "Reveal Balance" : "Hide Balance", 
//                           systemImage: isMasked ? "eye" : "eye.slash")
//                    .font(.headline)
//                    .padding()
//                    .background(.ultraThinMaterial, in: Capsule())
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    SensitiveDataDemo()
//}
