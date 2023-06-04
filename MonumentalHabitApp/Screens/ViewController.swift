//
//  ViewController.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 27/05/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: PROPERTIES -
    
    lazy var demoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.hapticFeedback()
        
        return button
    }()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        view.backgroundColor = .white
        view.addSubview(demoButton)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            demoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            demoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            demoButton.heightAnchor.constraint(equalToConstant: 50),
            demoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
