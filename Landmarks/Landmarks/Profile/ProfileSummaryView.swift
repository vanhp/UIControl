//
//  ProfileSummaryView.swift
//  Landmarks
//
//  Created by vphom on 10/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummaryView: View {
    
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List{
            
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On":"Off")")
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue  )")
            Text("Goal Date: \(self.profile.goalDate,formatter: Self.goalFormat)" )
            
            VStack(alignment: .leading){
                Text("Completed Badge")
                    .font(.headline)
                ScrollView {
                    HStack {
                        HikeBadgeView(name: "First Hike")
                        HikeBadgeView(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                            
                        HikeBadgeView(name: "Tenth Hike")
                            .grayscale(0.50)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height:130)
                
            }
            VStack(alignment:.leading){
                Text("Recent Hikes")
                    .font(.headline)
                HikeView(hike: hikeData[0])
            }
        }
      
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: Profile.default)
    }
}
