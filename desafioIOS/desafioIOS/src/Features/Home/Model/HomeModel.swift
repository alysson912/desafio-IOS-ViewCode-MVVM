// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleData = try? JSONDecoder().decode(PurpleData.self, from: jsonData)

import Foundation
import Alamofire

enum CountryCode: String, Codable {
    case at = "AT"
}

enum TypeElement: String, Codable {
    case typePublic = "Public"
}

// MARK: - Datum
struct Datum: Codable {
    var date, localName, name: String?
    var countryCode: CountryCode?
    var fixed, global: Bool?
    var counties: JSONNull?
    var launchYear: Int?
    var types: [TypeElement]?
}

typealias PurpleData = [Datum]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
