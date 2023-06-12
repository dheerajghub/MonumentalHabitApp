//
//  CourseTableViewCell.swift
//  MonumentalHabitApp
//
//  Created by Rahul Sharma on 10/06/23.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    
    // MARK: PROPERTIES -
    
    let cellView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let courseImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "CourseImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let courseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font(.installed(.manropeMedium), size: .custom(18)).instance
        label.textColor = Color.eclipse
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textAlignment = .left
        label.text = "30 Day Journal Challenge - Establish a Habit of Daily Journaling"
        return label
    }()
    
    let courseTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font(.installed(.manropeRagular), size: .custom(12)).instance
        label.textColor = Color.eclipse
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textAlignment = .left
        label.text = "2h 41m"
        return label
    }()
    
    let courseTotalLessons : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font(.installed(.manropeRagular), size: .custom(12)).instance
        label.textColor = Color.eclipseLight1
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textAlignment = .left
        label.text = "37 Lessons"
        return label
    }()
    
    let saveView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 32/2
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: MAIN -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: FUNCTIONS -
    func setUpViews(){
        addSubview(cellView)
        cellView.addSubview(courseImage)
        cellView.addSubview(courseTitle)
        cellView.addSubview(courseTime)
        cellView.addSubview(courseTotalLessons)
        cellView.addSubview(saveView)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            courseImage.topAnchor.constraint(equalTo: cellView.topAnchor),
            courseImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            courseImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            courseImage.heightAnchor.constraint(equalToConstant: 166),
            
            courseTitle.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 12),
            courseTitle.trailingAnchor.constraint(equalTo: cellView.trailingAnchor,constant: -12),
            courseTitle.topAnchor.constraint(equalTo: courseImage.bottomAnchor,constant: 5),
            
            courseTime.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 12),
//            courseTime.trailingAnchor.constraint(equalTo: cellView.trailingAnchor,constant: -12),
            courseTime.topAnchor.constraint(equalTo: courseTitle.bottomAnchor,constant: 8),
            courseTime.heightAnchor.constraint(equalToConstant: 14),

            courseTotalLessons.topAnchor.constraint(equalTo: courseTime.bottomAnchor,constant: 4),
            courseTotalLessons.leadingAnchor.constraint(equalTo: cellView.leadingAnchor,constant: 12),
//            courseTotalLessons.trailingAnchor.constraint(equalTo: cellView.trailingAnchor,constant: -12),
            courseTotalLessons.bottomAnchor.constraint(equalTo: cellView.bottomAnchor,constant: -10),
            courseTotalLessons.heightAnchor.constraint(equalToConstant: 14),
            
            
           
            saveView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
            saveView.topAnchor.constraint(equalTo: courseTitle.bottomAnchor,constant: 8),
            saveView.heightAnchor.constraint(equalToConstant: 32),
            saveView.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
}

