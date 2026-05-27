//
//  ProgressBar.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 22/05/26.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double
    var color: Color = .titleBlue
    let height: CGFloat = 6
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // O GeometryReader descobre a largura exata disponível para o componente
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Barra de fundo (Cinza)
                    RoundedRectangle(cornerRadius: height / 2)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: height)
                    
                    // Barra de progresso (Azul)
                    RoundedRectangle(cornerRadius: height / 2)
                        .fill(color)
                        // Multiplica a largura DISPONÍVEL pelo progresso (entre 0.0 e 1.0)
                        .frame(width: geometry.size.width * CGFloat(trimProgress(progress)), height: height)
                }
            }
            // CRUCIAL: O GeometryReader precisa de uma altura definida para não ocupar a tela toda
            .frame(height: height)
            
            // Rótulos das etapas
            HStack {
                Text("Etapa 1")
                    .font(isIpad ? .title2 : .subheadline)
                    .foregroundColor(progress <= 0.5 ? .titleBlue : .gray)
                
                Spacer()
                
                Text("Etapa 2")
                    .font(isIpad ? .title2 : .subheadline)
                    .foregroundColor(progress <= 0.5 ? .gray : .titleBlue)
            }
        }
        // Se quiser o padding fixo dentro do componente, descomente a linha abaixo:
        .padding(.horizontal, isIpad ? 32 : 16)
    }
    
    // Função auxiliar para garantir que o progresso fique sempre entre 0% e 100%
    private func trimProgress(_ value: Double) -> Double {
        return min(max(value, 0.0), 1.0)
    }
}

#Preview {
    ProgressBar(progress: 1.0)
        .padding()
}
#Preview {
    ProgressBar(progress: 0.5)
}
