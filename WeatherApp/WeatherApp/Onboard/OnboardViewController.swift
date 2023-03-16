//
//  OnboardViewController.swift
//  WeatherApp
//
//  Created by Sokolov on 06.03.2023.
//

import UIKit
import CoreLocation

class OnboardViewController: UIViewController {
    
    private lazy var girlImage: UIImageView = {
        let girlImage = UIImageView()
        girlImage.image = ConstansOnboard.girlImage
        girlImage.contentMode = .scaleAspectFit
        girlImage.translatesAutoresizingMaskIntoConstraints = false
        return girlImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ConstansOnboard.titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var descriptionLabel1: UILabel = {
        let descriptionLabel1 = UILabel()
        descriptionLabel1.text = ConstansOnboard.description1
        descriptionLabel1.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel1.numberOfLines = 0
        descriptionLabel1.textAlignment = .center
        descriptionLabel1.textColor = .white
        descriptionLabel1.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel1
    }()
    
    private lazy var descriptionLabel2: UILabel = {
        let descriptionLabel2 = UILabel()
        descriptionLabel2.text = ConstansOnboard.description2
        descriptionLabel2.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel2.numberOfLines = 0
        descriptionLabel2.textAlignment = .center
        descriptionLabel2.textColor = .white
        descriptionLabel2.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel2
    }()
    
    private lazy var editButtonTrue: UIButton = {
        let editButtonTrue = UIButton()
        editButtonTrue.addTarget(self, action: #selector(self.trueButtonAction), for: .touchUpInside)
        editButtonTrue.setTitle(ConstansOnboard.buttonTrue, for: .normal)
        editButtonTrue.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        editButtonTrue.backgroundColor = UIColor(red: 0.95, green: 0.43, blue: 0.07, alpha: 1.00)
        editButtonTrue.layer.cornerRadius = 10
        editButtonTrue.clipsToBounds = true
        editButtonTrue.translatesAutoresizingMaskIntoConstraints = false
        return editButtonTrue
    }()
    
    private lazy var editButtonFalse: UILabel = {
        let editButtonFalse = UILabel()
        editButtonFalse.text = ConstansOnboard.buttonFalse
        editButtonFalse.textColor = .white
        editButtonFalse.font = UIFont.systemFont(ofSize: 16)
        editButtonFalse.textAlignment = .right
        editButtonFalse.translatesAutoresizingMaskIntoConstraints = false
        return editButtonFalse
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.13, green: 0.31, blue: 0.78, alpha: 1.00)
        setupView()
        
        falseTapSetup()
    }
    
    private func setupView() {
        self.view.addSubview(self.girlImage)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.descriptionLabel1)
        self.view.addSubview(self.descriptionLabel2)
        self.view.addSubview(self.editButtonTrue)
        self.view.addSubview(self.editButtonFalse)
        
        
        NSLayoutConstraint.activate([

            self.girlImage.topAnchor.constraint(equalTo: girlImage.bottomAnchor, constant: -220),
            self.girlImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 117),
            self.girlImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -90),
            self.girlImage.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: -20),
            
            self.titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 27),
            self.titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -27),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel1.topAnchor, constant: -45),
            
            self.descriptionLabel1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 27),
            self.descriptionLabel1.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -27),
            self.descriptionLabel1.bottomAnchor.constraint(equalTo: self.descriptionLabel2.topAnchor, constant: -30),
            
            self.descriptionLabel2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 27),
            self.descriptionLabel2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -27),
            self.descriptionLabel2.bottomAnchor.constraint(equalTo: self.editButtonTrue.topAnchor, constant: -45),
            
            self.editButtonTrue.topAnchor.constraint(equalTo: self.editButtonTrue.bottomAnchor, constant: -45),
            self.editButtonTrue.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18),
            self.editButtonTrue.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18),
            self.editButtonTrue.bottomAnchor.constraint(equalTo: self.editButtonFalse.topAnchor, constant: -20),
            
            self.editButtonFalse.topAnchor.constraint(equalTo: self.editButtonFalse.bottomAnchor, constant: -28),
            self.editButtonFalse.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 66),
            self.editButtonFalse.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18),
            self.editButtonFalse.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40),
            
        ])
        
    }
    override func viewDidAppear(_ animated: Bool) {
        falseTapSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        falseTapSetup()
    }
    
    private func falseTapSetup() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.falseButtonAction(_:)))
        self.editButtonFalse.isUserInteractionEnabled = true
        self.editButtonFalse.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func trueButtonAction() {
        
        UserDefaults.standard.set(true, forKey: "LocationActivated")
        
        let vc = CityViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("click calck")
        dismiss(animated: true)
    }
    
    @objc private func falseButtonAction(_ sender: UITapGestureRecognizer) {
        
        UserDefaults.standard.set(false, forKey: "LocationActivated")
        
        let vc = CityViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("click 333")
        dismiss(animated: true)
    }
    
}
