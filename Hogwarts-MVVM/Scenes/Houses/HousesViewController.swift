//
//  HousesViewController.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

import UIKit

class HousesViewController: BaseViewController<HousesViewModel> {
    
    private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.register(HouseListItemCell.self, forCellWithReuseIdentifier: HouseListItemCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       return collectionView
    }()
    
    private var cellWidth = Screen.halfWidth - 15
    private var cellHeight = CGFloat(300)

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        addSubviews()
        configureContents()
        
        title = "Houses"
        var image = UIImage.icList.resizeImage(targetSize: .init(width: 20, height: 20))
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image , style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func subscribeViewModel() {
        viewModel.getDataSuccess = { [weak self] in
            guard let self else { return }
            self.routeToList(characterList: viewModel.characterList)
        }
    }
}

//MARK: UI
extension HousesViewController {
    
    private func addSubviews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: false)
    }
}

//MARK: Configure
extension HousesViewController {
    
    private func configureContents() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func getCharacterList(house: House?) {
        guard let house = house else { return }
        viewModel.getCharacterList(house: house)
    }
    
    private func routeToList(characterList: [CharModel]?) {
        let houseName = viewModel.selectedHouse?.rawValue ?? ""
        let viewModel = DashboardViewModel(list: characterList, title: "\(houseName) Characters")
        let vc = DashboardViewController(viewModel: viewModel)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: CollectionView DataSource
extension HousesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getHousesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let house = viewModel.getHouse(indexPath: indexPath) else { return UICollectionViewCell() }
        let cell: HouseListItemCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellModel = HouseListItemModel(name: house.rawValue, house: house)
        cell.setCell(viewModel: cellModel)
        return cell
    }
}

//MARK: CollectionView Delegate
extension HousesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedHouse = viewModel.getHouse(indexPath: indexPath) else { return }
        viewModel.setSelectedHouse(indexPath: indexPath)
        getCharacterList(house: selectedHouse)
        // TODO: Route to Detail
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            // TODO: ConfigureContextMenu if needed
        return nil
    }
}

//MARK: CollectionView FlowLayout
extension HousesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
