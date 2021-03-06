//
//  MostSharedModel.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

// MARK: - MostShared
public struct MostSharedModel: Codable {
    public let status, copyright: String?
    public let numResults: Int?
    public let results: [MostSharedResultModel]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
public struct MostSharedResultModel: Codable {
    public let uri: String?
    public let url: String?
    public let id, assetID: Int?
    public let source: String?
    public let publishedDate, updated, section, subsection: String?
    public let nytdsection, adxKeywords: String?
    public let byline: String?
    public let type: String?
    public let title, abstract: String?
    public let desFacet, orgFacet, perFacet, geoFacet: [String]?
    public let media: [MediaMostShared]?
    public let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
public struct MediaMostShared: Codable {
    public let type: String?
    public let subtype: String?
    public let caption, copyright: String?
    public let approvedForSyndication: Int?
    public let mediaMetadata: [MediaMetadatumMostShared]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
public struct MediaMetadatumMostShared: Codable {
    public let url: String?
    public let format: FormatMostShared?
    public let height, width: Int?
}

public enum FormatMostShared: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

