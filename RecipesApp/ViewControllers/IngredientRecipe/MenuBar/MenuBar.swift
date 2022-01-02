//
//  MenuBar.swift
//  RecipesApp
//
//  Created by Snow Lukin on 02.01.2022.
//

import UIKit

class MenuBar: UIView {

    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .black
        
        return collectionView
    }()

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDictionary))
    }
}
