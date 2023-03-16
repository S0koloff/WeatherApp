//
//  TableViewCell24Hour.swift
//  WeatherApp
//
//  Created by Sokolov on 09.03.2023.
//

import UIKit

class TableViewCell24Hour: UITableViewCell {
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.attributedText = NSAttributedString(string: "Подробнее на 24 часа", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(CollectionViewCell24Hours.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.title.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 22),
            self.collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}

extension TableViewCell24Hour: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private enum Constants {
        static let numberOfItemsInLine: CGFloat = 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell24Hours
        
        
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 0.67, green: 0.74, blue: 0.92, alpha: 1.00).cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 42, height: 84)
    }
}
