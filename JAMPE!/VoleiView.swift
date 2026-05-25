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
                        .font(.title2)
                    HStack{
                        Text("Ex. Manchete e Toque")
                        Spacer()
                        Toggle("", isOn: .constant(true))
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    VoleiView()
}
