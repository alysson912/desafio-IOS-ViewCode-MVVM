//
//  CalendarVC.swift
//  desafioIOS
//
//

import UIKit

class ListVC: UIViewController {
    
    private var screen: ListScreen?
    
    override func loadView() {
        screen = ListScreen()
        view = screen
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen?.delegate(delegate: self)
        screen?.configTableView(delegate: self, dataSource: self)
    }


}
extension ListVC: ListScreenDelegate {
    func tappedCloseButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HolidayListTableViewCell.identifier, for: indexPath) as? HolidayListTableViewCell
        
    
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("cell clicada")
        let vc = HolidayDetailVC()
        //vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
