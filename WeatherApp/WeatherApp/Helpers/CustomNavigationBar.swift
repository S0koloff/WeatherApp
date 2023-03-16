//
//  CustomNavigationBar.swift
//  WeatherApp
//
//  Created by Sokolov on 06.03.2023.
//

import UIKit

extension UIViewController {
    
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = .black
    }
    
    func createCustomTitleView(city: String, country: String) -> UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let cityLabel = UILabel()
        cityLabel.font = UIFont.systemFont(ofSize: 16)
        cityLabel.text = city
        
        let countryLabel = UILabel()
        countryLabel.font = UIFont.systemFont(ofSize: 16)
        countryLabel.text = country
        
        let locationInfoLabel = UILabel()
        locationInfoLabel.font = UIFont.boldSystemFont(ofSize: 19)
        locationInfoLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 33)
        locationInfoLabel.center = view.center
        locationInfoLabel.textColor = .black
        locationInfoLabel.text = "\(cityLabel.text ?? ""),\(countryLabel.text ?? "")"
        
        view.addSubview(locationInfoLabel)
        
        return view
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        
        return menuBarItem
    }
}
