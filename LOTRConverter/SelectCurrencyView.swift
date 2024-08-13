//
//  SelectCurrencyView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/7.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var from: CurrencyModel
    @Binding var to: CurrencyModel

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .scaleEffect(1.1)
                .ignoresSafeArea()

            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)

                CurrencyIconGridView(currency: $from)

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)

                CurrencyIconGridView(currency: $to)

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
    SelectCurrencyView(from: .constant(.silverPiece), to: .constant(.goldPiece))
}
