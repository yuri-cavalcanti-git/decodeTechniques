import UIKit
import Quick
import Nimble

@testable import Decode_techniques

final class ModelEnumCaseUnknownTests: QuickSpec {
    override func spec() {
        var sut: ModelEnumCaseUnknown?
        
        describe("#decode") {
            context("has all parameters") {
                it("decode right attributes") {
                    guard let model: ModelEnumCaseUnknown = FixtureHelper.decode(from: "ModelEnumCaseUnknown") else {
                        fail("failed to decode from json")
                        return
                    }
                    
                    expect(model) == .stub()
                }
            }
            
            context("status is invalid") {
                it("decode right attributes") {
                    guard let model: ModelEnumCaseUnknown = FixtureHelper.decode(from: "ModelEnumCaseUnknownInvalidStatus") else {
                        fail("failed to decode from json")
                        return
                    }
                    
                    expect(model) == .stub(status: .unknown)
                }
            }
        }
    }
}
