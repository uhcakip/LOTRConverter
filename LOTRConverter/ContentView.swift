//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/2.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""

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
                            Image("SilverPiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)

                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    VStack {
                        HStack {
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)

                            Image("GoldPiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)

                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)

                Spacer()

                HStack {
                    Spacer()

                    Button {
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
