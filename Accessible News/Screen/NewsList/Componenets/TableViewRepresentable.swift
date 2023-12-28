//
//  TableViewRepresentable.swift
//  Accessible News
//
//  Created by Saba Gogrichiani on 28.12.23.
//

import SwiftUI

struct TableViewRepresentable: UIViewRepresentable {
    
    @EnvironmentObject var viewModel: NewsListViewModel
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    func makeUIView(context: Context) -> UITableView {
            let tableView = UITableView(frame: .zero, style: .grouped)
            tableView.delegate = context.coordinator
            tableView.dataSource = context.coordinator
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)

            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 120

            return tableView
        }
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
    
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var viewModel: NewsListViewModel
        
        init(viewModel: NewsListViewModel) {
            self.viewModel = viewModel
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.news.count
        }

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
                fatalError("Failed to dequeue SpecieTableViewCell")
            }
            
            let newsItem = viewModel.news[indexPath.row]
            cell.configure(with: newsItem)
            
            return cell
        }
    }
}
