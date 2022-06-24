//
//  RatingView.swift
//  iOS_Demo
//
//  Created by Infaz Ariff on 20/6/22.
//

import UIKit

class RatingView: CALayer {
    private var innerRoundShapeLayer: CAShapeLayer!
    private var outerRoundShapeLayer: CAShapeLayer!
    private var roundedPath: UIBezierPath!
    private let rotationTransformation = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
    private var completeLabel: UILabel!
    public var progressLabel: UILabel!
    public var progress: CGFloat!
    
    public init(radius: CGFloat, position: CGPoint, innerTrackColor: UIColor, outerTrackColor: UIColor, lineWidth: CGFloat,progress: Int) {
        super.init()
        
        roundedPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        outerRoundShapeLayer = CAShapeLayer()
        outerRoundShapeLayer.path = roundedPath.cgPath
        outerRoundShapeLayer.position = position
        outerRoundShapeLayer.lineCap = CAShapeLayerLineCap.round
        outerRoundShapeLayer.transform = rotationTransformation
        outerRoundShapeLayer.strokeColor = outerTrackColor.cgColor
        outerRoundShapeLayer.fillColor = UIColor.clear.cgColor
        outerRoundShapeLayer.lineWidth = lineWidth
        outerRoundShapeLayer.strokeEnd = 1
        addSublayer(outerRoundShapeLayer)
        
        innerRoundShapeLayer = CAShapeLayer()
        innerRoundShapeLayer.path = roundedPath.cgPath
        innerRoundShapeLayer.position = position
        innerRoundShapeLayer.strokeColor = innerTrackColor.cgColor
        innerRoundShapeLayer.lineCap = CAShapeLayerLineCap.round
        innerRoundShapeLayer.transform = rotationTransformation
        innerRoundShapeLayer.lineWidth = lineWidth
        innerRoundShapeLayer.fillColor = UIColor.clear.cgColor
        innerRoundShapeLayer.strokeEnd = CGFloat(progress) / 100
        addSublayer(innerRoundShapeLayer)
        
        progressLabel = UILabel()
        let size = CGSize(width: radius * 1.5, height: radius * 1.5)
        let origin = CGPoint(x: position.x, y: position.y)
        
        let progressText = "\(progress)"
        let progressFont = UIFont.boldSystemFont(ofSize: radius * 0.9)
        let progressAttributes = [NSAttributedString.Key.font: progressFont]
        
        let percentageText = "%"
        let percentageFont = UIFont.systemFont(ofSize: radius * 0.3)
        let percentageAttributes = [NSAttributedString.Key.font: percentageFont]
        
        let firstString = NSMutableAttributedString(string: progressText, attributes: progressAttributes)
        let secondString = NSAttributedString(string: percentageText, attributes: percentageAttributes)
        
        firstString.append(secondString)
        
        progressLabel.frame = CGRect(origin: origin, size: size)
        
        progressLabel.attributedText = firstString
        
        progressLabel.textColor = .white
        progressLabel.textAlignment = .center
        progressLabel.center = position
        insertSublayer(progressLabel.layer, at: 0)
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
