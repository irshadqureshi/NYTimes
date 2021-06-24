//
//  SearchModel.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

// MARK: - SearchModel
public struct SearchModel: Codable {
    public let status, copyright: String?
    public let response: Response?
}

// MARK: - Response
public struct Response: Codable {
    public let docs: [SearchDocModel]?
    public let meta: Meta?
}

// MARK: - Doc
public struct SearchDocModel: Codable {
    public let abstract: String?
    public let webURL: String?
    public let snippet, leadParagraph, printSection, printPage: String?
    public let source: String?
    public let headline: Headline?
    public let pubDate: String?
    public let documentType: String?
    public let newsDesk: String?
    public let sectionName: String?
    public let typeOfMaterial: String?
    public let id: String?
    public let wordCount: Int?
    public let uri: String?

    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case printSection = "print_section"
        case printPage = "print_page"
        case source, headline
        case pubDate = "pub_date"
        case documentType = "document_type"
        case newsDesk = "news_desk"
        case sectionName = "section_name"
        case typeOfMaterial = "type_of_material"
        case id = "_id"
        case wordCount = "word_count"
        case uri
    }
}


// MARK: - Person
public struct Person: Codable {
    public let firstname, middlename, lastname: String?
    public let role, organization: String?
    public let rank: Int?
}

public enum DocumentType: String, Codable {
    case article = "article"
}

// MARK: - Headline
public struct Headline: Codable {
    public let main, kicker: String?
    public let printHeadline: String?

    enum CodingKeys: String, CodingKey {
        case main, kicker
        case printHeadline = "print_headline"
    }
}


// MARK: - Meta
public struct Meta: Codable {
    public let hits, offset, time: Int?
}
