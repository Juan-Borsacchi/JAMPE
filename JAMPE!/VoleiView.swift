//
//  AboutVolei.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 22/05/26.
//

import SwiftUI

struct VoleiView: View {
    
    @State private var position = ""
    @State private var knowsVoleiBasics = false
    
    @State private var navigateNext = false
    
    private var selectedPlayerPosition: PlayerPosition? {
        if position == voleiPositions.ponta.rawValue {
            return .ponteiro
        }
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
            ScrollView{
                Text("Sobre o Volei")
                    .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                    .foregroundStyle(Color.titleBlue)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                
                ProgressBar(progress: 0.5)
                
                VStack{
                    Text("Você domina os fundamentos do vôlei, considerando teoria e prática?")
                        .font(isIpad ? .title.weight(.bold) : .title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 16)
                    HStack{
                        Toggle("Ex. Manchete e Toque", isOn: $knowsVoleiBasics)
                            .tint(.titleBlue)
                            .font(isIpad ? .title2 : .callout)
                            .foregroundColor(.gray)
                    }.padding(.horizontal, 12)
                }.padding(.horizontal, isIpad ? 32 : 16)
                    .padding(.top, 28)
                    .padding(.bottom, isIpad ? 36 : 20)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                    .padding(.horizontal, isIpad ? 32 : 16)
                
                VStack{
                    Text("Qual sua posição em quadra?")
                        .font(isIpad ? .title.weight(.bold) : .title2.weight(.bold))
                        .foregroundColor(.textBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, isIpad ? 32 : 16)
                        .padding(.top, isIpad ? 36 : 20)
                        .padding(.bottom, isIpad ? 24 : 12)
                    
                    ButtonSelect(options: voleiPositions.allCases.map { $0.rawValue }, selected: $position, height: 45)
                        .padding(.horizontal, isIpad ? 32 : 16)
                }
                
                Spacer()
                    .frame(height: isIpad ? 232 : 32)
    
                VStack {
                    
                    Group{
                        if textNext {
                            PrimaryButton(title: "Próxima Etapa") {
                                if selectedPlayerPosition != nil {
                                    navigateNext = true
                                }
                            }
                            .padding(.horizontal, isIpad ? 92 : 52)
                        }else{
                            PrimaryButton(title: "Próximo") {
                                if selectedPlayerPosition != nil {
                                    navigateNext = true
                                }
                            }
                            .padding(.horizontal, isIpad ? 92 : 52)
                        }
                    }
                }
            
        }
        .navigationDestination(isPresented: $navigateNext) {
            if let selectedPlayerPosition {
                TrainingView(playerPosition: selectedPlayerPosition, knowsVoleiBasics: knowsVoleiBasics)
            }
        }
    }
    
}

#Preview {
    VoleiView()
}
