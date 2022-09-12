//
//  File.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.09.22.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    func createTableViewHeaderForStandingVC(indexPath:IndexPath, view: UIView) -> UIView {
        let viewForSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForSection.backgroundColor = .blue
        let viewForResults = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForResults.backgroundColor = .blue
        let viewForCalendar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForCalendar.backgroundColor = .blue
        let labelResults = UILabel()
        let labelCalendar = UILabel()
        let labelNumberTeam = UILabel()
        let labelTeam = UILabel()
        let labelPTS = UILabel()
        let labelGoals = UILabel()
        let labelMatches = UILabel()
        DispatchQueue.main.async {
            labelResults.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(20)
                make.leading.equalTo(viewForResults).inset(15)
                make.top.equalTo(viewForResults).inset(5)
            }
            labelCalendar.snp.makeConstraints { make in
                make.width.equalTo(100)
                make.height.equalTo(20)
                make.leading.equalTo(viewForCalendar).inset(15)
                make.top.equalTo(viewForCalendar).inset(5)
            }
            labelNumberTeam.snp.makeConstraints { make in
                make.width.equalTo(10)
                make.height.equalTo(20)
                make.leading.equalTo(viewForSection).inset(15)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelTeam.snp.makeConstraints { make in
                make.width.equalTo(60)
                make.height.equalTo(20)
                make.leading.equalTo(viewForSection).inset(34)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelPTS.snp.makeConstraints { make in
                make.width.equalTo(35)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(0)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelGoals.snp.makeConstraints { make in
                make.width.equalTo(15)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(58)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelMatches.snp.makeConstraints { make in
                make.width.equalTo(15)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(105)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelCalendar.text = "CALENDAR"
            labelCalendar.textColor = .white
            labelResults.text = "RESULTS"
            labelResults.textColor = .white
            labelNumberTeam.font = UIFont(name: "System", size: 8)
            labelNumberTeam.text = "#"
            labelNumberTeam.textColor = .white
            labelTeam.font = UIFont(name: "System", size: 8)
            labelTeam.text = "TEAM"
            labelTeam.textColor = .white
            labelPTS.font = UIFont(name: "System", size: 8)
            labelPTS.text = "PTS"
            labelPTS.textColor = .white
            labelGoals.text = "G"
            labelGoals.font = UIFont(name: "System", size: 8)
            labelGoals.textColor = .white
            labelMatches.text = "M"
            labelMatches.font = UIFont(name: "System", size: 8)
            labelMatches.textColor = .white
        }
        viewForResults.addSubview(labelResults)
        viewForCalendar.addSubview(labelCalendar)
        viewForSection.addSubview(labelNumberTeam)
        viewForSection.addSubview(labelTeam)
        viewForSection.addSubview(labelPTS)
        viewForSection.addSubview(labelGoals)
        viewForSection.addSubview(labelMatches)
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
        viewForSection.backgroundColor = .blue
        let viewForResults = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForResults.backgroundColor = .blue
        let viewForPlayers = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForPlayers.backgroundColor = .blue
        let viewForCalendar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForCalendar.backgroundColor = .blue
        let labelPlayers = UILabel()
        let labelResults = UILabel()
        let labelCalendar = UILabel()
        let labelNumberTeam = UILabel()
        let labelTeam = UILabel()
        let labelPTS = UILabel()
        let labelGoals = UILabel()
        let labelMatches = UILabel()
        DispatchQueue.main.async {
            labelPlayers.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(20)
                make.leading.equalTo(viewForPlayers).inset(15)
                make.top.equalTo(viewForPlayers).inset(5)
            }
            labelResults.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(20)
                make.leading.equalTo(viewForResults).inset(15)
                make.top.equalTo(viewForResults).inset(5)
            }
            labelCalendar.snp.makeConstraints { make in
                make.width.equalTo(100)
                make.height.equalTo(20)
                make.leading.equalTo(viewForCalendar).inset(15)
                make.top.equalTo(viewForCalendar).inset(5)
            }
            labelNumberTeam.snp.makeConstraints { make in
                make.width.equalTo(10)
                make.height.equalTo(20)
                make.leading.equalTo(viewForSection).inset(15)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelTeam.snp.makeConstraints { make in
                make.width.equalTo(60)
                make.height.equalTo(20)
                make.leading.equalTo(viewForSection).inset(34)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelPTS.snp.makeConstraints { make in
                make.width.equalTo(35)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(0)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelGoals.snp.makeConstraints { make in
                make.width.equalTo(15)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(58)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelMatches.snp.makeConstraints { make in
                make.width.equalTo(15)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(105)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelResults.text = "RESULTS"
            labelResults.textColor = .white
            labelPlayers.text = "PLAYERS"
            labelPlayers.textColor = .white
            labelCalendar.text = "CALENDAR"
            labelCalendar.textColor = .white
            labelNumberTeam.font = UIFont(name: "System", size: 8)
            labelNumberTeam.text = "#"
            labelNumberTeam.textColor = .white
            labelTeam.font = UIFont(name: "System", size: 8)
            labelTeam.text = "TEAM"
            labelTeam.textColor = .white
            labelPTS.font = UIFont(name: "System", size: 8)
            labelPTS.text = "PTS"
            labelPTS.textColor = .white
            labelGoals.text = "G"
            labelGoals.font = UIFont(name: "System", size: 8)
            labelGoals.textColor = .white
            labelMatches.text = "M"
            labelMatches.font = UIFont(name: "System", size: 8)
            labelMatches.textColor = .white
        }
        viewForSection.addSubview(labelGoals)
        viewForSection.addSubview(labelPTS)
        viewForSection.addSubview(labelTeam)
        viewForCalendar.addSubview(labelCalendar)
        viewForSection.addSubview(labelNumberTeam)
        viewForSection.addSubview(labelMatches)
        viewForPlayers.addSubview(labelPlayers)
        viewForResults.addSubview(labelResults)

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
        viewForSection.backgroundColor = .blue
        let viewForEvents = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForEvents.backgroundColor = .blue
        let viewForStatistics = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForStatistics.backgroundColor = .blue
        let viewForLineUps = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForLineUps.backgroundColor = .blue
        let viewForH2H = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        viewForH2H.backgroundColor = .blue
        let labelLineUps = UILabel()
        let labelH2H = UILabel()
        let labelNumberTeam = UILabel()
        let labelTeam = UILabel()
        let labelPTS = UILabel()
        let labelGoals = UILabel()
        let labelMatches = UILabel()
        let labelEvents = UILabel()
        let labelStatistics = UILabel()
        DispatchQueue.main.async {
            labelEvents.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(20)
                make.leading.equalTo(viewForEvents).inset(15)
                make.top.equalTo(viewForEvents).inset(5)
            }
            labelH2H.snp.makeConstraints { make in
                make.width.equalTo(150)
                make.height.equalTo(20)
                make.leading.equalTo(viewForH2H).inset(15)
                make.top.equalTo(viewForH2H).inset(5)
            }
            labelStatistics.snp.makeConstraints { make in
                make.width.equalTo(100)
                make.height.equalTo(20)
                make.leading.equalTo(viewForStatistics).inset(15)
                make.top.equalTo(viewForStatistics).inset(5)
            }
            labelLineUps.snp.makeConstraints { make in
                make.width.equalTo(100)
                make.height.equalTo(20)
                make.leading.equalTo(viewForLineUps).inset(15)
                make.top.equalTo(viewForLineUps).inset(5)
            }
            labelNumberTeam.snp.makeConstraints { make in
                make.width.equalTo(10)
                make.height.equalTo(20)
                make.leading.equalTo(viewForSection).inset(15)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelTeam.snp.makeConstraints { make in
                make.width.equalTo(60)
                make.height.equalTo(20)
                make.leading.equalTo(viewForSection).inset(34)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelPTS.snp.makeConstraints { make in
                make.width.equalTo(35)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(0)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelGoals.snp.makeConstraints { make in
                make.width.equalTo(15)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(58)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelMatches.snp.makeConstraints { make in
                make.width.equalTo(15)
                make.height.equalTo(20)
                make.trailing.equalTo(viewForSection).inset(105)
                make.top.equalTo(viewForSection).inset(5)
            }
            labelEvents.text = "EVENTS"
            labelEvents.textColor = .white
            labelStatistics.text = "STATISTICS"
            labelStatistics.textColor = .white
            labelLineUps.text = "LINEUPS"
            labelLineUps.textColor = .white
            labelH2H.text = "HEAD TO HEAD"
            labelH2H.textColor = .white
            labelNumberTeam.font = UIFont(name: "System", size: 8)
            labelNumberTeam.text = "#"
            labelNumberTeam.textColor = .white
            labelTeam.font = UIFont(name: "System", size: 8)
            labelTeam.text = "TEAM"
            labelTeam.textColor = .white
            labelPTS.font = UIFont(name: "System", size: 8)
            labelPTS.text = "PTS"
            labelPTS.textColor = .white
            labelGoals.text = "G"
            labelGoals.font = UIFont(name: "System", size: 8)
            labelGoals.textColor = .white
            labelMatches.text = "M"
            labelMatches.font = UIFont(name: "System", size: 8)
            labelMatches.textColor = .white
        }
        viewForEvents.addSubview(labelEvents)
        viewForSection.addSubview(labelMatches)
        viewForSection.addSubview(labelGoals)
        viewForSection.addSubview(labelPTS)
        viewForSection.addSubview(labelTeam)
        viewForSection.addSubview(labelNumberTeam)
        viewForH2H.addSubview(labelH2H)
        viewForLineUps.addSubview(labelLineUps)
        viewForStatistics.addSubview(labelStatistics)
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
