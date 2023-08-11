//
//  MenuProfileService.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 31/07/23.
//

import UIKit
import Alamofire

protocol MenuProfileServiceDelegate: GenericService {
    func getMenuFromJson(completion: @escaping completion <PurpleData?>)
}

class MenuProfileService: MenuProfileServiceDelegate {
  
    func getMenuFromJson(completion: @escaping completion <PurpleData?>){
        let url: String = "https://date.nager.at/api/v3/PublicHolidays/2023/AT"
        
        AF.request(url, method: .get).validate().responseDecodable ( of: PurpleData.self){ response in
            print(#function)
            debugPrint(response)
            switch response.result {
            case .success(let success):
                print("success -> \(#function)")
                completion(success, nil)
                
            case .failure(let error):
                print("error  -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
        
    }
}
