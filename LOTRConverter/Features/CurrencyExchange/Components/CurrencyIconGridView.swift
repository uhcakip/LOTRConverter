//
//  CurrencyIconGridView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/12.
//

import SwiftUI

struct CurrencyIconGridView: View {
    @Binding var selectedCurrency: CurrencyModel

    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        LazyVGrid(columns: columns) {
            ForEach(CurrencyModel.allCases) { currency in
                if self.selectedCurrency == currency {
                    CurrencyIconView(image: currency.image, name: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5))
                } else {
                    CurrencyIconView(image: currency.image, name: currency.name)
                        .onTapGesture {
                            self.selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    CurrencyIconGridView(selectedCurrency: .constant(.silverPenny))
}
