//
//  CurrencySelectionView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/7.
//

import SwiftUI

struct CurrencySelectionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var source: CurrencyModel
    @Binding var target: CurrencyModel

    var body: some View {
        ZStack {
            BackgroundView(type: .parchment)

            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)

                CurrencyIconGridView(selectedCurrency: $source)

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)

                CurrencyIconGridView(selectedCurrency: $target)

                Button("Done") {
                    dismiss()
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .foregroundColor(.white)
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    CurrencySelectionView(source: .constant(.silverPiece), target: .constant(.goldPiece))
}
