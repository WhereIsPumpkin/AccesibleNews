//
//  NewsListViewModel.swift
//  Accessible News
//
//  Created by Saba Gogrichiani on 28.12.23.
//

import Foundation

final class NewsListViewModel: ObservableObject {
    @Published var news: [Article] = []
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        Task {
            do {
                let data = try await ServiceManager.shared.fetchNews()
                DispatchQueue.main.async {
                    self.news = data.articles
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
