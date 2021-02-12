//
//  MainCollectionViewCell.swift
//  Bloom
//
//  Created by Dinara Shadyarova on 2/10/21.
//  Copyright © 2021 dinarashadyarova. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var durationModeImg: UIImageView!
    @IBOutlet weak var progressInFiguresLabel: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private var totalFlowersView = UIView()
    
    var totalFlowersLayer = CAShapeLayer()
    var totalFlowersLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        setupTotalFlowersContainerView()
        setupTotalFlowersLabel()
    }
    
    func setupTotalFlowersContainerView() {
        drawTotalFlowersContainer()
        self.addSubview(totalFlowersView)
        
        totalFlowersView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[childView(==50)]-0-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": totalFlowersView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[childView(==30)]-0-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": totalFlowersView]))
    }
    
    func drawTotalFlowersContainer() {
        let x = 0
        let y = 0
        let width = 50
        let height = 30
        let leftTopCenterX = x + width / 4
        let leftTopCenterY = y + height / 4
        let leftTopWidth = width / 2
        let leftTopHeight = height / 2
        
        let controlPoint1 = CGPoint(x: leftTopCenterX - leftTopWidth / 4, y: leftTopCenterY - leftTopHeight / 4)
        let controlPoint2 = CGPoint(x: x + 3 * width / 4, y: y)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y + height))
        path.addCurve(to: CGPoint(x: x + width, y: y), controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        path.addLine(to: CGPoint(x: x + width, y: y))
        path.addLine(to: CGPoint(x: x + width, y: y + height))
        path.addLine(to: CGPoint(x: x, y: y + height))
        path.close()
        
        totalFlowersLayer.fillColor = Color.lightBlue.value.cgColor
        totalFlowersLayer.lineWidth = 2
        totalFlowersLayer.path = path.cgPath
        
        totalFlowersView.layer.addSublayer(totalFlowersLayer)
    }
    
    func setupTotalFlowersLabel() {
        totalFlowersLabel.frame = totalFlowersView.bounds
        totalFlowersLabel.text = "10"
        totalFlowersLabel.font = UIFont(name: "Avenir-Heavy", size: 10)
        totalFlowersLabel.textColor = .white
        totalFlowersView.addSubview(totalFlowersLabel)
        
        totalFlowersLabel.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: totalFlowersLabel, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: totalFlowersView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 3)
        let verticalConstraint = NSLayoutConstraint(item: totalFlowersLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: totalFlowersView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 3)
        addConstraints([horizontalConstraint, verticalConstraint])
    }
    
    @IBAction func onMoreButtonDidPress(_ sender: UIButton) {
    }
}
