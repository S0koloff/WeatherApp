//
//  TableViewCell30Days.swift
//  WeatherApp
//
//  Created by Sokolov on 15.03.2023.
//

import UIKit

class TableViewCell30Days: UITableViewCell {
    
    private lazy var titleleft: UILabel = {
        let titleleft = UILabel()
        titleleft.text = "Ежедневный прогноз"
        titleleft.textColor = .black
        titleleft.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleleft.translatesAutoresizingMaskIntoConstraints = false
        return titleleft
    }()
    
    private lazy var titleright: UILabel = {
        let titleright = UILabel()
        titleright.textColor = .black
        titleright.attributedText = NSAttributedString(string: "25 дней", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        titleright.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        titleright.translatesAutoresizingMaskIntoConstraints = false
        return titleright
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(CollectionViewCell30Days.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
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
        
        self.contentView.addSubview(self.titleright)
        self.contentView.addSubview(self.titleleft)
        self.contentView.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.titleleft.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleleft.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            
            self.titleright.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleright.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 22),
            self.collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
}

extension TableViewCell30Days: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private enum Constants {
        static let numberOfItemsInLine: CGFloat = 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell30Days
        
        cell.backgroundColor = UIColor(red: 0.91, green: 0.93, blue: 0.98, alpha: 1.00)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        
        let width = collectionView.frame.width - (Constants.numberOfItemsInLine - 1) * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / Constants.numberOfItemsInLine)
        
        return CGSize(width: itemWidth, height: 65)
    }
}

