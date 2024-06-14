import UIKit

/*
 Tecnica: O enum retorna variaveis computadas de acordo com cada case. Muito util para popular um viewModel devolvendo labels, icons, colors etc para cada case. Desde ser uma computed var, poderia ser uma func.
*/

enum Feedback {
    case success
    case waiting
    case failure
    
    var status: String {
        switch self {
        case .success:
            return "Sucesso"
        case .waiting:
            return "Aguarde"
        case .failure:
            return "Falha"
        }
    }
    
    var color: UIColor {
        switch self {
        case .success:
            return .green
        case .waiting:
            return .blue
        case .failure:
            return .red
        }
    }
}
