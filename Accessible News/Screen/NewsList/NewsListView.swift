//
//  ContentView.swift
//  Accessible News
//
//  Created by Saba Gogrichiani on 27.12.23.
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var viewModel: NewsListViewModel
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            TableViewRepresentable()
                .navigationTitle("News 🗞️")
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .environmentObject(NewsListViewModel())
    }
}


