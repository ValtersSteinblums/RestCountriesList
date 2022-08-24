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
     
}
