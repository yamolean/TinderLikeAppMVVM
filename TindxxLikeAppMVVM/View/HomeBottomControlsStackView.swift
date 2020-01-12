//
//  HomeBottomControlsStackView.swift
//  TindxxLikeAppMVVM
//
//  Created by 矢守叡 on 2020/01/11.
//  Copyright © 2020 yamolean. All rights reserved.
//

import UIKit

final class HomeBottomControlsStackView: UIStackView {
    
    static func createButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }
    
    let refreshButton = createButton(image: #imageLiteral(resourceName: "yamolean"))
    let dislikeButton = createButton(image: #imageLiteral(resourceName: "yamolean"))
    let superLikeButton = createButton(image: #imageLiteral(resourceName: "yamolean"))
    let likeButton = createButton(image: #imageLiteral(resourceName: "yamolean"))
    let specialButton = createButton(image: #imageLiteral(resourceName: "yamolean"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
       [refreshButton, dislikeButton, superLikeButton, likeButton, specialButton].forEach { (button) in
           self.addArrangedSubview(button)
       }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
