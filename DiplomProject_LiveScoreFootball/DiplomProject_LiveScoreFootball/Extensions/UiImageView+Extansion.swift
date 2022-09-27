//
//  UiImageView+Extansion.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 20.08.22.
//

import Foundation
import UIKit
import SVGKit

// Расширение, в котором реализованы методы получения фото-данных по URL
extension UIImageView {
    func getLeagueLogo(leagueId: Int) {
        guard let imageUrl = URL(string: "\(URLConstants.baseURLForLeagueLogo)\(leagueId)\(URLConstants.teamlogoPrefixURL)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    func getLogoTeam(teamId: Int) {
        guard let imageUrl = URL(string: "\(URLConstants.baseURLForTeamLogo)\(teamId)\(URLConstants.teamlogoPrefixURL)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func getPlayerPhoto(playerId: Int) {
        guard let imageUrl = URL(string: "\(URLConstants.baseURLForPlayerPhoto)\(playerId)\(URLConstants.teamlogoPrefixURL)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func getCountryFlag(codeCountry: String) {
        let flag = codeCountry
        guard let svgPhoto = URL(string: flag) else {return}
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: svgPhoto) {
                let receivedimage: SVGKImage = SVGKImage(data: data)
                let image = receivedimage.uiImage
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

