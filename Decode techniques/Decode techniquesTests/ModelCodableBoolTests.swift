import UIKit
import Quick
import Nimble

@testable import Decode_techniques

final class ModelCodableBoolTests: QuickSpec {
    override func spec() {
        var sut: ModelCodableBool?
        
        describe("#decode") {
            context("has all parameters") {
                it("decode right attributes") {
                    guard let model: ModelCodableBool = FixtureHelper.decode(from: "ModelCodableBool") else {
                        fail("failed to decode from json")
                        return
                    }
                    
                    expect(model) == .stub()
                }
            }
            
            context("some parameters are null") {
                it("decode right attributes") {
                    guard let model: ModelCodableBool = FixtureHelper.decode(from: "ModelCodableBoolWithoutParams") else {
                        fail("failed to decode from json")
                        return
                    }
                    
                    expect(model) == .stub(limitExceed: false)
                }
            }
        }
    }
}
