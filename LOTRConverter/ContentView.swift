//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
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

                        // textfield
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

                        // textfield
                    }
                }

                Spacer()

                // info button
                Image(systemName: "info.circle")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
