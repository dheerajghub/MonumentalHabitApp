//
//  SignUpHeaderView.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 11/06/23.
//

import UIKit

class SignUpHeaderView: UIView {

    // MARK: PROPERTIES -
    
    let headerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "ic_create_account")
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "create your account".uppercased()
        label.textColor = Color.eclipse
        label.font = Font(.installed(.klasikRegular), size: .custom(24)).instance
        label.textAlignment = .center
        return label
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
        addSubview(headerImage)
        addSubview(titleLabel)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerImage.widthAnchor.constraint(equalToConstant: 180),
            headerImage.heightAnchor.constraint(equalToConstant: 190),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
