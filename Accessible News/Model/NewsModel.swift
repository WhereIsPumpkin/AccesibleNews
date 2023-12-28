//
//  NewsModel.swift
//  Accessible News
//
//  Created by Saba Gogrichiani on 28.12.23.
//

import Foundation

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String
    let publishedAt: String
}
