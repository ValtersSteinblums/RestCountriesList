//
//  CountryDetailedViewController.swift
//  RestCountriesList
//
//  Created by valters.steinblums on 23/08/2022.
//

import UIKit
import SDWebImage
class CountryDetailedViewController: UIViewController {
    
    var country: CountryElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - SETUP WHOLE VIEW
    func setView() {
        // TITLE LABEL VIEW, SEPARATE FROM STACK
        let titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = titleLabel.font.withSize(25)
        titleLabel.font = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)
        
        titleLabel.text = "\(country?.name?.common ?? "No country") \(country?.flag?.description ?? "No flag emoji")"
        
        self.view.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.textAlignment = .center
        
        // LABEL VIEWS
        let labels = setupLabelViews()
        
        // COAT OF ARMS VIEW
        let coatOfArms = setupImageView(height: 150, width: 200, imageString: country?.coatOfArms?.png)
        
        // FLAG VIEW
        let countryFlag = setupImageView(height: 150, width: 300, imageString: country?.flags?.png)
        
        // FLAG & COAT OF ARMS STACK VIEW
        let coatFlagStackView = setupStackView()
        
        coatFlagStackView.addArrangedSubview(coatOfArms)
        coatFlagStackView.addArrangedSubview(countryFlag)
        
        //INFO STACK VIEW (INFO LABELS)
        let infoStackView = setupStackView()
        addLabelsToStack(arr: labels, stack: infoStackView)
        
        
        
        // MAIN STACK VIEW (INFO LABEL STACK & COAT OF ARMS/FLAG STACK)
        let allStackView = UIStackView()
        allStackView.axis = .vertical
        allStackView.distribution = .fillEqually
        allStackView.alignment = .center
        allStackView.spacing = 10.0
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        
        allStackView.addArrangedSubview(coatFlagStackView)
        allStackView.addArrangedSubview(infoStackView)
        
        self.view.addSubview(allStackView)
        
        // SATCK VIEW CONSTRAINTS
        // Main Stack
        allStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25).isActive = true
        allStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -25).isActive = true
        allStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        allStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // Label Stack
        infoStackView.leftAnchor.constraint(equalTo: allStackView.leftAnchor, constant: 10).isActive = true
        infoStackView.rightAnchor.constraint(equalTo: allStackView.rightAnchor, constant: -10).isActive = true
        
        // Image Stack
        coatFlagStackView.leftAnchor.constraint(equalTo: allStackView.leftAnchor, constant: 10).isActive = true
        coatFlagStackView.rightAnchor.constraint(equalTo: allStackView.rightAnchor, constant: -10).isActive = true
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
    
    // MARK: - IMAGE VIEW FUNCTIONS
    func setupImageView(height: CGFloat, width: CGFloat, imageString: String?) -> UIImageView {
        let image = UIImageView()
        image.sd_setImage(with: URL(string: imageString ?? ""), placeholderImage: UIImage(named: "No_flag.svg"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
        image.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
        
        return image
    }
                          
                          
}
