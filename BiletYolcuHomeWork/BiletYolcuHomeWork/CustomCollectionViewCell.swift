//
//  CustomCollectionViewCell.swift
//  BiletYolcuHomeWork
//
//  Created by Doğuş  Kaynak on 10.05.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chair")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "45"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        arrangeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func arrangeViews() {
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20)
        ])
    }
    
    public func configure(label: String) {
        myLabel.text = label
    }
    
    override func prepareForReuse() {
        myLabel.text = nil
    }
}
