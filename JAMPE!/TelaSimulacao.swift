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
    
    func injuryPoints(for vision: VisionBody) -> [InjuryPoint] {
        switch self {
        case .oposto, .ponteiro:
            // Joelho e Tornozelo e ombro de ataque
            if vision == .front {
                return [
                    InjuryPoint(x: -16, y: 60),  // Joelho
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    InjuryPoint(x: -30, y: -90), // Ombro de ataque
                    
                    InjuryPoint(x: 16, y: 60),  // Joelho
                    InjuryPoint(x: 16, y: 122), // Tornozelo
                ]
            } else {
                return [
                    InjuryPoint(x: -16, y: 60),  // Joelho
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    
                    InjuryPoint(x: 16, y: 60),  // Joelho
                    InjuryPoint(x: 16, y: 122), // Tornozelo
                    InjuryPoint(x: 30, y: -90)  // Ombro de ataque
                ]
            }
            
        case .libero, .central:
            // Tornozelo, Punho e Dedos
            if vision == .front {
                return [
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    InjuryPoint(x: -33, y: -10), // Punho
                    InjuryPoint(x: -29, y: 10),   // Dedos
                    
                    InjuryPoint(x: 16, y: 122), // Tornozelo
                    InjuryPoint(x: 33, y: -10), // Punho
                    InjuryPoint(x: 29, y: 10)   // Dedos
                ]
            } else {
                return [
                    InjuryPoint(x: -16, y: 122), // Tornozelo
                    InjuryPoint(x: -33, y: -10), // Punho
                    InjuryPoint(x: -29, y: 10),   // Dedos
                    
                    InjuryPoint(x: 16, y: 122), // Tornozelo
                    InjuryPoint(x: 33, y: -10), // Punho
                    InjuryPoint(x: 29, y: 10)   // Dedos
                ]
           }
            
        case .levantador:
            // Punho, Ombro e Dedos
            if vision == .front{
                return [
                    InjuryPoint(x: -33, y: -10), // Punho
                    InjuryPoint(x: 33, y: -10), // Punho
                    
                    InjuryPoint(x: -29, y: 10),   // Dedos
                    InjuryPoint(x: 29, y: 10),   // Dedos
                    
                    InjuryPoint(x: -30, y: -90), // Ombro de ataque
                ]
            } else {
                return [
                InjuryPoint(x: -33, y: -10), // Punho
                InjuryPoint(x: 33, y: -10), // Punho
                
                InjuryPoint(x: -29, y: 10),   // Dedos
                InjuryPoint(x: 29, y: 10),   // Dedos
                
                InjuryPoint(x: 30, y: -90)  // Ombro de ataque
                
            ] }
            
        }
    }
}

// Componente isolado para criar as ondas vibrantes infinitas do sonar
struct NeonPulseIndicator: View {
    @State private var waveAnimation = false
    
    var body: some View {
        ZStack {
            // Ondas externas (Efeito Sonar Vibrante)
            ForEach(0..<3) { index in
                Circle()
                    .stroke(Color.red.opacity(0.4), lineWidth: 1.5)
                    .frame(width: 50, height: 50)
                    .scaleEffect(waveAnimation ? 1.5 : 0.3)
                    .opacity(waveAnimation ? 0.0 : 0.9)
                    .animation(
                        Animation.easeOut(duration: 1.8)
                            .repeatForever(autoreverses: false)
                            .delay(Double(index) * 0.5),
                        value: waveAnimation
                    )
            }
            
            // Núcleo central brilhante
            Image(systemName: "circle.fill")
                .font(.system(size: 18))
                .foregroundStyle(Color.red.opacity(0.6))
                .shadow(color: .red, radius: 4)
        }
        .onAppear {
            waveAnimation = true
        }
    }
}

struct TelaSimulacao: View {
    
    let playerPosition: PlayerPosition
    
    @State private var SelectedVision: VisionBody = .front
    @State private var showWarning = true
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Título
                Text("Resultado da simulação")
                    .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                    .foregroundStyle(Color("TitleBlue"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Resultado da simulação")
                        .foregroundStyle(Color("TitleBlue"))
                        .font(.system(size: 28, weight: .bold))
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
                            
                            Spacer()
                        }
                        
                        ZStack {
                            
                            Image(SelectedVision == .front ? "corpo_frente" : "corpo_costas")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300)
                                .opacity(0.4)
                            
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
                    
                    HStack(spacing: 10) {
                        
                        // Renderização das bolinhas dinâmicas
                        ForEach(playerPosition.injuryPoints(for: SelectedVision), id: \.self) { point in
                            NeonPulseIndicator()
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
                HStack(spacing: 6) {
                    Image(systemName: "circle.fill")
                        //.font(.system(size: 18))
                        .font(.footnote)
                        .foregroundStyle(Color.red.opacity(0.7))
                    Text("Áreas afetadas")
                        //.font(.system(size: 14))
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 16)
                .padding(.top, -8)

                // Textos informativos
                VStack(alignment: .leading, spacing: 10) {
                    Text("Áreas afetadas na posição: \(playerPosition.rawValue)")
                        .font(.title3.weight(.bold))
                        .foregroundStyle(Color("TitleBlue"))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        //.font(.system(size: 16))
                        .font(.body)
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
                        //.font(.system(size: 22, weight: .bold))
                        .font(.title3.weight(.bold))
                        .foregroundStyle(Color("TitleBlue"))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Sugestão de horas de descanso")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        RecoveryTimeCard(hours: 72)
                    }
                    .padding(.horizontal)
                    
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
            
            if showWarning {
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                WarningPopUpCard(
                    title: "Aviso Importante",
                    message: "Este aplicativo tem caráter educativo e não substitui avaliação profissional.",
                    buttonTitle: "Entendi"
                ) {
                    withAnimation {
                        showWarning = false
                    }
                }
                .transition(.scale)
            }
        }
    }
}

#Preview {
    TelaSimulacao(playerPosition: .oposto)
}
