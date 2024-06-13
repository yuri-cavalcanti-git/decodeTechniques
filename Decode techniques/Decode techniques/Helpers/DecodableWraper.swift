@propertyWrapper

struct CodableBool: Equatable {
    var wrappedValue: Bool
    
    init(wrappedValue: Bool) {
        self.wrappedValue = wrappedValue
    }
}

extension CodableBool: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Bool.self)
    }
}

extension CodableBool: Encodable {
    func encode (to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

extension KeyedDecodingContainer {
    func decode(_ type: CodableBool.Type,
                forKey key: Key) throws -> CodableBool {
        try decodeIfPresent(type, forKey: key) ?? .init(wrappedValue: false)
    }
}
