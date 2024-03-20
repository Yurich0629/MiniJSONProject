//
//  InfoList.swift
//  MiniJSONProject
//
//  Created by Илья Десятов on 26.02.2024.
//

import UIKit

// MARK: - Welcome
struct MainJsonProperies: Decodable {
    let count: Int
    let entries: [EntryDates]
}

// MARK: - Entry
struct EntryDates: Decodable {
    let api, description: String
    let https: Bool
    let link: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case api = "API"
        case description = "Description"
        case https = "HTTPS"
        case link = "Link"
        case category = "Category"
    }
}

