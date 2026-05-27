//
//  BorgScaleText.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 26/05/26.
//

import SwiftUI

struct BorgScaleText: View {
    @State var texts: [String]
    
    @Environment(\.colorScheme) var colorScheme
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(texts, id: \.self) { text in
                VStack(alignment: .center) {
                    Text(text)
                        .font(isIpad ? .title2 : .caption)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: isIpad ? 350 : 150)
                }
                .frame(maxWidth: isIpad ? 450 : 110)
                .frame(height: 126)
                .overlay(alignment: .top) {
                    Rectangle()
                        .fill(colorScheme == .dark ? Color.white.opacity(0.4) : Color.black.opacity(0.1))
                        .frame(height: 1)
                }
            }
        }
        .frame(height: 630)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(colorScheme == .dark ? Color.white.opacity(0.4) : Color.black.opacity(0.1))
                .frame(height: 1)
        }
    }
}

#Preview {
    BorgScaleText(texts: borgFelling.allCases.map { $0.rawValue })
}
