//
//  Gradient.swift
//  Concentration
//
//  Created by Ricky on 9/26/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

class Gradient: UIView {
    init(frame: CGRect, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, location: [NSNumber]? = nil) {
        super.init(frame: frame)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        guard let viewLayer = layer as? CAGradientLayer else { fatalError("Failed to cast layer to CAGradientLayer") }
        viewLayer.colors = colors.map({ $0.cgColor })
        viewLayer.startPoint = startPoint
        viewLayer.endPoint = endPoint
        viewLayer.locations = location
        viewLayer.frame = frame
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
