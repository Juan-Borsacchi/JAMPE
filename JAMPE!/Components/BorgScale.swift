//
//  BorgScale.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 26/05/26.
//

import SwiftUI

struct BorgScale: View {
    
    @State private var selectedIntensity = ""
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: isIpad ? 24: 8, height: 630)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.borgScale1, .borgScale2, .borgScale3, .borgScale4, .borgScale5, .borgScale6, .borgScale7, .borgScale8, .borgScale9, .borgScale10],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            ButtonSelect(options: borgIntensity.allCases.map { $0.rawValue }, selected: $selectedIntensity, height: 45)
                .frame(maxWidth: .infinity)
            
            Spacer()
            BorgScaleText(texts: borgFelling.allCases.map { $0.rawValue })
                //.padding()
        }
        .padding(.horizontal)
    }
}

#Preview {
    BorgScale()
}
