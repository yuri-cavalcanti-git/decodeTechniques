import UIKit
import Quick
import Nimble

@testable import Decode_techniques
// Nos outros testes utilizo o FixtureHelper para fazer o decode

final class ExampleModelTests: QuickSpec {
    override func spec() {
        var sut: ExampleModel?
        
        describe("#decode") {
            var decoder: JSONDecoder!
            
            context("has all parameters") {
                beforeEach {
                    decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    sut = try? decoder.decode(ExampleModel.self, from: ExampleModel.dataStub())
                    // se precisar stubar apenas uma string, fazer assim: "\"Arthur_Morgan\""
                }
                
                it("decode without errors") {
                    expect(sut).toNot(beNil())
                }
                
                it("decode right attributes") {
                    expect(sut) == .stub()
                }
            }
            
            context("some parameters are null") {
                beforeEach {
                    decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    sut = try? decoder.decode(ExampleModel.self, from: ExampleModel.dataStubWithoutParams())
                }
                
                it("decode without errors") {
                    expect(sut).toNot(beNil())
                }
                
                it("decode right attributes") {
                    expect(sut) == .stub(product: .boleto, limitExceed: false)
                }
            }
        }
    }
}
