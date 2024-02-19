//
//  HousesViewModel.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

import Alamofire

class HousesViewModel: BaseViewModel {
    
    var characterList: [CharModel]? = []
    var houseList: [House] = [.gryffindor, .hufflepuff, .slytherin, .ravenclaw]
    var selectedHouse: House? = nil
    public var getDataSuccess: VoidClosure?
    
    func getCharacterList(house: House) {
        showLoading?()
        let url = Endpoints.shared.charactersByHouseUrl(house: house.rawValue)
        AF.request(url).validate().responseDecodable(of: [CharModel].self) { [weak self] result in
            guard let self else { return }
            hideLoading?()
            switch result.result {
            case .success(let response):
                self.characterList = response
                self.getDataSuccess?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getHousesCount() -> Int {
        return houseList.count
    }
    
    func getCharacters() -> [CharModel]? {
        return characterList
    }
    
    func getHouse(indexPath: IndexPath) -> House? {
        let house = houseList[indexPath.row]
        return house
    }
    
    func setSelectedHouse(indexPath: IndexPath) {
        selectedHouse = houseList[indexPath.item]
    }
}
