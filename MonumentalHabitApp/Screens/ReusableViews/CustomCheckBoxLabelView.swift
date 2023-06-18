//
//  CustomCheckBoxLabelView.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 11/06/23.
//

import UIKit

class CustomCheckBoxLabelView: UIView {

    // MARK: PROPERTIES -
    
    let checkBoxImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ic_checkbox_checked")
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "check box label"
        label.textColor = .black
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(checkBoxImage)
        addSubview(label)
        addSubview(actionButton)
    }
    
    func setUpConstraints(){
        actionButton.pin(to: self)
        NSLayoutConstraint.activate([
            checkBoxImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkBoxImage.widthAnchor.constraint(equalToConstant: 20),
            checkBoxImage.heightAnchor.constraint(equalToConstant: 20),
            checkBoxImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: checkBoxImage.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
