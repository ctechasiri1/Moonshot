//
//  ListView.swift
//  Moonshot
//
//  Created by Chiraphat Techasiri on 11/25/24.
//

import SwiftUI
struct ListView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }

    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return ListView(astronauts: astronauts, missions: missions)
}
