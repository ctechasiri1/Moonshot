//
//  Mission.swift
//  Moonshot
//
//  Created by Chiraphat Techasiri on 11/3/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let descripton: String
}
