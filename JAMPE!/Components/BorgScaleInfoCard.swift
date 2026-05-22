//
//  BorgScaleInfoCard.swift
//  JAMPE!
//
//  Created by Mirella Bransford Lourenço on 22/05/26.
//
import SwiftUI

struct BorgScaleInfoCard: View {
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 12) {
            
            Image(systemName: "info.circle.fill")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text("Sobre a Escala de Borg")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                
                Text("Essa escala ajuda a medir o quanto o esforço do treino está exigindo do seu corpo e como você se sente durante a atividade. Seja honesto(a) na sua escolha para receber recomendações mais precisas.")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        
        .padding(.horizontal, 16)
        
        .padding(.vertical, 18)
        
        .frame(width: 361, height: 136)
        
        .background(Color("BorgBlue"))
        
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
    }
}

#Preview {
    
    ZStack {
        
        Color(.systemGray6)
            .ignoresSafeArea()
        
        BorgScaleInfoCard()
    }
}
