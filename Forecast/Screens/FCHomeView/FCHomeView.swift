//
//  FCHomeView.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/9/21.
//

import SwiftUI

struct FCHomeView: View {
    @EnvironmentObject var locationManager  : FCLocationManager
    @StateObject var viewModel              = FCHomeViewModel(weatherManager: FCWeatherManager())
    
    private var todaysDate: String {
        return Date().formatted(.dateTime.month().day().hour().minute())
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if let forecast = viewModel.forecast {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(forecast.name)")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Today, \(todaysDate)")
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                                Text("\(forecast.weather.first?.status ?? "Status unavailable")")
                            }
                            Spacer()
                            Text(forecast.main.feelsLike.formatAsRoundedIntString() + "°")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                            .frame(height: 80)
                        
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                                .tint(.white)
                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .fontWeight(.medium)
                            .padding(.bottom)
                        HStack {
                            FCForecastStatView(imageName: "thermometer",
                                               stat: "Min temp",
                                               value: forecast.main.minTemp.formatAsRoundedIntString() + "°")
                            Spacer()
                            FCForecastStatView(imageName: "thermometer",
                                               stat: "Max temp",
                                               value: forecast.main.maxTemp.formatAsRoundedIntString() + "°")
                        }
                        HStack {
                            FCForecastStatView(imageName: "wind",
                                               stat: "Wind speed",
                                               value: forecast.wind.speed.formatAsRoundedIntString() + " m/s")
                            Spacer()
                            FCForecastStatView(imageName: "humidity",
                                               stat: "Humidity",
                                               value: forecast.main.humidity.formatAsRoundedIntString() + "%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .background(.white)
                    .foregroundColor(.fcBackgroundColor)
                    .cornered(radius: 10, corners: [.topLeft, .topRight])
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.fcBackgroundColor)
        .onAppear {
            viewModel.getCurrentWeather(latitude: locationManager.location?.latitude,
                                        longtitude: locationManager.location?.longitude)
        }
        .transition(.opacity)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct FCHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FCHomeView()
            .environmentObject(FCLocationManager())
            .preferredColorScheme(.dark)
    }
}
