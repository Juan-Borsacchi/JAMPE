//
//  TelaResultado.swift
//  JAMPE!
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/05/26.
//

import SwiftUI

struct TelaSimulacao: View {
    var body: some View {
        VStack {
            Text("Resultado da Simulação")
                .foregroundStyle(Color.restBlue)
                .font(.system(size: 28, weight: .bold,design: .default))
            
            Text("Áreas afetadas na posição: Líbero")
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
            
            Text("Sugestão de horas de descanso")
            
            RecoveryTimeCard(hours: 72)
            
            PrimaryButton(title: "Nova simulação"){
                print("..")
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    TelaSimulacao()
}
