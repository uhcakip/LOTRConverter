//
//  CurrencyIconView.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/8.
//

import SwiftUI

struct CurrencyIconView: View {
    let image: ImageResource
    let name: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(image)
                .resizable()
                .scaledToFit()

            Text(name)
                .font(.caption)
                .padding(3)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25) // equivalent to .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIconView(image: .copperPenny, name: "Copper Penny")
}
