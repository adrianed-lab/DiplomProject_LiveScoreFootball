//
//  File.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.09.22.
//

import Foundation
import UIKit

extension UIView {
    func createTableViewHeaderForStandingVC(indexPath:IndexPath, view: UIView) -> UIView {
        let viewForSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let viewForResults = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForResults.backgroundColor = .blue
        let labelResults = UILabel(frame: CGRect(x: 15, y: 5, width: 80, height: 20))
        labelResults.text = "RESULTS"
        labelResults.textColor = .white
        viewForResults.addSubview(labelResults)
        let viewForCalendar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForCalendar.backgroundColor = .blue
        let labelCalendar = UILabel(frame: CGRect(x: 15, y: 5, width: 100, height: 20))
        labelCalendar.text = "CALENDAR"
        labelCalendar.textColor = .white
        viewForCalendar.addSubview(labelCalendar)
        viewForSection.backgroundColor = .blue
        let labelNumberTeam = UILabel(frame: CGRect(x: 15, y: 5, width: 10, height: 20))
        viewForSection.addSubview(labelNumberTeam)
        labelNumberTeam.font = UIFont(name: "System", size: 8)
        labelNumberTeam.text = "#"
        labelNumberTeam.textColor = .white
        labelNumberTeam.layer.masksToBounds = true
        let labelTeam = UILabel(frame: CGRect(x: 34, y: 5, width: 60, height: 20))
        viewForSection.addSubview(labelTeam)
        labelTeam.font = UIFont(name: "System", size: 8)
        labelTeam.text = "TEAM"
        labelTeam.textColor = .white
        labelTeam.layer.masksToBounds = true
        let labelPTS = UILabel(frame: CGRect(x: view.frame.size.width - 35, y: 5, width: 45, height: 20))
        viewForSection.addSubview(labelPTS)
        labelPTS.font = UIFont(name: "System", size: 8)
        labelPTS.text = "PTS"
        labelPTS.textColor = .white
        let labelGoals = UILabel(frame: CGRect(x: view.frame.size.width - 75, y: 5, width: 15, height: 20))
        viewForSection.addSubview(labelGoals)
        labelGoals.text = "G"
        labelGoals.font = UIFont(name: "System", size: 8)
        labelGoals.textColor = .white
        let labelMatches = UILabel(frame: CGRect(x: view.frame.size.width - 120, y: 5, width: 15, height: 20))
        viewForSection.addSubview(labelMatches)
        labelMatches.text = "M"
        labelMatches.font = UIFont(name: "System", size: 8)
        labelMatches.textColor = .white
        switch indexPath.row {
        case 0:
            return viewForSection
        case 1:
            return viewForResults
        case 2:
            return viewForCalendar
        default:
            return UIView()
        }
    }
    
    func createTitleViewHeaderForTeamInfoVC(indexPath: IndexPath, view: UIView) -> UIView {
        let viewForSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let viewForResults = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForResults.backgroundColor = .blue
        let labelResults = UILabel(frame: CGRect(x: 15, y: 5, width: 80, height: 20))
        labelResults.text = "RESULTS"
        labelResults.textColor = .white
        viewForResults.addSubview(labelResults)
        let viewForPlayers = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForPlayers.backgroundColor = .blue
        let labelPlayers = UILabel(frame: CGRect(x: 15, y: 5, width: 80, height: 20))
        labelPlayers.text = "PLAYERS"
        labelPlayers.textColor = .white
        viewForPlayers.addSubview(labelPlayers)
        let viewForCalendar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForCalendar.backgroundColor = .blue
        let labelCalendar = UILabel(frame: CGRect(x: 15, y: 5, width: 100, height: 20))
        labelCalendar.text = "CALENDAR"
        labelCalendar.textColor = .white
        viewForCalendar.addSubview(labelCalendar)
        viewForSection.backgroundColor = .blue
        let labelNumberTeam = UILabel(frame: CGRect(x: 15, y: 5, width: 10, height: 20))
        viewForSection.addSubview(labelNumberTeam)
        labelNumberTeam.font = UIFont(name: "System", size: 8)
        labelNumberTeam.text = "#"
        labelNumberTeam.textColor = .white
        labelNumberTeam.layer.masksToBounds = true
        let labelTeam = UILabel(frame: CGRect(x: 34, y: 5, width: 60, height: 20))
        viewForSection.addSubview(labelTeam)
        labelTeam.font = UIFont(name: "System", size: 8)
        labelTeam.text = "TEAM"
        labelTeam.textColor = .white
        labelTeam.layer.masksToBounds = true
        let labelPTS = UILabel(frame: CGRect(x: view.frame.size.width - 35, y: 5, width: 45, height: 20))
        viewForSection.addSubview(labelPTS)
        labelPTS.font = UIFont(name: "System", size: 8)
        labelPTS.text = "PTS"
        labelPTS.textColor = .white
        let labelGoals = UILabel(frame: CGRect(x: view.frame.size.width - 75, y: 5, width: 15, height: 20))
        viewForSection.addSubview(labelGoals)
        labelGoals.text = "G"
        labelGoals.font = UIFont(name: "System", size: 8)
        labelGoals.textColor = .white
        let labelMatches = UILabel(frame: CGRect(x: view.frame.size.width - 120, y: 5, width: 15, height: 20))
        viewForSection.addSubview(labelMatches)
        labelMatches.text = "M"
        labelMatches.font = UIFont(name: "System", size: 8)
        labelMatches.textColor = .white
        
        switch indexPath.row {
        case 0:
            return viewForResults
        case 1:
            return viewForCalendar
        case 2:
            return viewForSection
        case 3:
            return viewForPlayers
        default:
            return UIView()
        }
    }
    
