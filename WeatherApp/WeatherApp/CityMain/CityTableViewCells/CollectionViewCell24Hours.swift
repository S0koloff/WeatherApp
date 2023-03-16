//
//  CollectionViewCell24Hours.swift
//  WeatherApp
//
//  Created by Sokolov on 10.03.2023.
//

import UIKit

class CollectionViewCell24Hours: UICollectionViewCell {
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var time: UILabel = {
        let time = UILabel()
        time.textColor = .black
        time.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        time.textAlignment = .center
        time.text = "12:00"
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    private lazy var temp: UILabel = {
        let temp = UILabel()
        temp.textColor = .black
        temp.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        temp.textAlignment = .center
        temp.text = "23°"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        
        let currentDateTime = Date()
        let formatterForDate = DateFormatter()
        formatterForDate.locale = Locale(identifier: "ru_RU")
        formatterForDate.timeStyle = .none
        formatterForDate.dateStyle = .short
        
        timeToArray(lat: "55.7823547", lon: "49.1242266")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(self.view)
        self.view.addSubview(self.time)
        self.view.addSubview(self.temp)
        self.view.addSubview(self.image)
        
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
            self.image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.time.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 12),
            self.time.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 2),
            self.time.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -2),

            self.temp.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -12),
            self.temp.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5),
            self.temp.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -4),
        ])
    }
    
    func timeToArray(lat: String, lon: String) {
        setupHourlyTempV2(for: lat, long: lon) { daysData, errorText in
            DispatchQueue.main.async {
                print("TIME V2:", daysData?.hourly as Any)
            }
        }
    }
}
