//
//  CollectionViewCell.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit
import SnapKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
//    static let reuseID = "cell"
    
    lazy var image: UIImageView = {
        let i = UIImageView()
        
        return i
    }()
    
    lazy var name: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor != .systemBackground
        l.textAlignment = .center
        l.numberOfLines = 0
        
        return l
    }()
    
    lazy var status: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 14)
        l.textColor  = .gray
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(model: Characters) {
        image.kf.setImage(with: URL(string: model.image ?? ""))
        name.text = model.name
        if let st = model.status {
            
            status.text = "Status: \(st)"
        }
        
    }
    
    private func setupShadow() {
            // Настройка тени самой ячейки
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowRadius = 6
            layer.masksToBounds = false

            // Чтобы тень повторяла форму
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
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
            make.bottom.equalToSuperview().inset(80)
        }
        name.snp.makeConstraints{make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(6)
        }
        status.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(6)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

