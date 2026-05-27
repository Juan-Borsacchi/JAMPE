//
//  WarningPopUp.swift
//  JAMPE!
//
//  Created by Mirella Bransford Lourenço on 22/05/26.
//
import SwiftUI

struct WarningPopUp: View {
    
    var body: some View {
        
        ZStack {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            WarningPopUpCard(
                title: "Importante",
                message: "As informações apresentadas são apenas simulações. Para uma avaliação mais precisa, consulte um profissional",
                buttonTitle: "Entendi"
            ) {
                
                print("Botão clicado")
                
            }
            .padding()
        }
    }
}

struct WarningPopUpCard: View {
    
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> Void
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        
        VStack(spacing: isIpad ? 34 : 22) {
            
            Image(systemName: "exclamationmark.circle.fill")
                .font(.system(size: isIpad ? 86 : 52))
                .foregroundStyle(Color("TitleBlue"))
            
            Text(title)
                .font(.system(size: isIpad ? 38 : 24, weight: .bold))
                .foregroundStyle(Color("WarningText"))
                .multilineTextAlignment(.center)
            
            Text(message)
                .font(.system(size: isIpad ? 28 : 18, weight: .medium))
                .foregroundStyle(Color("WarningText"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, isIpad ? 18 : 8)
            
            Button {
                
                action()
                
            } label: {
                
                Text(buttonTitle)
                    .font(.system(size: isIpad ? 26 : 17, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: isIpad ? 76 : 52)
                    .background(Color("TitleBlue"))
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: isIpad ? 24 : 16
                        )
                    )
            }
        }
        .padding(isIpad ? 44 : 24)
        .frame(maxWidth: isIpad ? 560 : 320)
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: isIpad ? 40 : 28
            )
        )
        .shadow(
            color: .black.opacity(0.15),
            radius: isIpad ? 28 : 20
        )
    }
}

#Preview {
    
    WarningPopUp()
}
