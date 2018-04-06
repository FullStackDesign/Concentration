//
//  UIStackView+Extension.swift
//  Concentration
//
//  Created by Ricky on 4/2/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(axis: UILayoutConstraintAxis, distribution: UIStackViewDistribution) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
