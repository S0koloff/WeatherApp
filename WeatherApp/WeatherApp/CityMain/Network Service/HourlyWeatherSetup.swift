//
//  HourlyWeatherSetup.swift
//  WeatherApp
//
//  Created by Sokolov on 10.03.2023.
//

import UIKit

struct HourlyWeatherData: Decodable {
    var time: String
    var temp: Float
}

struct DaysData: Decodable {
    var data: [HourlyWeatherData]
}



func setupHourlyTemp(for lat: String, long: String, currentDate: String, completion: ((_ daysData: DaysData?, _ errorText: String?) -> Void)?) {
    
    let headers = [
        "X-RapidAPI-Key": "3d815f22e5msh31ebe20761d5985p193775jsn6e0950fbf089",
        "X-RapidAPI-Host": "meteostat.p.rapidapi.com"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://meteostat.p.rapidapi.com/point/hourly?lat=\(lat)&lon=\(long)&start=\(currentDate)&end=\(currentDate)&alt=113&tz=Europe%2FMoscow")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error  in
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
            let daysData = try JSONDecoder().decode(DaysData.self, from: data)
            completion?(daysData, nil)
        } catch {
            print(error)
            completion?(nil, error.localizedDescription)
        }
    })
    
    dataTask.resume()
    
}
