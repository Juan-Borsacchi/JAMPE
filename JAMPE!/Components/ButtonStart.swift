//
//  SwiftUIView.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 21/05/26.
//

import SwiftUI

struct PrimaryButton: View {
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    let title: String
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(isIpad ? .largeTitle.weight(.semibold) : .title.weight(.semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: isIpad ? 80 : 68)
                .background(Color.titleBlue)
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.28), radius: 4, x: 0, y: 4)
                .scaleEffect(isPressed ? 0.97 : 1)
                .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isPressed)
        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
        .accessibilityLabel(title)
        .accessibilityHint("Começar")
    }
}
