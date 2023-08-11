//
//  HolidayListTableViewCell.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 10/08/23.
//

import UIKit

class HolidayListTableViewCell: UITableViewCell {

      static  let identifier: String =  String(describing: HolidayListTableViewCell.self)

    private lazy var screen: HolidayListTableViewCellScreen = {
        let view = HolidayListTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private func configViews(){
        contentView.addSubview(screen)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
  
    
    public func setupCell(country: String, holiday: String){
        screen.countryLabel.text = country
        screen.holidayLabel.text = holiday
    }
}
 
