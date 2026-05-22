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
                .foregroundStyle(Color("TitleBlue"))
                .font(.system(size: 28, weight: .bold,design: .default))
            
            Text("Áreas afetadas na posição: Líbero")
            
            Text("Sugestão de horas de descanso")
        }
    }
}

#Preview {
    TelaSimulacao()
}
