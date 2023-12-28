//
//  ServiceManager.swift
//  Accessible News
//
//  Created by Saba Gogrichiani on 28.12.23.
//

import Foundation

final class ServiceManager {
    
    static let shared = ServiceManager()
    private init() {}
    
    func fetchNews() async throws -> News {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2023-11-27&sortBy=popularity&apiKey=0e34480169b5418f9fc2a24453bd454d") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let newsData = try decoder.decode(News.self, from: data)
            return newsData
        } catch {
            throw error
        }
    }
    
}
