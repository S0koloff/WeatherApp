//
//  CollectionViewCell30Days.swift
//  WeatherApp
//
//  Created by Sokolov on 15.03.2023.
//

import UIKit

class CollectionViewCell30Days: UICollectionViewCell {
    
    private lazy var date: UILabel = {
        let date = UILabel()
        date.textColor = .systemGray
        date.text = "21/04"
        date.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    private lazy var humidity: UILabel = {
        let humidity = UILabel()
        humidity.textColor = UIColor(red: 0.13, green: 0.31, blue: 0.78, alpha: 1.00)
        humidity.text = "57%"
        humidity.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        humidity.translatesAutoresizingMaskIntoConstraints = false
        return humidity
    }()
    
    private lazy var weatherDescription: UILabel = {
        let weatherDescription = UILabel()
        weatherDescription.textColor = .black
        weatherDescription.text = "Облачно"
        weatherDescription.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        weatherDescription.translatesAutoresizingMaskIntoConstraints = false
        return weatherDescription
    }()
    
    private lazy var lowHightTemp: UILabel = {
        let lowHightTemp = UILabel()
        lowHightTemp.textColor = .black
        lowHightTemp.text = "4°-11°"
        lowHightTemp.textAlignment = .right
        lowHightTemp.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lowHightTemp.translatesAutoresizingMaskIntoConstraints = false
        return lowHightTemp
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "smallRain")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(self.date)
        self.contentView.addSubview(self.humidity)
        self.contentView.addSubview(self.weatherDescription)
        self.contentView.addSubview(self.lowHightTemp)
        self.contentView.addSubview(self.image)
        
        NSLayoutConstraint.activate([
            
            self.date.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6),
            self.date.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.date.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -281),
            
            self.humidity.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 34),
            self.humidity.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 30),
            self.humidity.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -291),
            
            self.image.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30),
            self.image.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 6),
//            self.image.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -291),
            
            self.weatherDescription.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.weatherDescription.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.weatherDescription.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 72),
            self.weatherDescription.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -72),
            
            self.lowHightTemp.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.lowHightTemp.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 275),
            self.lowHightTemp.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -26),
            
        ])
    }
    
}
