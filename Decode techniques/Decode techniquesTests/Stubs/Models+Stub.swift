import Foundation

@testable import Decode_techniques

// MARK: ExampleModel
extension ExampleModel {
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
    static func dataStub() -> Data {
        let resultJson = """
        {
            "id": "123",
            "status": "ACTIVE"
        }
        """
        return resultJson.data(using: .utf8)!
    }
    
    static func dataStubUnknownState() -> Data {
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
