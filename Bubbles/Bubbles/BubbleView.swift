//
//  BubbleView.swift
//  Bubbles
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import UIKit

class BubbleView: UIView {

    var shapeLayer: CAShapeLayer = {
        let _shapeLayer = CAShapeLayer()
        _shapeLayer.fillColor = UIColor.clear.cgColor
        _shapeLayer.allowsEdgeAntialiasing = true
//        _shapeLayer.backgroundColor = UIColor.red.cgColor
        return _shapeLayer
    }()
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .path
    }

    override var collisionBoundingPath: UIBezierPath {
        return circularPath()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = self.bounds.width / 2
        self.backgroundColor = .white

        layer.addSublayer(shapeLayer)
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        shapeLayer.path = circularPath(lineWidth: 0, center: center).cgPath
    }

    private func circularPath(lineWidth: CGFloat = 0, center: CGPoint = .zero) -> UIBezierPath {
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        return UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true
        )
    }

}

