import UIKit
import Quick
import Nimble

@testable import Decode_techniques

final class ModelEnumWithVarsTests: QuickSpec {
    override func spec() {
        var sut: ModelEnumWithVars?
        
        describe("#decode") {
            context("has all parameters") {
                it("decode right attributes") {
                    guard let model: ModelEnumWithVars = FixtureHelper.decode(from: "ModelEnumWithVars") else {
                        fail("failed to decode from json")
                        return
                    }
                    
                    expect(model) == .stub()
                    expect(model.service) == .gas
                }
            }
            
            context("id is invalid") {
                it("decode right attributes") {
                    guard let model: ModelEnumWithVars = FixtureHelper.decode(from: "ModelEnumWithVarsInvalidId") else {
                        fail("failed to decode from json")
                        return
                    }
                    
                    expect(model) == .stub(id: "Invalid")
                    expect(model.service) == .other
                }
            }
            
            context("gas service") {
                beforeEach {
                    sut = createSut(with: .gas)
                }
                
                it("has the expected servide id") {
                    expect(sut?.service.rawValue) == "123"
                }
                
                it("has the expected servide id") {
                    expect(sut?.service.label) == "gás"
                }
            }
            
            context("energy service") {
                beforeEach {
                    sut = createSut(with: .energy)
                }
                
                it("has the expected servide id") {
                    expect(sut?.service.rawValue) == "456"
                }
                
                it("has the expected servide id") {
                    expect(sut?.service.label) == "energia"
                }
            }
            
            context("other service") {
                beforeEach {
                    sut = createSut(with: .other)
                }
                
                it("has the expected servide id") {
                    expect(sut?.service.rawValue) == "other"
                }
                
                it("has the expected servide id") {
                    expect(sut?.service.label) == "Outro serviço"
                }
            }
            
            func createSut(with service: ModelEnumWithVars.Service) -> ModelEnumWithVars {
                ModelEnumWithVars(id: service.rawValue)
            }
        }
    }
}
