//
//  CurrencyModel.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/10.
//

import SwiftUI

enum CurrencyModel: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1 // central currency unit

    var id: CurrencyModel { self }

    var image: ImageResource {
        switch self {
        case .copperPenny:
            return .copperPenny
        case .silverPenny:
            return .silverPenny
        case .silverPiece:
            return .silverPiece
        case .goldPenny:
            return .goldPenny
        case .goldPiece:
            return .goldPiece
        }
    }

    var name: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        }
    }
}

