//
//  HourlyWeatherSetupV2.swift
//  WeatherApp
//
//  Created by Sokolov on 16.03.2023.
//

import Foundation


struct DaysSetupData: Decodable {
    var hourly: HourlyDataSetup
}

struct HourlyDataSetup: Decodable {
    var data: [HourlyData]
}

struct HourlyData: Decodable {
    var date: String
    var temperature: Float
}

func setupHourlyTempV2(for lat: String, long: String, completion: ((_ daysData: DaysSetupData?, _ errorText: String?) -> Void)?) {
    let headers = [
        "X-RapidAPI-Key": "3d815f22e5msh31ebe20761d5985p193775jsn6e0950fbf089",
        "X-RapidAPI-Host": "ai-weather-by-meteosource.p.rapidapi.com"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://ai-weather-by-meteosource.p.rapidapi.com/hourly?lat=55.7823547&lon=49.1242266&timezone=auto&language=en&units=metric")! as URL,
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
            let daysData = try JSONDecoder().decode(DaysSetupData.self, from: data)
            completion?(daysData, nil)
        } catch {
            print(error)
            completion?(nil, error.localizedDescription)
        }
    })
    
    dataTask.resume()
}
