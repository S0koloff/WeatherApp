//
//  DayWeatherSetup.swift
//  WeatherApp
//
//  Created by Sokolov on 08.03.2023.
//

import UIKit

struct DayWeather: Decodable {
    var cloud_pct: Int
    var temp: Int
    var feels_like: Int
    var humidity: Int
    var min_temp: Int
    var max_temp: Int
    var wind_speed: Double
    var sunrise: Int
    var sunset: Int
}

func setupDayWeather(for city: String, completion: ((_ dayWeather: DayWeather?, _ errorText: String?) -> Void)?) {
    
    let headers = [
        "X-RapidAPI-Key": "3d815f22e5msh31ebe20761d5985p193775jsn6e0950fbf089",
        "X-RapidAPI-Host": "weather-by-api-ninjas.p.rapidapi.com"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://weather-by-api-ninjas.p.rapidapi.com/v1/weather?city="+city)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
        
        if let error {
            print(error)
            return
        }
        
        let statusCodde = (response as? HTTPURLResponse)?.statusCode
        if statusCodde != 200 {
            print("Error of status code", statusCodde as Any)
            return
        }
        
        guard let data else {
            print("Error of data")
            completion?(nil, "Error of data")
            return
        }
        
        do {
            let dayWeather = try JSONDecoder().decode(DayWeather.self, from: data)
            completion?(dayWeather, nil)
        } catch {
            print(error)
            completion?(nil, error.localizedDescription)
        }
    })
    
    dataTask.resume()
    
}

