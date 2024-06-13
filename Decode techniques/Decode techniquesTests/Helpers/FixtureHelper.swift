import Foundation

final class FixtureHelper {
    static func data(from file: String,
                     in bundle: Bundle = Bundle(for: FixtureHelper.self),
                     fileExtension: String = "json") -> Data? {
        guard let url = bundle.url(forResource: file, withExtension: fileExtension) else {
            return nil
        }
        
        do {
            return try Data(contentsOf: url, options: .alwaysMapped)
        } catch {
            print("Error \(error) getting data from file \(file.debugDescription)")
            return nil
        }
    }
    
    static func decode<T: Decodable>(from file: String,
                                     in bundle: Bundle = Bundle(for: FixtureHelper.self),
                                     fileExtension: String = "json") -> T? {
        guard let data = data(from: file,
                              in: bundle,
                              fileExtension: fileExtension) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch let error {
            print("Decode error \(error) while decoding from file \(file.debugDescription)")
            return nil
        }
    }
}
