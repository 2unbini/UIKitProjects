//
//  ViewController.swift
//  Bubbles
//
//  Created by Eunbin Kwon on 2022/03/06.
//

import UIKit

class ViewController: UIViewController {

    let colors: [CGColor] = [UIColor.systemRed.cgColor, UIColor.systemYellow.cgColor, UIColor.systemGreen.cgColor, UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor, UIColor.clear.cgColor]
    var circles: [BubbleView] = []
    var gravity: Gravity?
    var gravityItems: [UIDynamicItem] = []
    var containerView: UIView = UIView(frame: CGRect(
        x: 0,
        y: 0,
        width: UIScreen.main.bounds.width * 0.8,
        height: UIScreen.main.bounds.height * 0.6
    ))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureContainerView()

        // create random BubbleView in random position
        for idx in 0..<365 {
            let randColor = Int.random(in: 0..<colors.count)
            let position = self.view.convert(containerView.frame, to: self.view)
            let randX = Int.random(in: 50..<Int(containerView.frame.size.width - 50))
            let randY = Int.random(in: 50..<Int(containerView.frame.size.height - 50))

            let bubble = BubbleView(frame: CGRect(x: randX, y: randY, width: 20, height: 20))
            bubble.shapeLayer.fillColor = colors[randColor]

//            bubble.delegate = self
            bubble.tag = idx
            containerView.addSubview(bubble)
        }

        // prepare the bubbles to pass to SDK
        gravityItems = containerView.subviews.filter{ $0 is BubbleView }

        gravity = Gravity(
            gravityItems: gravityItems, // <<-- your bubbles
            collisionItems: nil,
            referenceView: containerView,
            boundary: UIBezierPath(rect: CGRect(
                x: 5,
                y: 5,
                width: containerView.bounds.width - 10,
                height: containerView.bounds.height - 10
            )),
            queue: nil
        )

        // start gravity
        gravity?.enable()
    }
    
    // 엄청난 CPU 사용량...!!! 5개 추가하면 CPU 101% 사용,,, 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let randColor = Int.random(in: 0..<colors.count)
        let position = self.view.convert(containerView.frame, to: self.view)
        let posX = position.width / 2
        let posY = position.origin.y + 10
        
        let bubble = BubbleView(frame: CGRect(x: posX, y: posY, width: 20, height: 20))
        bubble.shapeLayer.fillColor = colors[randColor]
        containerView.addSubview(bubble)
        
//        var newGravityItems = [UIDynamicItem]()
//        var newGravity: Gravity?
        gravityItems.append(bubble)
        gravity = Gravity(
            gravityItems: gravityItems,
            collisionItems: nil,
            referenceView: containerView,
            boundary: UIBezierPath(rect: CGRect(
                x: 5,
                y: 5,
                width: containerView.bounds.width - 10,
                height: containerView.bounds.height - 10
            )),
            queue: nil
        )
        gravity?.enable()
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = .clear
        containerView.layer.borderWidth = 4
        containerView.layer.borderColor = UIColor.cyan.cgColor
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8),
            containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.6)
        ])
    }
}

