//
//  CurrencyExchangeRateView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/6.
//

import SwiftUI

struct CurrencyExchangeRateView: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String

    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            Text(text)

            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    CurrencyExchangeRateView(leftImage: .silverPiece, rightImage: .silverPenny, text: "1 Silver Piece = 10 Silver Pennies")
}
