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
        let officalName = labelView(labelText: "Official name: \(country?.name?.official ?? "No info")")
        
        let independentCountry = labelView(labelText: "Country is independent: " + (country?.independent?.description ?? "No info"))
        
        let countryUnMember = labelView(labelText: "Country is a member of the UN: " + (country?.unMember?.description ?? "No info"))
        
        let countryCapital = labelView(labelText: "Capital city: " + (country?.capital?.first ?? "No info"))
        
        let countryRegion = labelView(labelText: "Region: " + (country?.region?.rawValue ?? "No info"))
        
        let countryArea = labelView(labelText: "Country area: \(country?.area ?? 0)")
        
        let countryPopulation = labelView(labelText: "Population: \(country?.population ?? 0)")
        
        // COAT OF ARMS VIEW
        let coatOfArms = UIImageView()
        coatOfArms.sd_setImage(with: URL(string: country?.coatOfArms?.png ?? ""), placeholderImage: UIImage(named: "No_flag.svg"))
        coatOfArms.translatesAutoresizingMaskIntoConstraints = false
        coatOfArms.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        coatOfArms.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
        // FLAG VIEW
        let countryFlag = UIImageView()
        countryFlag.sd_setImage(with: URL(string: country?.flags?.png ?? ""), placeholderImage: UIImage(named: "No_flag.svg"))
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        countryFlag.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        
        // FLAG & COAT OF ARMS STACK VIEW
        let coatFlagStackView = UIStackView()
        coatFlagStackView.axis = .vertical
        coatFlagStackView.distribution = .fillEqually
        coatFlagStackView.alignment = .center
        coatFlagStackView.spacing = 5.0
        coatFlagStackView.translatesAutoresizingMaskIntoConstraints = false
        
        coatFlagStackView.addArrangedSubview(coatOfArms)
        coatFlagStackView.addArrangedSubview(countryFlag)
        
        //INFO STACK VIEW (INFO LABELS)
        let infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillEqually
        infoStackView.alignment = .center
        infoStackView.spacing = 5.0
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        infoStackView.addArrangedSubview(officalName)
        infoStackView.addArrangedSubview(independentCountry)
        infoStackView.addArrangedSubview(countryUnMember)
        infoStackView.addArrangedSubview(countryCapital)
        infoStackView.addArrangedSubview(countryRegion)
        infoStackView.addArrangedSubview(countryArea)
        infoStackView.addArrangedSubview(countryPopulation)
        
        
        
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
    
}
