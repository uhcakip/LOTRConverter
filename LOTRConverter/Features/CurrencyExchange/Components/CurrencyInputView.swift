//
//  CurrencyLabelView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/19.
//

import SwiftUI
import TipKit

struct CurrencyInputView: View {
    let isLeftCurrency: Bool
    let currency: CurrencyModel
    @Binding var showSelectCurrency: Bool
    @Binding var amount: String
    @FocusState.Binding var isAmountTyping: Bool

    var body: some View {
        VStack {
            HStack {
                if isLeftCurrency {
                    currencyImage
                    currencyName
                } else {
                    currencyName
                    currencyImage
                }
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .if(isLeftCurrency) { view in
                view.popoverTip(CurrencySelectionTip(), arrowEdge: .bottom)
            }

            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(isLeftCurrency ? .leading : .trailing)
                .focused($isAmountTyping)
        }
    }

    private var currencyImage: some View {
        Image(currency.image)
            .resizable()
            .scaledToFit()
            .frame(height: 33)
    }

    private var currencyName: some View {
        Text(currency.name)
            .font(.headline)
            .foregroundStyle(.white)
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

#Preview {
    CurrencyInputView(
        isLeftCurrency: true,
        currency: .silverPiece,
        showSelectCurrency: .constant(false),
        amount: .constant(""),
        isAmountTyping: FocusState<Bool>().projectedValue
    )
    .border(.black, width: 1)
}


