//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Mark Meretzky on 1/29/19.
//

import Foundation;

struct Athlete {
    var name: String;
    var age: String;
    var league: String;
    var team: String;
    
    init?(name: String, age: String, league: String, team: String) {
        if name.isEmpty || age.isEmpty || league.isEmpty || team.isEmpty {
            return nil;
        }
        self.name = name;
        self.age = age;
        self.league = league;
        self.team = team;
    }
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league).";
    }
}
