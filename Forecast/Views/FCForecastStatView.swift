//
//  FCForecastStatView.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/12/21.
//

import SwiftUI

struct FCForecastStatView: View {
    let imageName   : String
    let stat        : String
    let value       : String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(stat)
                    .font(.caption)
                Text(value)
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
        .foregroundColor(.fcBackgroundColor)
    }
}

struct FCForecastStatView_Previews: PreviewProvider {
    static var previews: some View {
        FCForecastStatView(imageName: "thermometer", stat: "Feels like", value: "50°")
    }
}
