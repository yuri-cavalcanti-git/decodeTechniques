import Foundation

/*
 Tecnica: Temos um bool que pode não retornar do back, pra nao deixar o bool como opcional, utilizei esse helper @CodableBool que pode ser reaproveitado em outros models
*/

struct ModelCodableBool: Equatable, Decodable {
    let id: String
    @CodableBool var limitExceeded: Bool
}
