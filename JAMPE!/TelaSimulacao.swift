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

// Modelo para segurar as coordenadas exatas de cada bolinha
struct InjuryPoint: Hashable {
    let x: CGFloat
    let y: CGFloat
}

enum PlayerPosition: String, CaseIterable {
    case oposto = "Oposto"
    case ponteiro = "Ponteiro"
    case libero = "Líbero"
    case central = "Central"
    case levantador = "Levantador"
    
    // Retorna os pontos vermelhos dependendo da Posição e se é Frente/Costas
    func injuryPoints(for vision: VisionBody) -> [InjuryPoint] {
        switch self {
        case .oposto, .ponteiro:
            // Joelho e Tornozelo na Frente | Ombro de Ataque nas Costas
            if vision == .front {
                return [
                    InjuryPoint(x: -16, y: 60),  // Joelho
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    InjuryPoint(x: -30, y: -90) // Ombro de ataque
                ]
            } else {
                return [
                    InjuryPoint(x: 16, y: 60),  // Joelho
                        InjuryPoint(x: 16, y: 122), // Tornozelo
                        InjuryPoint(x: 30, y: -90)  // Ombro de ataque
                ]
                
            }
            
        case .libero:
            // Tornozelo, Punho e Dedos na Frente | Nada nas costas
            if vision == .front {
                return [
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    InjuryPoint(x: -38, y: -22), // Punho
                    InjuryPoint(x: -42, y: -5)   // Dedos
                ]
            } else { return [] }
            
        case .central:
            // Dedos, Tornozelo e Punho na Frente | Nada nas costas
            if vision == .front {
                return [
                    InjuryPoint(x: -42, y: -5),  // Dedos
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    InjuryPoint(x: -38, y: -22)  // Punho
                ]
            } else { return [] }
            
        case .levantador:
            // Punho, Ombro e Dedos na Frente | Nada nas costas
            if vision == .front {
                return [
                    InjuryPoint(x: -38, y: -22), // Punho
                    InjuryPoint(x: -28, y: -72), // Ombro
                    InjuryPoint(x: -42, y: -5)   // Dedos
                ]
            } else { return [] }
        }
    }
}

struct TelaSimulacao: View {
    
    let playerPosition: PlayerPosition
    
    @State private var SelectedVision: VisionBody = .front
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Título
                Text("Resultado da simulação")
                    .foregroundStyle(Color("TitleBlue"))
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                
                // Caixinha com o corpo
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
                    
                    // Ajuste preciso do posicionamento das bolinhas
                    ZStack {
                        Image(SelectedVision == .front ? "corpo_frente" : "corpo_costas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 300) // Frame direto no elemento ancora
                            .opacity(0.4)
                        
                        // Renderização das bolinhas dinâmicas
                        ForEach(playerPosition.injuryPoints(for: SelectedVision), id: \.self) { point in
                            Circle()
                                .fill(Color.red.opacity(0.6))
                                .frame(width: 16, height: 16)
                                .offset(x: point.x, y: point.y)
                        }
                    }
                    .frame(width: 200, height: 300)
                    .padding(.vertical, 22)
                    .frame(maxWidth: .infinity)
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
                    Text("Áreas afetadas na posição: \(playerPosition.rawValue)")
                        .font(.title3.weight(.bold))
                        .foregroundStyle(Color("TitleBlue"))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.system(size: 16))
                        .lineSpacing(4)
                        .foregroundColor(Color("TextColorAffected"))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                
                // Sugestão de descanso
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sugestão de horas de descanso")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color("TitleBlue"))
                    
                    RecoveryTimeCard(hours: 72)
                }
                .padding(.horizontal)
                
                // Botão
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
    TelaSimulacao(playerPosition: .libero)
}

/*
 oposto, ponteiro falta ombro de ataque
 líbero, central dedos posicionado errado
 levantador, punho ombro e dedos posicionados errados
 
 
 
 */
