//
//  UserDefaultsExtension.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/19.
//

import Foundation

extension UserDefaults {
    private static let leftCurrencyKey = "leftCurrency"
    private static let rightCurrencyKey = "rightCurrency"

    static func saveCurrencySelections(left: CurrencyModel, right: CurrencyModel) {
        standard.set(left.name, forKey: leftCurrencyKey)
        standard.set(right.name, forKey: rightCurrencyKey)
    }

    static func loadCurrencySelections() -> (left: CurrencyModel, right: CurrencyModel) {
        let getCurrency = { (key: String, defaultCurrency: CurrencyModel) in
            CurrencyModel.allCases.first { $0.name == standard.string(forKey: key) } ?? defaultCurrency
        }

        return (
            getCurrency(leftCurrencyKey, .silverPiece),
            getCurrency(rightCurrencyKey, .goldPiece)
        )
    }
}
