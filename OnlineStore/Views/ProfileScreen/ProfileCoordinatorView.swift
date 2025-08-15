//
//  ProfileCoordinatorView.swift
//  OnlineStore
//
//  Created by Паша Настусевич on 8.08.25.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ProfileView(viewModel: viewModel)
    }
}
