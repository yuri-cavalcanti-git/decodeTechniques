import Foundation

/*
 Tecnica: Dado um enum que os cases dele dependem da String que vem do back, caso a string nao esteja mapeada o case vai para o unknown.
 Excelente tecnica para mapear Errors enviados pelo back numa possivel tela de feedback
*/

struct ModelEnumCaseUnknown: Equatable, Decodable {
    let id: String
    let status: Status
}

extension ModelEnumCaseUnknown {
    enum Status: String, Decodable {
        case active = "ACTIVE"
        case cancel = "CANCEL"
        case unknown
        
        init(from decoder: Decoder) throws {
            let rawValue = try decoder.singleValueContainer().decode(RawValue.self)
            self = Status(rawValue: rawValue) ?? .unknown
        }
    }
}
