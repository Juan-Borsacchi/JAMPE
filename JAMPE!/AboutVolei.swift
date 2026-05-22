//
//  AboutVolei.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 22/05/26.
//

import SwiftUI

struct AboutVolei: View {
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Sobre o Volei")
                    .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                    .foregroundStyle(Color.titleBlue)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                ProgressView(value: 1, total: 2)
                    .tint(Color.titleBlue)
                
            }
        }
    }
}

#Preview {
    AboutVolei()
}
