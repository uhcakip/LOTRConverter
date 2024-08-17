//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/2.
//

import SwiftUI
import Inject
import TipKit

struct ContentView: View {
    @ObserveInjection var inject

    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftCurrency = CurrencyModel.silverPiece
    @State var rightCurrency = CurrencyModel.goldPiece
    @State var leftAmount = ""
    @State var rightAmount = ""
    @FocusState var leftAmountTyping
    @FocusState var rightAmountTyping

    var body: some View {
        ZStack {
            // FIXME: use static property for asset catalog images
            Image("Background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image("PrancingPony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)

                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .focused($leftAmountTyping)
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }

                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($rightAmountTyping)
                    }
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
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfoView()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrencyView(source: $leftCurrency, target: $rightCurrency)
        }
        .enableInjection()
    }
}

#Preview {
    ContentView()
}
