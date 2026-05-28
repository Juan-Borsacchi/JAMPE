//
//  AboutVolei.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 22/05/26.
//

import SwiftUI

struct VoleiView: View {
    
    @Binding var path: [Destination]
    
    @State private var position = ""
    @State private var knowsVoleiBasics = false
    
    // Propriedade de estado para controlar a exibição do aviso
    @State private var showWarning = false
    
    private var selectedPlayerPosition: PlayerPosition? {
        return PlayerPosition(rawValue: position)
    }
    
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
        ZStack { // O ZStack permite sobrepor o aviso perfeitamente na tela inteira
            ScrollView {
                Text("Sobre o Volei")
                    .font(isIpad ? .largeTitle.weight(.bold) : .title.weight(.bold))
                    .foregroundStyle(Color.titleBlue)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                
                ProgressBar(progress: 0.5)
                
                VStack {
                    Text("Você domina os fundamentos do vôlei, considerando teoria e prática?")
                        .font(isIpad ? .title.weight(.bold) : .title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 16)
                    HStack {
                        Toggle("Ex. Manchete e Toque", isOn: $knowsVoleiBasics)
                            .tint(.titleBlue)
                            .font(isIpad ? .title2 : .callout)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                }
                .padding(.horizontal, isIpad ? 32 : 16)
                .padding(.top, 28)
                .padding(.bottom, isIpad ? 36 : 20)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal, isIpad ? 32 : 16)
                
                VStack {
                    Text("Qual sua posição em quadra?")
                        .font(isIpad ? .title.weight(.bold) : .title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, isIpad ? 32 : 16)
                        .padding(.top, isIpad ? 36 : 20)
                        .padding(.bottom, isIpad ? 24 : 12)
                    
                    ButtonSelect(options: PlayerPosition.allCases.map { $0.rawValue }, selected: $position, height: 45)
                        .padding(.horizontal, isIpad ? 32 : 16)
                }
                
                Spacer()
                    .frame(height: isIpad ? 232 : 32)
                
                VStack {
                    PrimaryButton(title: textNext ? "Próxima Etapa" : "Próximo") {
                        // Validação: se o usuário escolheu uma posição, avança. Caso contrário, avisa.
                        if let selectedPlayerPosition {
                            withAnimation {
                                path.append(.trainingView(playerPosition: selectedPlayerPosition, knowsVoleiBasics: knowsVoleiBasics))
                            }
                        } else {
                            withAnimation {
                                showWarning = true
                            }
                        }
                    }
                    .padding(.horizontal, isIpad ? 92 : 52)
                }
            }
            
            // Camada do Pop-up de Aviso (exibida apenas se showWarning for verdadeiro)
            if showWarning {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                WarningPopUpCard(
                    title: "Atenção",
                    message: isIpad ? "Por favor, selecione a sua posição em quadra antes de prosseguir para a próxima etapa." : "Por favor, selecione a sua posição antes de prosseguir para a próxima etapa.",
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
    VoleiView(path: .constant([]))
}
