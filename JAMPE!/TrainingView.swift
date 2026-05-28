//
//  TrainingView.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 22/05/26.
//

import SwiftUI

struct TrainingView: View {
    let playerPosition: PlayerPosition
    let knowsVoleiBasics: Bool
    
    @Binding var path: [Destination]
    
    @State private var selectedIntensity: String = ""
    @State private var hour: Int = 0
    @State private var minute: Int = 0
    @State private var showWarning = false
    
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    private var durationMinutes: Int {
        return (hour * 60) + minute
    }
    
    private var borgScale: Int {
        if let intensityEnum = borgIntensity(rawValue: selectedIntensity) {
            return (borgIntensity.allCases.firstIndex(of: intensityEnum) ?? 0) + 1
        }
        return 1
    }
    
    private var textNext: Bool {
        switch dynamicTypeSize {
        case .accessibility3, .accessibility4, .accessibility5:
            return false
        default:
            return true
        }
    }
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        ZStack { // O ZStack garante o alinhamento correto das camadas na tela
            ScrollView {
                VStack(spacing: 20) {
                    Text("Sobre o Treino")
                        .font(isIpad ? .largeTitle.weight(.bold) : .title.weight(.bold))
                        .foregroundStyle(Color.titleBlue)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.8)
                    
                    ProgressBar(progress: 1.0)
                    
                    Text("Qual foi a duração do seu treino?")
                        .font(isIpad ? .title.weight(.bold) : .title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, isIpad ? 32 : 16)
                    
                    TimePicker(hour: $hour, minute: $minute)
                        .padding(15)
                        .padding(.horizontal)
                    
                    Text("Como você avaliaria o esforço físico durante seu treino?")
                        .font(isIpad ? .title.weight(.bold) : .title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, isIpad ? 32 : 16)
                    
                    Text("Selecione apenas em uma intensidade, de acordo com a sensação percebida.")
                        .font(isIpad ? .title2 : .callout)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, isIpad ? 32 : 16)
                    
                    BorgScale(selectedIntensity: $selectedIntensity)
                        .padding(.horizontal, isIpad ? 16 : 0)
                        .padding(.vertical)
                    
                    BorgScaleInfoCard()
                        .padding(.horizontal, isIpad ? 32 : 16)
                    
                    PrimaryButton(title: "Simular") {
                        if durationMinutes > 0 && !selectedIntensity.isEmpty {
                            withAnimation {
                                path.append(.simulationView(
                                    playerPosition: playerPosition,
                                    borgScale: borgScale,
                                    durationMinutes: durationMinutes,
                                    knowsVoleiBasics: knowsVoleiBasics
                                ))
                            }
                        } else {
                            withAnimation {
                                showWarning = true
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onChange(of: [hour, minute]) { oldValues, newValues in
                    print("Tempo updated: \(newValues[0])h \(newValues[1])min")
                }
            }
            
            // Camada de sobreposição do Alerta de Validação
            if showWarning {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                WarningPopUpCard(
                    title: "Atenção",
                    message: "Por favor, Selecione todos os campos.",
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
    TrainingView(playerPosition: .libero, knowsVoleiBasics: true, path: .constant([]))
}
