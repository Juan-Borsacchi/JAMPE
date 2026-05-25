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
                    
                    Text("Resultado da simulação")
                        .foregroundStyle(Color("TitleBlue"))
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
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
                        }
                        
                        ZStack {
                            Image(SelectedVision == .front ? "corpo_frente" : "corpo_costas")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .padding(.bottom, 20)
                            
                        }
                    }
                    .background(Color.blue.opacity(0.05))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    // Legenda
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.red.opacity(0.4))
                            .frame(width: 12, height: 12)
                        Text("Áreas afetadas")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 20)
                    .padding(.top, -10)

                    // Textos informativos
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Áreas afetadas na posição: Líbero")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.system(size: 16))
                            .lineSpacing(4)
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Sugestão de horas de descanso")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        RecoveryTimeCard(hours: 72)
                    }
                    .padding(.horizontal, 20)
                    
                    PrimaryButton(title: "Nova Simulação") {
                        print("Ação do botão")
                    }
                    .padding(.horizontal, 20)
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
