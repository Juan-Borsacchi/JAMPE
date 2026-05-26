//
//  BorgScaleText.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 26/05/26.
//

import SwiftUI

struct BorgScaleText: View {
    @State var texts: [String]
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(texts, id: \.self) { text in
                VStack(alignment: .center) {
                    Text(text)
                        .font(isIpad ? .title : .caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .frame(maxWidth: isIpad ? 350 : 150)
                }
                .frame(maxWidth: isIpad ? 450 : 110)
                .frame(height: 126)
                .overlay(alignment: .top) {
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                        .frame(height: 1)
                }
            }
        }
        .frame(height: 630)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(height: 1)
        }
    }
}

#Preview {
    BorgScaleText(texts: borgFelling.allCases.map { $0.rawValue })
}
