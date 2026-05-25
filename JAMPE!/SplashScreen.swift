//
//  SplashScreen.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 20/05/26.
//

import SwiftUI

struct SplashScreen: View {
    
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    @State private var navigateNext = false
    
    private var needScrollView: Bool {
        switch dynamicTypeSize {
        case .accessibility3, .accessibility4, .accessibility5:
            return true
        default:
            return false
        }
    }
    
    private var maxCardWidth: CGFloat? {
            switch dynamicTypeSize {
            case .xSmall, .small, .medium, .large, .xLarge, .xxLarge, .xxxLarge:
                return 220

            case .accessibility1, .accessibility2:
                return 300

            case .accessibility3, .accessibility4, .accessibility5:
                return .infinity

            @unknown default:
                return .infinity
            }
        }
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
            
        NavigationStack {
            VStack {
                Spacer()
                VStack(spacing: isIpad ? 72 : 48) {
                    Image("TempLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isIpad ? 240 : 140)
                        .accessibilityLabel("Logo JAMPE!")
                            
                    VStack(spacing: isIpad ? 72 : 48) {
                        Text("Bem-vindo(a)\nao Jampe!")
                            .font(isIpad ? .largeTitle.weight(.bold) :.title.weight(.bold))
                            .foregroundStyle(Color.titleBlue)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                        Group {
                            if needScrollView {
                                ScrollView {
                                    Text("Aqui você pode simular seu desgaste físico e tempo de recuperação baseado no seu treino de vôlei de quadra.")
                                        .font(isIpad ? .title : .subheadline)
                                        .foregroundStyle(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineSpacing(4)
                                        .frame(maxWidth: isIpad ? 520 : maxCardWidth)
                                }
                            } else {
                                Text("Aqui você pode simular seu desgaste físico e tempo de recuperação baseado no seu treino de vôlei de quadra.")
                                    .font(isIpad ? .title : .subheadline)
                                    .foregroundStyle(.primary)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(4)
                                    .frame(maxWidth: isIpad ? 520 : maxCardWidth)
                            }
                        }
                    }
                    .padding(.horizontal, 32)
                }
                Spacer()
                VStack {
                    PrimaryButton(title: "Começar") {
                        navigateNext = true
                    }
                    .padding(.horizontal, isIpad ? 92 : 52)
                    .padding(.bottom, 52)
                }.frame(maxHeight: 68)
                    .navigationDestination(isPresented: $navigateNext) {
                        VoleiView()
                }
            }
            .background(Color.background)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
}

#Preview {
    SplashScreen()
}
