//
//  SelectOptions.swift
//  JAMPE!
//
//  Created by Juan Gabriel Borsacchi Marques on 22/05/26.
//

import Foundation

enum positions: String, CaseIterable {
    case levantador = "Levantador"
    case libero = "Líbero"
    case central = "Central"
    case ponta = "Ponta"
    case oposto = "Oposto"
}

enum intensidade: String, CaseIterable {
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
}
