//
//  HolidayListTableViewCellScreen.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 10/08/23.
//

import UIKit

class HolidayListTableViewCellScreen: UIView {

    
    lazy var holidayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "holiday"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
 
        return label
    }()
    
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "country"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private func addViews(){
        addSubview(holidayLabel)
        addSubview(countryLabel)
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate( [
            
            holidayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            holidayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            countryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: holidayLabel.trailingAnchor, constant: 10),
            countryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    
  
}
