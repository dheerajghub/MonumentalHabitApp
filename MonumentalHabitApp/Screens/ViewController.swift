//
//  ViewController.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 27/05/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: PROPERTIES -
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HOME"
        label.font = Font(.installed(.klasikRough), size: .custom(35)).instance
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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
        view.addSubview(label)
    }
    
    func setUpConstraints(){
        label.pin(to: view)
    }

}
