//
//  AstronautScrollView.swift
//  Moonshot
//
//  Created by Chiraphat Techasiri on 11/25/24.
//

import SwiftUI

struct AstronautScrollView: View {
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline.bold())
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationDestination(for: CrewMember.self) { crewMember in
            AstronautView(astronaut: crewMember.astronaut)
        }
    }
}


#Preview {
    //In order for this to work you need to connect both astronaut and missions file together and return the information you want which is a crew member
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let mission = missions[1]
    
    let crew = mission.crew.map { crewMember in
        if let astronaut = astronauts[crewMember.name] {
            return CrewMember(role: crewMember.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(crewMember.name)")
        }
    }
    return AstronautScrollView(crew: crew)
        .preferredColorScheme(.dark)
}
