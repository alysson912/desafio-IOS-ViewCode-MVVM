//
//  MenuProfileViewModel.swift
//  desafioIOS
//
//  Created by ALYSSON DODO on 09/08/23.
//

import UIKit

enum TypeFetch {
    case request
    
}
protocol MenuProfileViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class MenuProfileViewModel {

    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    
    private  var data: [Datum] = []

    
    // TODO: CRIAR FUNC PARA LEVAR OS DADOS PARA CELL
    
    
   
    
    public func delegate(delegate: MenuProfileViewModelDelegate?){
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch){
        switch typeFetch {
            
        case .request:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.delegate?.success()
                    self.data = success
                }else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public func loadCurrent(indexPath: IndexPath) -> PurpleData {
        return data.filter { Datum in
            true
        }
    }
    
}
