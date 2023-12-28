//
//  Accessible_NewsApp.swift
//  Accessible News
//
//  Created by Saba Gogrichiani on 27.12.23.
//

import SwiftUI

@main
struct Accessible_NewsApp: App {
    
    @StateObject var viewModel = NewsListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NewsListView()
                .environmentObject(viewModel)
        }
    }
}
