//
//  SplashScreen.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 20/05/26.
//

import SwiftUI

struct SplashScreen: View {
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
            VStack {
                Spacer()
                VStack(spacing: isIpad ? 72 : 48) {
                    Image("TempLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isIpad ? 240 : 140)
                        .accessibilityLabel("Logo JAMPE!")
                    
                    VStack(spacing: isIpad ? 72 : 48) {
                        Text("Bem-vindo(a)\nao Jampe!")
                            .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                            .foregroundStyle(Color.azulTitulo)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                        
                        Text("Aqui você pode simular seu desgaste físico e tempo de recuperação baseado no seu treino de vôlei de quadra.")
                            .font(isIpad ? .title : .subheadline)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                            .frame(maxWidth: isIpad ? 520 : 220)
                    }
                    .padding(.horizontal, 32)
                }
                Spacer()
                
                PrimaryButton(title: "Começar") {
                }
                .padding(.horizontal, isIpad ? 92 : 52)
                .padding(.bottom, 52)
            }
            .background(Color.background)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashScreen()
}
