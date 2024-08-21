//
//  CurrencyExchangeView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/2.
//

import SwiftUI
import Inject
import TipKit

struct CurrencyExchangeView: View {
    @ObserveInjection var inject
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftCurrency = CurrencyModel.silverPiece
    @State var rightCurrency = CurrencyModel.goldPiece
    @State var leftAmount = ""
    @State var rightAmount = ""
    @FocusState var leftAmountTyping
    @FocusState var rightAmountTyping

    init() {
        let savedSelections = UserDefaults.loadCurrencySelections()
        _leftCurrency = State(initialValue: savedSelections.left)
        _rightCurrency = State(initialValue: savedSelections.right)
    }

    var body: some View {
        ZStack {
            BackgroundView(type: .main)

            VStack {
                Image(.prancingPony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                HStack {
                    CurrencyInputView(
                        isLeftCurrency: true,
                        currency: leftCurrency,
                        showSelectCurrency: $showSelectCurrency,
                        amount: $leftAmount,
                        isAmountTyping: $leftAmountTyping
                    )

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    CurrencyInputView(
                        isLeftCurrency: false,
                        currency: rightCurrency,
                        showSelectCurrency: $showSelectCurrency,
                        amount: $rightAmount,
                        isAmountTyping: $rightAmountTyping
                    )
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)

                Spacer()

                HStack {
                    Spacer()

                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftAmountTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightAmountTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            UserDefaults.saveCurrencySelections(left: leftCurrency, right: rightCurrency)
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            UserDefaults.saveCurrencySelections(left: leftCurrency, right: rightCurrency)
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .onTapGesture {
            leftAmountTyping = false
            rightAmountTyping = false
        }
        .sheet(isPresented: $showExchangeInfo) {
            CurrencyExchangeInfoView()
        }
        .sheet(isPresented: $showSelectCurrency) {
            CurrencySelectionView(source: $leftCurrency, target: $rightCurrency)
        }
        .enableInjection()
    }
}

#Preview {
    CurrencyExchangeView()
}
