//
//  TelaResultado.swift
//  JAMPE!
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/05/26.
//
import SwiftUI

enum VisionBody: String, CaseIterable, Identifiable {
    case front = "Frente"
    case back = "Costas"
    
    var id: String { self.rawValue }
}

struct TelaSimulacao: View {
    
    @State private var SelectedVision: VisionBody = .front
    
    var body: some View {
            
    ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    //titulo
                    Text("Resultado da simulação")
                        .foregroundStyle(Color("TitleBlue"))
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    //caixinha com o corpo
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            Picker("", selection: $SelectedVision) {
                                ForEach(VisionBody.allCases) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 150)
                            .padding([.top, .trailing], 16)
                            Spacer()
                        }
                        
                        ZStack {
                            Image(SelectedVision == .front ? "corpo_frente" : "corpo_costas")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .opacity(0.4)
                                .padding(.vertical, 22)
                            
                        }
                    }
                    .background(Color.bodyBox)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.borderBodyBox, lineWidth: 3)
                    )
                    .padding(.horizontal)
                    
                    // Legenda
                    HStack(spacing: 10) {
                        Circle()
                            .fill(Color.red.opacity(0.5))
                            .frame(width: 16, height: 16)
                        Text("Áreas afetadas")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 16)
                    .padding(.top, -10)

                    // Textos informativos
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Áreas afetadas na posição: Líbero")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.system(size: 16))
                            .lineSpacing(4)
                            .foregroundColor(Color("TextColorAffected"))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 16)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Sugestão de horas de descanso")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        RecoveryTimeCard(hours: 72)
                    }
                    .padding(.horizontal, 16)
                    
                    PrimaryButton(title: "Nova Simulação") {
                        print("Ação do botão")
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                }
            }
            .background(Color.background)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

#Preview {
    TelaSimulacao()
}
