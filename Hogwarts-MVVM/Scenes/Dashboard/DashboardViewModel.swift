//
//  DashboardViewModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 17.02.2024.
//

import Alamofire

class DashboardViewModel: BaseViewModel {
    
    var list: [CharModel]? = []
    var title: String = ""
    var getDataSuccess: VoidClosure?
    
    init(list: [CharModel]? = nil, getDataSuccess: VoidClosure? = nil, title: String = "") {
        self.list = list
        self.getDataSuccess = getDataSuccess
        self.title = title
    }
    
    func getCharacterList() {
        showLoading?()
        let url = Endpoints.shared.allCharactersUrl
        AF.request(url).validate().responseDecodable(of: [CharModel].self) { [weak self] result in
            guard let self else { return }
            hideLoading?()
            switch result.result {
            case .success(let response):
                if list == nil {
                    self.list = response
                    self.getDataSuccess?()
                }
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
