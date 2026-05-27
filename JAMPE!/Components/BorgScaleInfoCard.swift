//
//  BorgScaleInfoCard.swift
//  JAMPE!
//
//  Created by Mirella Bransford Lourenço on 22/05/26.
//
import SwiftUI

struct BorgScaleInfoCard: View {
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        
        HStack(alignment: .top, spacing: isIpad ? 20 : 12) {
            
            Image(systemName: "info.circle.fill")
                .font(.system(size: isIpad ? 42 : 24, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.top, 2)
            
            VStack(alignment: .leading, spacing: isIpad ? 10 : 6) {
                
                Text("Sobre a Escala de Borg")
                    .font(
                        .system(
                            size: isIpad ? 28 : 16,
                            weight: .bold
                        )
                    )
                    .foregroundStyle(.white)
                
                Text("Essa escala ajuda a medir o quanto o esforço do treino está exigindo do seu corpo e como você se sente durante a atividade. Seja honesto(a) na sua escolha para receber recomendações mais precisas.")
                    .font(
                        .system(
                            size: isIpad ? 22 : 12
                        )
                    )
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        
        .padding(.horizontal, isIpad ? 28 : 16)
        
        .padding(.vertical, isIpad ? 28 : 18)
        
        .frame(maxWidth: .infinity)
        
        .frame(height: isIpad ? 240 : 136)
        
        .background(Color("BorgBlue"))
        
        .clipShape(
            RoundedRectangle(cornerRadius: isIpad ? 24 : 12)
        )
    }
}

#Preview {
    
    ZStack {
        
        Color(.systemGray6)
            .ignoresSafeArea()
        
        BorgScaleInfoCard()
            .padding()
    }
}
