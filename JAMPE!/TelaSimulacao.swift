//
//  TelaResultado.swift
//  JAMPE!
//
//  Created by Agatha Barbosa Marinho dos Santos on 22/05/26.
//

import SwiftUI

enum VisionBody: String, CaseIterable, Identifiable {
    case right = "Destro"
    case left = "Canhoto"
    
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
            // Joelho e Tornozelo e ombro de ataque
            if vision == .right {
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
            return [
                InjuryPoint(x: -16, y: 122), // Tornozelo
                InjuryPoint(x: -33, y: -10), // Punho
                InjuryPoint(x: -29, y: 10),   // Dedos
                InjuryPoint(x: 16, y: 122), // Tornozelo
                InjuryPoint(x: 33, y: -10), // Punho
                InjuryPoint(x: 29, y: 10)   // Dedos
            ]
        
            
        case .levantador:
            // Punho, Ombro e Dedos
            if vision == .right {
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
    
    let color: Color
    
    @State private var waveAnimation = false
    
    var body: some View {
        
        ZStack {
            
            // Ondas externas (Efeito Sonar Vibrante)
            ForEach(0..<3) { index in
                Circle()
                    .stroke(color.opacity(0.4), lineWidth: 1.5)
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
                //.foregroundStyle(Color.red.opacity(0.6))
                //.shadow(color: .red, radius: 4)
            
                .foregroundStyle(color.opacity(0.6))
                .shadow(color: color, radius: 4)
        }
        .onAppear {
            waveAnimation = true
        }
    }
}

struct TelaSimulacao: View {
    
    let playerPosition: PlayerPosition
    
    // Novas propriedades necessárias vindas do formulário anterior
    let borgScale: Int
    let durationMinutes: Int
    let dominaFundamentos: Bool // Controla o tempo dinâmico de descanso
    
    @State private var SelectedVision: VisionBody = .right
    @State private var showWarning = true
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    // Cálculo da carga interna sRPE com os multiplicadores refinados
    private var calculatedLoadScore: Double {
        let multiplier: Double
        switch borgScale {
        case 1...4:  multiplier = 0.8
        case 5...7:  multiplier = 1.0
        case 8...9:  multiplier = 1.2 // Peso ligeiramente aumentado para intensidades exponenciais
        case 10:     multiplier = 1.4
        default:     multiplier = 1.0
        }
        return Double(borgScale * durationMinutes) * multiplier
    }
    
    // Tupla para o gerenciamento dinâmico e síncrono da legenda e pontos do sonar
    private var intensityStatus: (color: Color, text: String) {
        let score = calculatedLoadScore
        if score <= 180 {
            return (Color.borgScale5, "Áreas levemente afetadas")
        } else if score <= 630 {
            return (Color.borgScale9, "Áreas moderadamente afetadas")
        } else {
            return (Color.borgScale10, "Áreas intensamente afetadas")
        }
    }
    
    // Mapeia o exato cruzamento da Faixa de Treino + Domínio Técnico do Atleta
    private var recoveryHoursSuggestion: Int {
        let score = calculatedLoadScore
        
        if score <= 180 {
            // Faixa Leve
            return dominaFundamentos ? 6 : 24
        } else if score <= 630 {
            // Faixa Moderada
            return dominaFundamentos ? 24 : 48
        } else {
            // Faixa Intensa
            return dominaFundamentos ? 48 : 72
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Título
                    Text("Resultado da simulação")
                        .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                        .foregroundStyle(Color("TitleBlue"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    // Caixinha com o corpo
                    VStack(spacing: 0) {
                        
                        HStack {
                            Spacer()
                            
                            Picker("", selection: $SelectedVision) {
                                ForEach(VisionBody.allCases) { option in
                                    Text(option.rawValue).tag(option)
                                        //.font(.caption)
                                        //.font(isIpad ? .title.weight(.bold)  : .title3.weight(.bold))
                                        .font(.system(size: 22))
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 150)
                            .padding([.top, .trailing], 16)
                            
                            Spacer()
                        }
                        
                        // Ajuste preciso do posicionamento das bolinhas
                        ZStack {
                            
                            Image("corpo_frente")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300) // Frame direto no elemento ancora
                                .opacity(0.4)
                            
                            // Renderização das bolinhas dinâmicas
                            ForEach(playerPosition.injuryPoints(for: SelectedVision), id: \.self) { point in
                                NeonPulseIndicator(color: intensityStatus.color)
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
                    .padding(.horizontal, isIpad ? 32 : 16)
                    
                    // Legenda dinamica
                    HStack(spacing: 6) {
                        Image(systemName: "circle.fill")
                            //.font(.system(size: 18))
                            .font(.footnote)
                            .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                            .foregroundStyle(intensityStatus.color)
                        
                        Text(intensityStatus.text)
                            //.font(.system(size: 14))
                            //.font(.footnote)
                            .font(isIpad ? .title3  : .footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, isIpad ? 32 : 16)
                    .padding(.top, -8)
                    
                    /*
                     .largeTitle    // título bem grande
                     .title         // título grande
                     .title2        // título médio-grande
                     .title3        // título menor

                     .headline      // destaque
                     .body          // texto padrão
                     .callout       // texto um pouco menor que body
                     .subheadline   // subtítulo pequeno

                     .footnote      // nota pequena
                     .caption       // legenda
                     .caption2      // legenda ainda menor
                     */
                    
                    // Textos informativos
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Áreas afetadas na posição: \(playerPosition.rawValue)")
                            .font(isIpad ? .title.weight(.bold)  : .title3.weight(.bold))
                            //.font(.title3.weight(.bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            //.font(.system(size: 16))
                            //.font(.body)
                            .font(isIpad ? .title2 : .body)
                            .lineSpacing(4)
                            .foregroundColor(Color("TextColorAffected"))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, isIpad ? 32 : 16)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    
                    // Sugestão de descanso
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Sugestão de horas de descanso")
                            //.font(.system(size: 22, weight: .bold))
                            //.font(.title3.weight(.bold))
                            .font(isIpad ? .title.weight(.bold)  : .title3.weight(.bold))
                            .foregroundStyle(Color("TitleBlue"))
                        
                        RecoveryTimeCard(hours: recoveryHoursSuggestion)
                    }
                    .padding(.horizontal, isIpad ? 32 : 16)
                    
                    
                    //isIpad ? Spacer()Spacer() : Spacer()
                    
                    isIpad
                    ? AnyView(HStack {
                        Spacer()
                        Spacer()
                    })
                    : AnyView(Spacer())
                    
                    // Botão
                    PrimaryButton(title: "Nova Simulação") {
                        print("Ação do botão")
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if showWarning {
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                WarningPopUpCard(
                    title: "Aviso Importante",
                    message: "Este aplicativo tem caráter instrutivo e não substitui avaliação profissional.",
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

#Preview("Faixa Leve - Amarelo") {
    TelaSimulacao(
        playerPosition: .levantador,
        borgScale: 3,         // Intensidade Leve
        durationMinutes: 45,  // Tempo curto
        dominaFundamentos: true
    )
}

#Preview("Faixa Moderada - Laranja") {
    TelaSimulacao(
        playerPosition: .ponteiro,
        borgScale: 6,         // Intensidade Moderada
        durationMinutes: 90,  // Treino padrão de 1h30
        dominaFundamentos: true
    )
}

#Preview("Faixa Intensa - Vermelho") {
    TelaSimulacao(
        playerPosition: .central,
        borgScale: 9,          // Intensidade Muito Forte
        durationMinutes: 120,  // Treino longo de 2h
        dominaFundamentos: false
    )
}
