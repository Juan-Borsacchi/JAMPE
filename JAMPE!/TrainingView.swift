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
    
    @State private var selectedIntensity = ""
    
    @State private var hour: Int = 0
    
    @State private var minute: Int = 0
    
    @State private var navigateNext = false
    
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
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
        NavigationStack{
            ScrollView {
                VStack(spacing: 20){
                        Text("Sobre o Treino")
                            .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                            .foregroundStyle(Color.titleBlue)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                    
                    ProgressBar(progress: 1.0)
                    
                    Text("Qual foi a duração do seu treino?")
                        .font(isIpad ? .title.weight(.bold) :.title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    TimePicker(hour: $hour, minute: $minute)
                        .padding(15)
                    //.background(in: .rect(cornerRadius: 10))
                        .padding(.horizontal, 20)
                    
                    Text("Como você avaliaria o esforço físico durante seu treino?")
                        .font(isIpad ? .title.weight(.bold) :.title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Text("Selecione apenas em uma intensidade, de acordo com a sensação percebida.")
                        .font(isIpad ? .title2 : .callout)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    BorgScale()
                    
                    BorgScaleInfoCard()
                    
                    PrimaryButton(title: "Simular") {
                        navigateNext = true
                    }
                    .padding(.horizontal)
                    .navigationDestination(isPresented: $navigateNext) {
                        TelaSimulacao(
                                playerPosition: .levantador,
                                borgScale: 6,
                                durationMinutes: 90,
                                dominaFundamentos: false
                            )
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 16)
                .onChange(of: [hour, minute]) { oldValues, newValues in
                    print("Tempo atualizado: \(newValues[0])h \(newValues[1])min")
                }
            }
        }
    }
}

#Preview {
    TrainingView(playerPosition: .libero, knowsVoleiBasics: true)
}
