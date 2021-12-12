//
//  FCRoundedCorner.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/12/21.
//

import SwiftUI

struct FCRoundedCorner: Shape {
    // MARK: - Properties
    var radius  : CGFloat
    var corners : UIRectCorner
    
    // MARK: - Methods
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
