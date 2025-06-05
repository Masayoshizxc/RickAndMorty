//
//  HomeViewController.swift
//  RickAndMorty
//
//  Created by Adilet on 5/6/25.
//

import UIKit
import SnapKit
import FirebaseRemoteConfig
import WebKit

class HomeViewController: UIViewController, WKNavigationDelegate {
    
    var coordinator: MainCoordinator?
    
    private let link: String
    
    init(link: String) {
        self.link = link
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var webView: WKWebView = {
        let v = WKWebView(frame: view.bounds)
        v.navigationDelegate = self
        return v
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.center = view.center
        ind.hidesWhenStopped = true
        return ind
    }()
    
    
    
    lazy var backBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Return", for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 25)
        b.setTitleColor(.systemBackground, for: .normal)
        b.backgroundColor != .systemBackground
        return b
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
        if let url = URL(string: link) {
            webView.load(URLRequest(url: url))
        }
        
    }
    
    @objc func returnTabBar() {
        coordinator?.start()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}

extension HomeViewController {
    
    func setupSubviews() {
        view.addSubviews(
            webView,
            activityIndicator,
            backBtn
        )
    }
    
    func setupConstraints() {
//        webView.snp.makeConstraints{ make in
//            make.left.top.right.bottom.equalToSuperview()
//        }
        backBtn.snp.makeConstraints{ make in
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().inset(100)
        }
    }

}

