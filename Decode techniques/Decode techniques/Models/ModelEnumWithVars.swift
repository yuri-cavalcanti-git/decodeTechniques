import Foundation

/*
 Tecnica 1: De acordo com o recebido no id, o service {q nao vem de back, variavel auxiliar} recebe um case, caso nao esteja mapeado, recebe o case other
 Tecnica 2: O enum retorna uma variavel computada de acordo com cada case. Muito util para popular um viewModel devolvendo labels, icons, colors etc para cada case. Desde ser uma computed var, poderia ser uma func.
*/

struct ModelEnumWithVars: Equatable, Decodable {
    let id: String
    var service: Service { Service(id: id) }
}

extension ModelEnumWithVars {
    enum Service: String {
        case gas = "123"
        case energy = "456"
        case other
        
        init(id: String) {
            self = Service(rawValue: id) ?? .other
        }
        
        var label: String {
            switch self {
            case .gas:
                return "gás"
            case .energy:
                return "energia"
            case .other:
                return "Outro serviço"
            }
        }
    }
}
