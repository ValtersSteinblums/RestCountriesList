//
//  Country.swift
//  RestCountriesList
//
//  Created by valters.steinblums on 23/08/2022.
//

//import Foundation
//
//struct Country: Codable {
//    let name: Name
//}
//
//struct Name: Codable {
//    let official, common: String?
//}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - CountryElement
struct CountryElement: Codable {
    let name: Name?
    let independent: Bool?
    let unMember: Bool?
    let capital: [String]?
    let region: Region?
    let area: Double?
    let population: Int?
    let continents: [Continent]?
    let coatOfArms, flags: CoatOfArms?
    let flag: String?
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

