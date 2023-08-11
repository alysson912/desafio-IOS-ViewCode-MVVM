//
//  ViewController.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 09/08/23.
//

import UIKit

protocol HomeVCDelegate: AnyObject {
    func  getInputUser()
}

class HomeVC: UIViewController {
    
    private var screen: HomeScreen?
    private var viewModel = ListViewModel()
    
    
    private var delegate: HomeVCDelegate?
    
    public func delegate(delegate: HomeVCDelegate?){
        self.delegate = delegate
    }
    
    
    // levando input user para tela seguinte atraves de protocolo
    private var coutry, holiday: String?
    func getInputUser(coutry: String, holiday: String) {
        self.coutry = coutry
        self.holiday = holiday
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        viewModel.fetch(.request)
    }
    
    
}

extension HomeVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        self.loginScreen?.validarTextFields()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //print( "textFieldShouldReturn")
        textField.resignFirstResponder()
        
        return true
    }}

extension HomeVC: HomeScreenProtocol {
    func tappedButton() {
        let vc = ListVC()
        
        navigationController?.pushViewController(vc, animated: true )
    }
    
    
}
