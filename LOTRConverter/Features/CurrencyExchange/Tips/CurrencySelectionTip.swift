//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Yuna Chou on 2024/8/18.
//

import Foundation
import TipKit

struct CurrencySelectionTip: Tip {
    var title = Text("Change Currency")

    var message: Text? = Text("You can tap left or right currency icon to bring up the Select Currency screen.")
}
