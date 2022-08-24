//
//  ReUsedViews.swift
//  RestCountriesList
//
//  Created by valters.steinblums on 24/08/2022.
//

import Foundation
import UIKit


// MARK: - STACK VIEW FUNCTIONS
func setupStackView() -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.alignment = .center
    stackView.spacing = 5.0
    stackView.translatesAutoresizingMaskIntoConstraints = false
        
    return stackView
}

func addLabelsToStack(arr: [UILabel], stack: UIStackView) {
    for label in arr {
        stack.addArrangedSubview(label)
    }
}

// MARK: - LABEL VIEW FUNCTIONS
func labelView(labelText: String) -> UILabel {
    let labelName = UILabel()
    labelName.numberOfLines = 0
    labelName.textAlignment = .center
    labelName.font = UIFont.boldSystemFont(ofSize: labelName.font.pointSize)
    labelName.font = labelName.font.withSize(18)
    labelName.adjustsFontSizeToFitWidth = true
    labelName.minimumScaleFactor = 0.25
    labelName.text = labelText
    
    return labelName
}

func setupLabelViews() -> [UILabel] {
    var labelArray = [UILabel]()
    
    labelArray.append(labelView(labelText: "Official name: \(country?.name?.official ?? "No info")"))
    labelArray.append(labelView(labelText: "Country is independent: " + (country?.independent?.description ?? "No info")))
    labelArray.append(labelView(labelText: "Country is a member of the UN: " + (country?.unMember?.description ?? "No info")))
    labelArray.append(labelView(labelText: "Capital city: " + (country?.capital?.first ?? "No info")))
    labelArray.append(labelView(labelText: "Region: " + (country?.region?.rawValue ?? "No info")))
    labelArray.append(labelView(labelText: "Country area: \(country?.area ?? 0)"))
    labelArray.append(labelView(labelText: "Population: \(country?.population ?? 0)"))
                      
    return labelArray
}

// MARK: - IMAGE VIEW FUNCTIONS
func setupImageView(height: CGFloat, width: CGFloat, imageString: String?) -> UIImageView {
    let image = UIImageView()
    image.sd_setImage(with: URL(string: imageString ?? ""), placeholderImage: UIImage(named: "No_flag.svg"))
    image.translatesAutoresizingMaskIntoConstraints = false
    image.heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
    image.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
    
    return image
}