    func createTitleViewHeaderForMatchEventsVC(indexPath: IndexPath, view: UIView) -> UIView {
        let viewForSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        let viewForEvents = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForEvents.backgroundColor = .blue
        let labelEvents = UILabel(frame: CGRect(x: 15, y: 5, width: 100, height: 20))
        labelEvents.text = "EVENTS"
        labelEvents.textColor = .white
        viewForEvents.addSubview(labelEvents)
        let viewForStatistics = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForStatistics.backgroundColor = .blue
        let labelStatistics = UILabel(frame: CGRect(x: 15, y: 5, width: 100, height: 20))
        labelStatistics.text = "STATISTICS"
        labelStatistics.textColor = .white
        viewForStatistics.addSubview(labelStatistics)
        let viewForLineUps = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForLineUps.backgroundColor = .blue
        let labelLineUps = UILabel(frame: CGRect(x: 15, y: 5, width: 100, height: 20))
        labelLineUps.text = "LINEUPS"
        labelLineUps.textColor = .white
        viewForLineUps.addSubview(labelLineUps)
        viewForSection.backgroundColor = .blue
        let viewForH2H = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForH2H.backgroundColor = .blue
        let labelH2H = UILabel(frame: CGRect(x: 15, y: 5, width: 140, height: 20))
        labelH2H.text = "HEAD TO HEAD"
        labelH2H.textColor = .white
        viewForH2H.addSubview(labelH2H)
        viewForSection.backgroundColor = .blue
        let labelNumberTeam = UILabel(frame: CGRect(x: 15, y: 5, width: 10, height: 20))
        viewForSection.addSubview(labelNumberTeam)
        labelNumberTeam.font = UIFont(name: "System", size: 8)
        labelNumberTeam.text = "#"
        labelNumberTeam.textColor = .white
        labelNumberTeam.layer.masksToBounds = true
        let labelTeam = UILabel(frame: CGRect(x: 34, y: 5, width: 60, height: 20))
        viewForSection.addSubview(labelTeam)
        labelTeam.font = UIFont(name: "System", size: 8)
        labelTeam.text = "TEAM"
        labelTeam.textColor = .white
        labelTeam.layer.masksToBounds = true
        let labelPTS = UILabel(frame: CGRect(x: view.frame.size.width - 35, y: 5, width: 45, height: 20))
        viewForSection.addSubview(labelPTS)
        labelPTS.font = UIFont(name: "System", size: 8)
        labelPTS.text = "PTS"
        labelPTS.textColor = .white
        let labelGoals = UILabel(frame: CGRect(x: view.frame.size.width - 75, y: 5, width: 15, height: 20))
        viewForSection.addSubview(labelGoals)
        labelGoals.text = "G"
        labelGoals.font = UIFont(name: "System", size: 8)
        labelGoals.textColor = .white
        let labelMatches = UILabel(frame: CGRect(x: view.frame.size.width - 120, y: 5, width: 15, height: 20))
        viewForSection.addSubview(labelMatches)
        labelMatches.text = "M"
        labelMatches.font = UIFont(name: "System", size: 8)
        labelMatches.textColor = .white
        
        switch indexPath.row {
        case 0:
            return viewForEvents
        case 1:
            return viewForStatistics
        case 2:
            return viewForLineUps
        case 3:
            return viewForH2H
        case 4:
            return viewForSection
        default:
            return UIView()
        }
    }
}
