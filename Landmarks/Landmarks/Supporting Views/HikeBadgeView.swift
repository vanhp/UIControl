//
//  HikeBadgeView.swift
//  Landmarks
//
//  Created by vphom on 10/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct HikeBadgeView: View {
    var name: String
    
    var body: some View {
        VStack(alignment:.center){
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HikeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadgeView(name: "Preview Testing")
    }
}
