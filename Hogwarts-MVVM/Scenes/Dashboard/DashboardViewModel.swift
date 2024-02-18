//
//  DashboardViewModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 17.02.2024.
//

import Alamofire

class DashboardViewModel: BaseViewModel {
    
    
    func getCharacterList() {
        showLoading?()
        let url = Endpoints.shared.allCharactersUrl
        
        AF.request(url).validate().responseDecodable(of: [CharModel].self) { [weak self] result in
            guard let self else { return }
            hideLoading?()
            switch result.result {
            case .success(let response):
                print(response.first?.name)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
