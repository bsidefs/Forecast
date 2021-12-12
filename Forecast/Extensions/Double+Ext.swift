//
//  Double+Ext.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/11/21.
//

import Foundation

extension Double {
    func formatAsRoundedIntString() -> String {
        let rounded = self.rounded()
        return String(format: "%.0f", rounded)
    }
}
