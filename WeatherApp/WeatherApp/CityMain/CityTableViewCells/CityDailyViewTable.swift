//
//  CityDailyViewTable.swift
//  WeatherApp
//
//  Created by Sokolov on 09.03.2023.
//

import UIKit

class CityDailyViewTable: UITableViewCell {

    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "dailyBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var minMaxTempOfDay: UILabel = {
        let minMaxTempOfDay = UILabel()
        minMaxTempOfDay.translatesAutoresizingMaskIntoConstraints = false
        minMaxTempOfDay.textColor = .white
        minMaxTempOfDay.font = UIFont.systemFont(ofSize: 18)
        minMaxTempOfDay.text = ".."
        minMaxTempOfDay.textAlignment = .center
        return minMaxTempOfDay
    }()
    
    private lazy var currentTemp: UILabel = {
        let currentTemp = UILabel()
        currentTemp.translatesAutoresizingMaskIntoConstraints = false
        currentTemp.textColor = .white
        currentTemp.font = UIFont.boldSystemFont(ofSize: 36)
        currentTemp.text = "..."
        currentTemp.textAlignment = .center
        return currentTemp
    }()
    
    private lazy var descritpion: UILabel = {
        let descritpion = UILabel()
        descritpion.translatesAutoresizingMaskIntoConstraints = false
        descritpion.textColor = .white
        descritpion.font = UIFont.systemFont(ofSize: 18)
        descritpion.text = "Возможен небольшой дождь"
        descritpion.textAlignment = .center
        return descritpion
    }()
    
    
    private lazy var clouds: UILabel = {
        let clouds = UILabel()
        clouds.translatesAutoresizingMaskIntoConstraints = false
        clouds.textColor = .white
        clouds.font = UIFont.systemFont(ofSize: 17)
        clouds.text = ".."
        clouds.textAlignment = .center
        return clouds
    }()
    
    
    private lazy var windSpeed: UILabel = {
        let windSpeed = UILabel()
        windSpeed.translatesAutoresizingMaskIntoConstraints = false
        windSpeed.textColor = .white
        windSpeed.font = UIFont.systemFont(ofSize: 17)
        windSpeed.text = ".."
        windSpeed.textAlignment = .center
        return windSpeed
    }()
    
    private lazy var humidity: UILabel = {
        let humidity = UILabel()
        humidity.translatesAutoresizingMaskIntoConstraints = false
        humidity.textColor = .white
        humidity.font = UIFont.systemFont(ofSize: 17)
        humidity.text = ".."
        humidity.textAlignment = .center
        return humidity
    }()
    
    private lazy var currentTimeAndDate: UILabel = {
        let currentTimeAndDate = UILabel()
        currentTimeAndDate.translatesAutoresizingMaskIntoConstraints = false
        currentTimeAndDate.textColor = .yellow
        currentTimeAndDate.font = UIFont.systemFont(ofSize: 18)
        currentTimeAndDate.text = ".."
        currentTimeAndDate.textAlignment = .center
        return currentTimeAndDate
    }()
    
    private lazy var sunrise: UILabel = {
        let sunrise = UILabel()
        sunrise.translatesAutoresizingMaskIntoConstraints = false
        sunrise.textColor = .white
        sunrise.font = UIFont.boldSystemFont(ofSize: 16)
        sunrise.text = "05:41"
        sunrise.textAlignment = .center
        return sunrise
    }()
    
    private lazy var sunset: UILabel = {
        let sunset = UILabel()
        sunset.translatesAutoresizingMaskIntoConstraints = false
        sunset.textColor = .white
        sunset.font = UIFont.boldSystemFont(ofSize: 16)
        sunset.text = "19:31"
        sunset.textAlignment = .center
        return sunset
    }()
    
    weak var cityVC: CityViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupView()
        self.setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(backgroundImage)
        self.contentView.addSubview(minMaxTempOfDay)
        self.contentView.addSubview(currentTimeAndDate)
        self.contentView.addSubview(descritpion)
        self.contentView.addSubview(currentTemp)
        self.contentView.addSubview(clouds)
        self.contentView.addSubview(windSpeed)
        self.contentView.addSubview(humidity)
        self.contentView.addSubview(sunrise)
        self.contentView.addSubview(sunset)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate ([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.backgroundImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            self.backgroundImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.minMaxTempOfDay.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 152),
            self.minMaxTempOfDay.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -148),
            self.minMaxTempOfDay.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -173),
            
            self.currentTemp.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 161),
            self.currentTemp.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -145),
            self.currentTemp.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -120),
            
            self.descritpion.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 59),
            self.descritpion.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -58),
            self.descritpion.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -90),
            
            self.currentTimeAndDate.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 97),
            self.currentTimeAndDate.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -90),
            self.currentTimeAndDate.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -12),
            
            self.clouds.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 100),
            self.clouds.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -230),
            self.clouds.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -54),
            
            self.windSpeed.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 145),
            self.windSpeed.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -120),
            self.windSpeed.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -54),
            
            self.humidity.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 212),
            self.humidity.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -30),
            self.humidity.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -54),
            
            self.sunset.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 320),
            self.sunset.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -2),
            self.sunset.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -26),
            
            self.sunrise.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 1),
            self.sunrise.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -310),
            self.sunrise.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -26),
            
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
//        avatarImage.clipsToBounds = true
        
    }
    
    func getCity(city: String) {
        setupTemp(city: city, currentTimeAndDate: currentTimeAndDate, minMaxTempOfDay: minMaxTempOfDay, currentTemp: currentTemp, clouds: clouds, windSpeed: windSpeed, humidity: humidity)
    }
    
    func setupTemp(city: String, currentTimeAndDate: UILabel, minMaxTempOfDay: UILabel, currentTemp: UILabel, clouds: UILabel, windSpeed: UILabel, humidity: UILabel ) {
        
        let currentDateTime = Date()
        
        let formatterForTime = DateFormatter()
        formatterForTime.locale = Locale(identifier: "ru_RU")
        formatterForTime.timeStyle = .short
        formatterForTime.dateStyle = .none
        
        let formatterForDate = DateFormatter()
        formatterForDate.locale = Locale(identifier: "ru_RU")
        formatterForDate.timeStyle = .none
        formatterForDate.dateStyle = .long
        
        currentTimeAndDate.text = "\(formatterForTime.string(from: currentDateTime)),  \(formatterForDate.string(from: currentDateTime))"
        
        setupDayWeather(for: city) { dayWeather, errorText in
            DispatchQueue.main.async {
                
                let minMaxTempT = "\(dayWeather?.min_temp ?? 0)°/ \(dayWeather?.max_temp ?? 0)°"
                let currentTempT = "\(dayWeather?.temp ?? 0)°"
                let cloudsT = "\(dayWeather?.cloud_pct ?? 0)"
                let windSpeedT = "\(dayWeather?.wind_speed ?? 0) мс"
                let humidityT = "\(dayWeather?.humidity ?? 0)%"
                
                minMaxTempOfDay.text = minMaxTempT
                currentTemp.text = currentTempT
                clouds.text = cloudsT
                windSpeed.text = windSpeedT
                humidity.text = humidityT

            }
        }
    }
}
