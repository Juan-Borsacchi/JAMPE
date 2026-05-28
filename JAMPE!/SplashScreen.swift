//
//  SplashScreen.swift
//  JAMPE!
//
//  Created by Pedro Henrique Hossaka Teruel on 20/05/26.
//

import SwiftUI

enum Destination: Hashable {
    case voleiView
    case trainingView(playerPosition: PlayerPosition, knowsVoleiBasics: Bool)
    case simulationView(playerPosition: PlayerPosition, borgScale: Int, durationMinutes: Int, knowsVoleiBasics: Bool)
}

struct SplashScreen: View {
    
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    @State private var path = [Destination]()
    
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
            return 290
            
        case .accessibility1, .accessibility2:
            return 300
            
        case .accessibility3, .accessibility4, .accessibility5:
            return nil
            
        @unknown default:
            return nil
        }
    }
    
    let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    
    var body: some View {
        NavigationStack(path: $path) {
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
                            .font(isIpad ? .largeTitle.weight(.bold) : .title.weight(.bold))
                            .foregroundStyle(Color.titleBlue)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                        
                        // Chamada do bloco otimizado que resolve o erro de compilação
                        descriptionBlock
                    }
                    .padding(.horizontal, 32)
                }
                
                Spacer()
                
                VStack {
                    PrimaryButton(title: "Começar") {
                        path.append(.voleiView)
                    }
                    .padding(.horizontal, isIpad ? 92 : 52)
                    .padding(.bottom, 52)
                }
                .frame(maxHeight: 68)
            }
            .background(Color.background)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .voleiView:
                    VoleiView(path: $path)
                case .trainingView(let position, let basics):
                    TrainingView(playerPosition: position, knowsVoleiBasics: basics, path: $path)
                case .simulationView(let position, let scale, let minutes, let basics):
                    SimulationView(playerPosition: position, borgScale: scale, durationMinutes: minutes, knowsVoleiBasics: basics, path: $path)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
    @ViewBuilder
    private var descriptionBlock: some View {
        let textContent = Text("Aqui você pode simular seu desgaste físico e tempo de recuperação baseado no seu treino de vôlei de quadra.")
            .font(isIpad ? .title : .callout)
            .foregroundStyle(.primary)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .frame(maxWidth: isIpad ? 520 : maxCardWidth)
        
        if needScrollView {
            ScrollView {
                textContent
            }
        } else {
            textContent
        }
    }
}

#Preview {
    SplashScreen()
}
