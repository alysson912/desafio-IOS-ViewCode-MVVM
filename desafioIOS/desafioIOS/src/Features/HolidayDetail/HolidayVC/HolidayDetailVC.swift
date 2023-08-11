//
//  HolidayVC.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 10/08/23.
//

import UIKit

class HolidayDetailVC: UIViewController {

    private var screen: HolidayDetailScreen?
    
    override func loadView() {
        screen = HolidayDetailScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}
