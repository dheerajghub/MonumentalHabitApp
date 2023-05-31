//
//  CustomCardHeaderView.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 28/05/23.
//

import UIKit

class CustomCardHeaderView: UIView {

    // MARK: PROPERTIES -
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Header Title"
        label.font = Font(.installed(.manropeMedium), size: .custom(16)).instance
        return label
    }()
    
    let leadingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("leadingButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(17)).instance
        return button
    }()
    
    let trailingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("trailingButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(17)).instance
        return button
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
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
        addSubview(titleLabel)
        addSubview(leadingButton)
        addSubview(trailingButton)
        addSubview(dividerView)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            leadingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leadingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            trailingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            trailingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
