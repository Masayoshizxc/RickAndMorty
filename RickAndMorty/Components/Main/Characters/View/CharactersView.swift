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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .systemBackground
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
            title
        )
    }
    
    func setupConstraints() {
        title.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(76.5)
        }
    }
}
