//
//  DashboardViewModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 17.02.2024.
//

import Alamofire

class DashboardViewModel: BaseViewModel {
    
    var list: [CharModel]? = []
    public var getDataSuccess: VoidClosure?
    
    func getCharacterList() {
        showLoading?()
        let url = Endpoints.shared.allCharactersUrl
        AF.request(url).validate().responseDecodable(of: [CharModel].self) { [weak self] result in
            guard let self else { return }
            hideLoading?()
            switch result.result {
            case .success(let response):
                self.list = response
                self.getDataSuccess?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCharacterCount() -> Int {
        return list?.count ?? 0
    }
    
    func getCharacter(indexPath: IndexPath) -> CharModel? {
        guard let character = list?[indexPath.row] else { return nil }
        return character
    }
    
    func getCharacterId(indexPath: IndexPath) -> String? {
        guard let character = list?[indexPath.row] else { return nil }
        return character.id
    }
}
