//
//  ButtonSelect.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 20/05/26.
//

import SwiftUI

struct ButtonSelect: View {
    @State var options: [String]
    //= ["Levantador","Líbero","Central","Ponta","Oposto"]
    @State var selected: String
    @State var width: CGFloat
    @State var height: CGFloat
    var body: some View {
        VStack (spacing: 12){
            ForEach(options, id: \.self) { option in
                Button(action: {
                    print("Clicou em: \(option)")
                    selected = option
                    print(selected)
                }) {
                    HStack(spacing: 20){
                        if option == selected {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(.black)
                                        .padding(2)
                                )
                        }
                        else {
                            Image(systemName: "poweroff")
                                .font(.system(size: 30, weight: .ultraLight))
                                .foregroundColor(.border)
                        }
                        Text(option)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(option == selected ? (isBorg(option) ? .black : .white) : .border)
                    }
                    .frame(maxWidth: .infinity, maxHeight: height, alignment: .leading)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                        
                            .fill(option == selected ? resolveColor(for: option) : Color.clear)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.border, lineWidth: 1))
                    //.buttonStyle(.bordered)
                    //.tint(Color.blue)
                    
                }
            }
            
        }
        .padding()
    }
    private func isBorg(_ option: String) -> Bool {
            return borgIntensity(rawValue: option) != nil
        }
        
        // Nova lógica de cores controlada
        private func resolveColor(for option: String) -> Color {
            if let intensityCase = borgIntensity(rawValue: option) {
                // Se for Borg, retorna a cor colorida da escala
                return intensityCase.backgroundColor
            }
            // Se NÃO for Borg (ou seja, se for as posições do Vôlei), retorna o fundo preto
            return Color.black
        }
}


#Preview("Teste Vôlei") {
    ButtonSelect(options: voleiPositions.allCases.map { $0.rawValue }, selected: "Levantador", width: 300, height: 45)
}

// Preview testando com Borg (vai ficar colorido ao selecionar)
#Preview("Teste Borg") {
    ButtonSelect(options: borgIntensity.allCases.map { $0.rawValue }, selected: "Moderado", width: 300, height: 45)
}
