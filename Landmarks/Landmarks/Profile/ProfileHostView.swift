//
//  ProfileHostView.swift
//  Landmarks
//
//  Created by vphom on 10/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHostView: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Button("Cancel"){
                    self.draftProfile = self.userData.profile
                    self.mode?.animation().wrappedValue = .inactive
                }
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive{
            
                ProfileSummaryView(profile: draftProfile)
            }else {
                ProfileEditorView(profile: $draftProfile)
                    .onAppear {self.draftProfile = self.userData.profile}
                    .onDisappear{self.userData.profile = self.draftProfile}
            }
         
        }
        .padding()
    }
}

struct ProfileHostView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHostView().environmentObject(UserData())
    }
}
