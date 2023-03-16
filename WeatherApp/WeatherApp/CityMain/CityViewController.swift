//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Sokolov on 06.03.2023.
//

import UIKit

class CityViewController: UIViewController {
    
    var nameOfCity = "Moscow"
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray3
        pageControl.addTarget(self, action: #selector(pageControlTapAction(sender:)), for: .touchUpInside)
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
        
        private lazy var addCityView: UIView = {
            let addCityView = UIView()
            addCityView.backgroundColor = .white
            
            let plusButton = UIButton()
            plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
            plusButton.tintColor = .black
            plusButton.imageView?.contentMode = .scaleAspectFit
            plusButton.contentVerticalAlignment = .fill
            plusButton.contentHorizontalAlignment = .fill
            plusButton.frame = CGRect(x: 150, y: 250, width: 150, height: 150)
            plusButton.addTarget(self, action: #selector(newCityButtonAction), for: .touchUpInside)
            
            addCityView.addSubview(plusButton)
            return addCityView
        }()
        
        private lazy var cityViews = [addCityView]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            navigationController?.navigationBar.backgroundColor = .white
            setupView()
            
        }
        
        private func setupView() {
            self.view.addSubview(self.pageControl)
            self.view.addSubview(self.scrollView)
            
            createCustomNavigationBar()
            let locationButton = createCustomButton(imageName: "locationButton", selector: #selector(locationButtonAction))
            let settingsButton = createCustomButton(imageName: "settingsButton", selector: #selector(settingsButtonAction))
            let customTitleView = createCustomTitleView(city: "Moscow", country: "Russia")
            
            navigationItem.rightBarButtonItem = locationButton
            navigationItem.leftBarButtonItem = settingsButton
            navigationItem.titleView = customTitleView
            
            configScrollView()
            
            NSLayoutConstraint.activate([
                
                self.pageControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 95),
                self.pageControl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 45),
                self.pageControl.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -45),
                self.pageControl.bottomAnchor.constraint(equalTo: self.pageControl.topAnchor, constant: 15),
                
                
            ])
            
        }
    
    func createNewTableView() {
        
       let tableID = UITableView(frame: .zero, style: .grouped)
        tableID.backgroundColor = .white
        tableID.dataSource = self
        tableID.delegate = self
        tableID.rowHeight = UITableView.automaticDimension
        tableID.register(TableViewCell24Hour.self, forCellReuseIdentifier: "TableViewCell")
        tableID.register(CityDailyViewTable.self, forCellReuseIdentifier: "DayliCell")
        tableID.register(TableViewCell30Days.self, forCellReuseIdentifier: "TableViewCell30Days")
        tableID.separatorStyle = .none
        
        if self.cityViews.count == 1 {
            self.cityViews.insert(tableID, at: 0)
        } else {
            self.cityViews.insert(tableID, at: 1)
        }
        configScrollView()
        updatePageControl()
    }
        
        override func viewDidAppear(_ animated: Bool) {
            
            if UserDefaults.standard.bool(forKey: "LocationActivated") {
                locationActivateTrue()
            }
        }
        
        private func configScrollView() {
            scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(cityViews.count) + 1, height: scrollView.frame.size.height)
            
            for i in 0..<cityViews.count {
                scrollView.addSubview(cityViews[i])
                cityViews[i].frame = CGRect(x: view.frame.width * CGFloat(i), y:  0, width: view.frame.width, height: view.frame.height)
            }
            
            scrollView.constraintsTo(view: view)
        }
        
        private func updatePageControl() {
            self.pageControl.numberOfPages = cityViews.count
        }
        
        private func locationActivateTrue() {
            
           createNewTableView()
            configScrollView()
            updatePageControl()
        }
        
        
        @objc private func pageControlTapAction(sender: UIPageControl) {
            scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
        }
        
        @objc private func newCityButtonAction() {
            let alert = UIAlertController.init(title: "Город", message: "Напишите название города", preferredStyle: .alert)
            alert.addTextField { field in
                field.placeholder = "Moscow"
            }
            let cancel = UIAlertAction(title: "Закрыть", style: .cancel) { (alertAction) in }
            let add = UIAlertAction(title: "Добавить", style: .default) { (alertAction) in
                guard let field = alert.textFields else {
                    return
                }
                let city = field[0]
                
                guard let newcity = city.text, !newcity.isEmpty else {
                    return
                }
                
                self.nameOfCity = newcity
                self.createNewTableView()
                
            }
            alert.addAction(cancel)
            alert.addAction(add)
            self.present(alert, animated:true, completion: nil)
            
            print("newCity tap")
        }
    
    private func cityNameInfo(name: String) -> String {
        let cityName = name
        return cityName
    }
        
        @objc private func locationButtonAction() {
            let vc = OnboardViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            print("location")
        }
        
        @objc private func settingsButtonAction() {
            createNewTableView()
            print("settings")
        }
        
        override func viewWillAppear(_ animated: Bool) {
            updatePageControl()
        }
    }
    
extension CityViewController: UIScrollViewDelegate {
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
            pageControl.currentPage = Int(pageIndex)
        }
    }
    
extension CityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if section == 1 {
                return 1
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        } else {
            if indexPath.section == 1 {
                return 128
            } else {
                return 620
            }
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DayliCell", for: indexPath) as! CityDailyViewTable
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.cityVC = self
            cell.getCity(city: self.nameOfCity)
            return cell
        } else {
            if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell24Hour
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell30Days", for: indexPath) as! TableViewCell30Days
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                return cell
            }
        }
    }
}
