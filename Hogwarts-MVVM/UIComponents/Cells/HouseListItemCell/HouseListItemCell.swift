//
//  HouseListItemCell.swift
//  Hogwarts-MVVM
//
//  Created by Cevher Şirin on 19.02.2024.
//

import Kingfisher

class HouseListItemCell: UICollectionViewCell, ReusableView {
    
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
        imageView.contentMode = .scaleAspectFill
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
extension HouseListItemCell {
    
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
        informationsStackView.topToBottom(of: contentStackView).constant = -10
        informationsStackView.edgesToSuperview(excluding: .top)
        informationsStackView.height(30)
        addDisplayNameLabe()
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
extension HouseListItemCell {
    
    public func setCell(viewModel: HouseListItemModel) {
        nameLabel.text = viewModel.name
        guard let house = viewModel.house else { return }
        switch house {
        case .gryffindor:
            imageView.image = .imgGryffindor
        case .hufflepuff:
            imageView.image = .imgHufflepuff
        case .ravenclaw:
            imageView.image = .imgRavenclaw
        case .slytherin:
            imageView.image = .imgSlytherin
        case .none:
            break
        }
    }
}

