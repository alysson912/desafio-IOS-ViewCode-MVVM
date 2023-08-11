//
//  CalendarScreen.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 09/08/23.
//

import UIKit

protocol ListScreenDelegate: AnyObject {
    func tappedCloseButton()
}

class ListScreen: UIView {
    
    private var delegate: ListScreenDelegate?
    
    public func delegate(delegate: ListScreenDelegate?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.tintColor = .white
        btn.setImage(UIImage(systemName: LC.backButtonImage.text), for: .normal)
        btn.backgroundColor = .clear//UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return btn
    }()
    @objc func tappedCloseButton(){
        delegate?.tappedCloseButton()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // retirando linhas
        tableView.showsVerticalScrollIndicator = false // desativando scrool indicator
        // TO DO: Register
        tableView.register(HolidayListTableViewCell.self, forCellReuseIdentifier: HolidayListTableViewCell.identifier)
        tableView.backgroundColor = .white //UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        return tableView
    }()
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    
    private func addViews(){
        
        addSubview(backButton)
        addSubview(tableView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .cyan
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 45),
            backButton.widthAnchor.constraint(equalToConstant: 45),
            
            
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            tableView.heightAnchor.constraint(equalToConstant: 550)
        ])
        
    }
    
}
