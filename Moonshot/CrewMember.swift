//
//  CrewMember.swift
//  Moonshot
//
//  Created by Chiraphat Techasiri on 11/25/24.
//

import Foundation

// Create new Swift file to share the CrewMember object between views
struct CrewMember: Identifiable, Hashable {
    let id = UUID()
    let role: String
    let astronaut: Astronaut
}
