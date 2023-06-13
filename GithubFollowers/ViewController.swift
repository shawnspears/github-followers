//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Shawn Spears on 5/31/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and add colored boxes
        let coloredBoxes = createColoredBoxes()
        for coloredBox in coloredBoxes {
            view.addSubview(coloredBox)
            coloredBox.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Create constraints for the colored boxes
        createConstraints(for: coloredBoxes)
    }
    
    private func createColoredBoxes() -> [UIView] {
        var coloredBoxes: [UIView] = []
        
        let lightGreyColor = UIColor.lightGray
        
        for _ in 1...9 {
            let coloredBox = UIView()
            coloredBox.backgroundColor = lightGreyColor
            coloredBoxes.append(coloredBox)
        }
        
        return coloredBoxes
    }
    
    private func createConstraints(for coloredBoxes: [UIView]) {
        let margin: CGFloat = 5
        
        for i in 0..<coloredBoxes.count {
            let coloredBox = coloredBoxes[i]
            
            // Set width and height constraints
            coloredBox.widthAnchor.constraint(equalToConstant: (view.bounds.width - 4 * margin) / 3).isActive = true
            coloredBox.heightAnchor.constraint(equalToConstant: (view.bounds.width - 4 * margin) / 3).isActive = true
            
            // Set leading constraint
            if i % 3 == 0 {
                coloredBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
            } else {
                let previousColoredBox = coloredBoxes[i - 1]
                coloredBox.leadingAnchor.constraint(equalTo: previousColoredBox.trailingAnchor, constant: margin).isActive = true
            }
            
            // Set top constraint
            if i < 3 {
                coloredBox.topAnchor.constraint(equalTo: view.topAnchor, constant: margin).isActive = true
            } else {
                let row = (i / 3)
                let previousRowColoredBox = coloredBoxes[(row - 1) * 3 + i % 3]
                coloredBox.topAnchor.constraint(equalTo: previousRowColoredBox.bottomAnchor, constant: margin).isActive = true
            }
        }
    }
}

