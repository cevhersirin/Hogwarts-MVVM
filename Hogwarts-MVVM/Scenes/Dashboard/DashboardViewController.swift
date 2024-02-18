//
//  DashboardViewController.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 17.02.2024.
//

import UIKit

class DashboardViewController: BaseViewController<DashboardViewModel> {
    
    private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.register(ListItemCollectionViewCell.self, forCellWithReuseIdentifier: ListItemCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       return collectionView
    }()
    
    private var cellWidth = Screen.halfWidth - 15
    private var cellHeight = CGFloat(300)

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        viewModel.getCharacterList()
        addSubviews()
        configureContents()
        
        title = "All Characters"
        var image = UIImage.icList.resizeImage(targetSize: .init(width: 20, height: 20))
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image , style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func subscribeViewModel() {
        viewModel.getDataSuccess = { [weak self] in
            guard let self else { return }
            collectionView.reloadData()
        }
    }
}

//MARK: UI
extension DashboardViewController {
    
    private func addSubviews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: false)
    }
}

//MARK: Configure
extension DashboardViewController {
    
    private func configureContents() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: CollectionView DataSource
extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCharacterCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let character = viewModel.getCharacter(indexPath: indexPath) else { return UICollectionViewCell() }
        let cell: ListItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellModel = ListItemCellViewModel(id: character.id, name: character.name, imageUrl: character.image, isAlive: character.alive)
        cell.setCell(viewModel: cellModel)
        return cell
    }
}

//MARK: CollectionView Delegate
extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCharacter = viewModel.getCharacter(indexPath: indexPath) else { return }
        guard let id = selectedCharacter.id else { return }
        // TODO: Route to Detail
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            // TODO: ConfigureContextMenu if needed
        return nil
    }
}

//MARK: CollectionView FlowLayout
extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
