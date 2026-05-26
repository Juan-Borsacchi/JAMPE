//
//  BorgScaleText.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 26/05/26.
//

import SwiftUI

import SwiftUI

struct BorgScaleText: View {
    @State var texts: [String]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) { 
            ForEach(texts, id: \.self) { text in
                VStack {
                    Text(text)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .frame(width: 110)
                }
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                .overlay(alignment: .top) {
                    Rectangle()
                        .inset(by: 0.5)
                        .stroke(.black.opacity(0.1), lineWidth: 1)
                        .frame(height: 1)
                }
            }
            .padding(.top, 30)
            //.padding(.bottom, 30)
        }
        .overlay(alignment: .bottom) {
            Rectangle()
                .inset(by: 0.5)
                .stroke(.black.opacity(0.1), lineWidth: 1)
                .frame(height: 1)
        }
    }
}



#Preview {
    BorgScaleText(texts: borgFelling.allCases.map { $0.rawValue })
}
