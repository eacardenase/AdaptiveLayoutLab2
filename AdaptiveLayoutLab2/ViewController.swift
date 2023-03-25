//
//  ViewController.swift
//  AdaptiveLayoutLab2
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    var leadingAnchorConstraint = NSLayoutConstraint()
    var trailingAnchorConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

extension ViewController {
    func setupViews() {
        let label = makeLabel(withText: "Watch me!")
        let button = makeButton(withText: "Left/Right")
        
        view.addSubview(label)
        view.addSubview(button)
        
        // constraints we're going to alter
        leadingAnchorConstraint = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80)
        trailingAnchorConstraint = label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80)
        
        // constraints we are going to leave the same
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // start by activating the leading constraint
        leadingAnchorConstraint.isActive = true
        
        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        if leadingAnchorConstraint.isActive {
            leadingAnchorConstraint.isActive = false
            trailingAnchorConstraint.isActive = true
        } else {
            leadingAnchorConstraint.isActive = true
            trailingAnchorConstraint.isActive = false
        }
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        
        button.configuration = config
        
        return button
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        
        return label
    }
}
