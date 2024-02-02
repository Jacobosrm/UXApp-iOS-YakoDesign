//
//  LatestNewController.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 8/01/24.
//

import UIKit

class LatestNewController: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsContentView: UIView!{
        didSet{
            newsContentView.layer.cornerRadius = 10
            newsContentView.clipsToBounds = true
        }
    }
    @IBOutlet weak var newsImageView: UIImageView!{
        didSet{
            newsImageView.layer.cornerRadius = 10
            newsImageView.clipsToBounds = true
        }
    }
    
    func configure(withTitle title: String, description: String, imageName: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        
        newsContentView.backgroundColor = UIColor(patternImage: UIImage(named: imageName) ?? UIImage())
        
        if let image = UIImage(named: imageName) {
            newsImageView.contentMode = .scaleAspectFill
            newsImageView.clipsToBounds = true
            newsImageView.image = image
        }
        
        setupOverlayView()
    }
    
    func setupOverlayView(){
        let overlayView = UIView(frame: newsImageView.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        newsImageView.addSubview(overlayView)
    }
}
