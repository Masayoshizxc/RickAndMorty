//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit
import SnapKit

class CharactersView: UIView {
    
    lazy var title: UILabel = {
        let l = UILabel()
        l.textColor != .systemBackground
        l.font = .boldSystemFont(ofSize: 32)
        l.text = "Characters"
        return l
    }()
    
    lazy var characterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionViewCell.self)
        cv.backgroundColor = .systemBackground
//        cv.backgroundColor = .systemPurple
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CharactersView {
    func setupSubviews() {
        addSubviews(
            title,
            characterCollectionView
        )
    }
    
    func setupConstraints() {
        title.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(76.5)
        }
        characterCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(80)
        }
    }
}
