//
//  ListItemCollectionViewCell.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 18.02.2024.
//

import Kingfisher

class ListItemCollectionViewCell: UICollectionViewCell, ReusableView {
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .zero
        stackView.backgroundColor = .clear
        stackView.setTopCornerRadius(radius: 10)
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var informationsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = .zero
        stack.backgroundColor = .appTint
        stack.setBottomCornerRadius(radius: 10)
        stack.clipsToBounds = true
        return stack
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UI
extension ListItemCollectionViewCell {
    
    private func addSubviews() {
        backgroundColor = UIColorConstants.shared.backgroundColor
        self.setCornerRadius(radius: 10)
        addContentStackView()
        addInformationStack()
    }
    
    private func addContentStackView() {
        addSubview(contentStackView)
        contentStackView.edgesToSuperview(excluding: .bottom, insets: .left(0) + .top(0) + .right(0))
        addImageView()
    }
    
    private func addImageView() {
        contentStackView.addArrangedSubview(imageView)
    }
    
    private func addInformationStack() {
        addSubview(informationsStackView)
        informationsStackView.topToBottom(of: contentStackView)
        informationsStackView.edgesToSuperview(excluding: .top)
        informationsStackView.height(30)
        addDisplayNameLabe()
        addSpacer()
    }
    
    private func addDisplayNameLabe() {
        informationsStackView.addArrangedSubview(nameLabel)
    }
    
    private func addSpacer() {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        informationsStackView.addArrangedSubview(spacer)
    }
}

//MARK: Configure
extension ListItemCollectionViewCell {
    
    public func setCell(viewModel: ListItemCellViewModel) {
        if let imageUrl = viewModel.imageUrl, let url = URL(string: imageUrl) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = .imgDefault
            imageView.contentMode = .scaleAspectFill
        }
        nameLabel.text = viewModel.name
    }
}
