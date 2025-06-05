//
//  Extension + UIView.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    func printViewHierarchy() {
        print(self.debugDescription)
                for subview in subviews {
                    subview.printViewHierarchy()
                }
    }
}


extension Optional where Wrapped == String {
    var orNone: String {
        if let self = self, !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return self
        } else {
            return "None"
        }
    }
}

