//
//  TrainingView.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 22/05/26.
//

import SwiftUI

struct TrainingView: View {
    let playerPosition: PlayerPosition
    @State private var hour: Int = 0
    @State private var minute: Int = 0
    @State private var navigateNext = false
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 20){
                    HStack{
                        Text("Sobre o Treino")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.titleBlue)
                    }
                    //Insira a progress bar aqui
                    Text("Qual foi a duração do seu treino?")
                        .font(.system(.title, design: .rounded))
                    TimePicker(hour: $hour, minute: $minute)
                        .padding(15)
                    //.background(in: .rect(cornerRadius: 10))
                        .padding(.horizontal, 20)
                    
                    ButtonSelect(options: borgIntensity.allCases.map { $0.rawValue }, selected: "", height: 45)
                        .frame(maxWidth: .infinity)
                    
                    
                    PrimaryButton(title: "Simular") {
                        navigateNext = true
                    }
                    .navigationDestination(isPresented: $navigateNext) {
                        TelaSimulacao(playerPosition: playerPosition)
                    }
                }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.15))
        }
        .onChange(of: [hour, minute]) { oldValues, newValues in
            print("Tempo atualizado: \(newValues[0])h \(newValues[1])min")
        }
    }
}

#Preview {
    TrainingView(playerPosition: .libero)
}
