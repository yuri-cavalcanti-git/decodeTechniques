import Foundation

@testable import Decode_techniques

// MARK: ExampleModel
extension ExampleModel {
    static func stub(id: String = "123",
                     product: ProductType = .concessionaria,
                     limitExceed: Bool = true) -> ExampleModel {
        ExampleModel(id: id,
                     product: product,
                     limitExceed: limitExceed)
    }
    
    static func dataStub() -> Data {
        let resultJson = """
        {
            "id": "123",
            "product": "CONCESSIONARIA",
            "limitExceed": true
        }
        """
        return resultJson.data(using: .utf8)!
    }
    
    static func dataStubWithoutParams() -> Data {
        let resultJson = """
        {
            "id": "123"
        }
        """
        return resultJson.data(using: .utf8)!
    }
}

// MARK: ModelCodableBool
extension ModelCodableBool {
    static func stub(id: String = "123",
                     limitExceed: Bool = true) -> ModelCodableBool {
        ModelCodableBool(id: id,
                         limitExceeded: limitExceed)
    }
    
    static func dataStub() -> Data {
        let resultJson = """
        {
            "id": "123",
            "limitExceed": true
        }
        """
        return resultJson.data(using: .utf8)!
    }
    
    static func dataStubWithoutParams() -> Data {
        let resultJson = """
        {
            "id": "123"
        }
        """
        return resultJson.data(using: .utf8)!
    }
}

// MARK: ModelEnumCaseUnknown
extension ModelEnumCaseUnknown {
    static func stub(id: String = "123",
                     status: Status = .active) -> ModelEnumCaseUnknown {
        ModelEnumCaseUnknown(id: id,
                             status: status)
    }
    
    static func dataStub() -> Data {
        let resultJson = """
        {
            "id": "123",
            "status": "ACTIVE"
        }
        """
        return resultJson.data(using: .utf8)!
    }
    
    static func dataStubUnknownStatus() -> Data {
        let resultJson = """
        {
            "id": "123",
            "status": "Invalid"
        }
        """
        return resultJson.data(using: .utf8)!
    }
}

// MARK: ModelEnumWithVars
extension ModelEnumWithVars {
    static func stub(id: String = "123") -> ModelEnumWithVars {
        ModelEnumWithVars(id: id)
    }
    
    static func dataStub() -> Data {
        let resultJson = """
        {
            "id": "123"
        }
        """
        return resultJson.data(using: .utf8)!
    }
    
    static func dataStubUnknownId() -> Data {
        let resultJson = """
        {
            "id": "Invalid"
        }
        """
        return resultJson.data(using: .utf8)!
    }
}
