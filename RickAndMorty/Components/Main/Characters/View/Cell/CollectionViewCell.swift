//
//  CollectionViewCell.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "cell"
    
    lazy var image: UIImageView = {
        let i = UIImageView()
        
        return i
    }()
    
    lazy var name: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor != .systemBackground
        l.textAlignment = .center
        return l
    }()
    
    lazy var status: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 12)
        l.textColor  = .gray
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 16
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewCell {
    func setupSubviews() {
        contentView.addSubviews(
            image,
            name,
            status
        )
    }
    func setupConstraints() {
        image.snp.makeConstraints{make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        name.snp.makeConstraints{make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
        }
        status.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(16)
            make.top.equalTo(name.snp.bottom).offset(28)
        }
    }
}

