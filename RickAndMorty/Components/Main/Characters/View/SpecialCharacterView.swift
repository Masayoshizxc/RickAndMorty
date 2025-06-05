//
//  SpecialCharacterView.swift
//  RickAndMorty
//
//  Created by Adilet on 5/6/25.
//

import UIKit
import SnapKit

class SpecialCharacterView: UIView {
    
    lazy var mainImage: UIImageView = {
        let i = UIImageView()
        
        return i
    }()
    
    lazy var statusBell: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "bell")
        i.tintColor = .systemBlue
        
        return i
    }()
    
    lazy var statusLabel: UILabel = {
        let l = UILabel()
        l.textColor != .systemBackground
        l.font = .systemFont(ofSize: 22)
        return l
    }()
    
    lazy var statusBtn: UIButton = {
        let b = UIButton()
        b.titleLabel?.textAlignment = .center
        b.setTitleColor(.systemBlue, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 24)
        b.backgroundColor = .customGray
        b.setTitle("STATUS".uppercased(), for: .normal)
        return b
    }()
    
    lazy var genderBell: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "bell")
        i.tintColor = .orange
        
        return i
    }()
    
    lazy var genderLabel: UILabel = {
        let l = UILabel()
        l.textColor != .systemBackground
        l.font = .systemFont(ofSize: 22)
        return l
    }()
    
    lazy var genderBtn: UIButton = {
        let b = UIButton()
        b.titleLabel?.textAlignment = .center
        b.setTitleColor(.orange, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 24)
        b.backgroundColor = .customGray
        b.setTitle("GENDER".uppercased(), for: .normal)
        return b
    }()
    
    lazy var typeBell: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "bell")
        i.tintColor = .purple
        
        return i
    }()
    
    lazy var typeLabel: UILabel = {
        let l = UILabel()
        l.textColor != .systemBackground
        l.font = .systemFont(ofSize: 22)
        return l
    }()
    
    lazy var typeBtn: UIButton = {
        let b = UIButton()
        b.titleLabel?.textAlignment = .center
        b.setTitleColor(.purple, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 24)
        b.backgroundColor = .customGray
        b.setTitle("TYPE".uppercased(), for: .normal)
        return b
    }()
    
    lazy var speciesBell: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "bell")
        i.tintColor = .green
        
        return i
    }()
    
    lazy var speciesLabel: UILabel = {
        let l = UILabel()
        l.textColor != .systemBackground
        l.font = .systemFont(ofSize: 22)
        return l
    }()
    
    lazy var speciesBtn: UIButton = {
        let b = UIButton()
        b.titleLabel?.textAlignment = .center
        b.setTitleColor(.green, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 24)
        b.backgroundColor = .customGray
        b.setTitle("SPECIES".uppercased(), for: .normal)
        return b
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

extension SpecialCharacterView {
    func setupSubviews() {
        addSubviews(
            mainImage,
            statusBell,
            statusLabel,
            statusBtn,
            genderBell,
            genderLabel,
            genderBtn,
            typeBell,
            typeLabel,
            typeBtn,
            speciesBell,
            speciesLabel,
            speciesBtn
        )
    }
    
    func setupConstraints() {
        let buttonWidthRatio = 0.48
        let midRatio = 0.5

        mainImage.snp.makeConstraints{ make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(midRatio)
        }
        statusBell.snp.makeConstraints{ make in
            make.top.equalTo(mainImage.snp.bottom).offset(40)
            make.width.height.equalTo(40)
            make.left.equalToSuperview().inset(20)
        }
        statusLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(statusBell)
            make.left.equalTo(statusBell.snp.right).offset(5)
        }
        statusBtn.snp.makeConstraints{ make in
            make.top.equalTo(statusBell.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(buttonWidthRatio)
            make.height.equalTo(50)
        }
        genderBell.snp.makeConstraints{ make in
            make.top.equalTo(mainImage.snp.bottom).offset(40)
            make.width.height.equalTo(40)
            make.centerX.equalToSuperview().offset(40)
        }
        genderLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(genderBell)
            make.left.equalTo(genderBell.snp.right).offset(5)
        }
        genderBtn.snp.makeConstraints{ make in
            make.top.equalTo(genderBell.snp.bottom).offset(40)
            make.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(buttonWidthRatio)
            make.height.equalTo(50)
        }
        typeBell.snp.makeConstraints{ make in
            make.top.equalTo(statusBtn.snp.bottom).offset(25)
            make.width.height.equalTo(40)
            make.left.equalToSuperview().inset(20)
        }
        typeLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(typeBell)
            make.left.equalTo(typeBell.snp.right).offset(5)
        }
        typeBtn.snp.makeConstraints{ make in
            make.top.equalTo(typeBell.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(buttonWidthRatio)
            make.height.equalTo(50)
        }
        speciesBell.snp.makeConstraints{ make in
            make.top.equalTo(genderBtn.snp.bottom).offset(25)
            make.width.height.equalTo(40)
            make.centerX.equalToSuperview().offset(40)
        }
        speciesLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(speciesBell)
            make.left.equalTo(speciesBell.snp.right).offset(5)
        }
        speciesBtn.snp.makeConstraints{ make in
            make.top.equalTo(speciesBell.snp.bottom).offset(40)
            make.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(buttonWidthRatio)
            make.height.equalTo(50)
        }
        
    }
}
