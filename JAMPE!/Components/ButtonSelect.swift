//
//  ButtonSelect.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 20/05/26.
//

import SwiftUI

struct ButtonSelect: View {
    @State var positions: [String]
    //= ["Levantador","Líbero","Central","Ponta","Oposto"]
    @State var selected: String
    var body: some View {
        VStack (spacing: 12){
            ForEach(positions, id: \.self) { positions in
                Button(action: {
                    print("Clicou em: \(positions)")
                    selected = positions
                    print(selected)
                }) {
                    HStack(spacing: 20){
                        if positions == selected {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.border)
                        }
                        else {
                            Image(systemName: "poweroff")
                                .font(.system(size: 30, weight: .ultraLight))
                                .foregroundColor(.border)
                        }
                        Text(positions)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.border)
                    }
                    .frame(width: 200, height: 45, alignment: .leading)
                    .padding(.horizontal)
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
}


#Preview {
    ButtonSelect(positions: ["Extremamente Leve","Muito Leve","Ainda Bastante Leve", "Leve", "Quase Moderado", "Moderado", "Quase Intenso", "Intenso", "Muito Intenso", "Extremadamente Intenso"], selected: "")
}
