import Foundation

struct ExampleModel: Equatable, Decodable {
    /*
     Tecnica 1: Temos um bool que pode não retornar do back, pra nao deixar o bool como opcional, no decode definaremos como false caso nao venha do back.
     
     Tecnica 2: Temos um product que é um enum, esse product pode nao retornar do back, no decode definiremos um produto padrao caso o product nao venha
    */
    
    let name: String
    let product: ProductType
    let limitExceed: Bool?
}

extension ExampleModel {
    enum CodingKeys: CodingKey {
        case name
        case product
        case limitExceed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        product = try container.decodeIfPresent(ProductType.self, forKey: .product) ?? .boleto
        limitExceed = try container.decodeIfPresent(Bool.self, forKey: .limitExceed) ?? false
    }
}

enum ProductType: String, Codable {
    case boleto = "BOLETO"
    case concessionaria = "CONCESSIONARIA"
}
