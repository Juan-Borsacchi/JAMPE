//
//  SelectOptions.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 22/05/26.
//

import SwiftUI

enum voleiPositions: String, CaseIterable {
    case levantador = "Levantador"
    case libero = "Líbero"
    case central = "Central"
    case ponteiro = "Ponteiro"
    case oposto = "Oposto"
}

enum borgIntensity: String, CaseIterable {
    case extremamenteLeve = "Extremamente Leve"
    case muitoLeve = "Muito Leve"
    case bastanteLeve = "Ainda Bastante Leve"
    case leve = "Leve"
    case quaseModerado = "Quase Moderado"
    case moderado = "Moderado"
    case quaseIntenso = "Quase Intenso"
    case intenso = "Intenso"
    case muitoIntenso = "Muito Intenso"
    case extremamenteIntenso = "Extremamente Intenso"
    
    var backgroundColor: Color {
            switch self {
            case .extremamenteLeve:
                return Color.borgScale1
            case .muitoLeve:
                return Color.borgScale2
            case .bastanteLeve:
                return Color.borgScale3
            case .leve:
                return Color.borgScale4
            case .quaseModerado:
                return Color.borgScale5
            case .moderado:
                return Color.borgScale6
            case .quaseIntenso:
                return Color.borgScale7
            case .intenso:
                return Color.borgScale8
            case .muitoIntenso:
                return Color.borgScale9
            case .extremamenteIntenso:
                return Color.borgScale10
            }
        }
    var textColor: Color {
            switch self {
            case .extremamenteLeve, .muitoLeve, .muitoIntenso, .extremamenteIntenso:
                return .white
            default:
                return .black 
            }
        }
}
