import UIKit
import Quick
import Nimble

@testable import Decode_techniques

final class FeedbackTests: QuickSpec {
    override func spec() {
        var sut: Feedback!
        
        describe("#init") {
            context("success") {
                beforeEach {
                    sut = Feedback.success
                }
                
                it("has the expected servide id") {
                    expect(sut.status) == "Sucesso"
                }
                
                it("has the expected servide id") {
                    expect(sut.color) == .green
                }
            }
            
            context("waiting") {
                beforeEach {
                    sut = Feedback.waiting
                }
                
                it("has the expected servide id") {
                    expect(sut.status) == "Aguarde"
                }
                
                it("has the expected servide id") {
                    expect(sut.color) == .blue
                }
            }

            context("failure") {
                beforeEach {
                    sut = Feedback.failure
                }
                
                it("has the expected servide id") {
                    expect(sut.status) == "Falha"
                }
                
                it("has the expected servide id") {
                    expect(sut.color) == .red
                }
            }
        }
    }
}
