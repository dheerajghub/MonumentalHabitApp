//
//  CustomButtonView.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 28/05/23.
//

import UIKit

public struct CustomButtonViewConfiguration {
    
    let withImage: Bool
    
    init(withImage: Bool = false) {
        self.withImage = withImage
    }
    
}

class CustomButtonView: UIView {

    // MARK: PROPERTIES -
    
    var configuration: CustomButtonViewConfiguration? {
        didSet {
            configure()
        }
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fill
        return stackView
    }()
    
    let buttonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray.withAlphaComponent(0.5)
        image.layer.cornerRadius = 5
        return image
    }()
    
    let buttonTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .lightGray.withAlphaComponent(0.5)
        title.text = "Custom Button"
        title.font = Font(.installed(.manropeBold), size: .custom(16)).instance
        return title
    }()
    
    let buttonAction: UIButton = {
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
        layer.cornerRadius = 10
        backgroundColor = .lightGray.withAlphaComponent(0.3)
        addSubview(stackView)
        addSubview(buttonAction)
    }
    
    func setUpConstraints(){
        buttonAction.pin(to: self)
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonImage.heightAnchor.constraint(equalToConstant: 30),
            buttonImage.widthAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    func configure(){
        
        guard let configuration = configuration else { return }
        
        stackView.removeFullyAllArrangedSubviews()
        
        if configuration.withImage {
            
            stackView.addArrangedSubview(buttonImage)
            stackView.addArrangedSubview(buttonTitle)
            
        } else {
            
            stackView.addArrangedSubview(buttonTitle)
            
        }
        
    }

}
