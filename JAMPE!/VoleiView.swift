//
//  AboutVolei.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 22/05/26.
//

import SwiftUI

struct VoleiView: View {
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Sobre o Volei")
                    .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                    .foregroundStyle(Color.titleBlue)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
               
                ProgressBar(progress: 0.5)
                
                VStack{
                    Text("Você domina os fundamentos do vôlei, considerando teoria e prática?")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.titleBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Toggle("Ex. Manchete e Toque", isOn: .constant(false))
                            .tint(.titleBlue)
                            .font(.callout)
                            .foregroundColor(.gray)
                    }.padding(.horizontal, 12)
                }.padding(.horizontal, 16)
                    .padding(.top, 28)
                    .padding(.bottom, 16)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal, 16)
                VStack{
                    Text("Qual sua posição em quadra?")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.titleBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 32)
                    
                    ButtonSelect(options: voleiPositions.allCases.map { $0.rawValue }, selected: "", height: 45)
                    
                }
                Spacer()
                
                VStack {
                    PrimaryButton(title: "Começar") {
                       // navigateNext = true
                    }
                    .padding(.horizontal, isIpad ? 92 : 52)
                    
                }.padding(.bottom, 16)
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    VoleiView()
}
