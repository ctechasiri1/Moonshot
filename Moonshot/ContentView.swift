//
//  ContentView.swift
//  Moonshot
//
//  Created by Chiraphat Techasiri on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var listViewIsTrue: Bool = false
    
    var body: some View {
        NavigationStack {
            // group lets you return mutliple views at once
            Group {
                if listViewIsTrue {
                    ListView(astronauts: astronauts, missions: missions)
                }
                else {
                    // it looks wonky without a SrollView
                    GridView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                    Button(action: {
                        listViewIsTrue.toggle()
                    }, label: {
                        Image(systemName: listViewIsTrue ? "square.grid.2x2" : "list.bullet")
                            .foregroundColor(.white)
                    })
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautView(astronaut: astronaut)
            }
        }
    }
}

#Preview {
    ContentView()
}
