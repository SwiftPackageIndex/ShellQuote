import XCTest
@testable import ShellQuote

final class ShellQuoteTests: XCTestCase {

    func test_hasUnsafeContent() throws {
        XCTAssertFalse(ShellQuote.hasUnsafeContent(""))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("abc"))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("@"))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("%"))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("+"))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("="))
        XCTAssertFalse(ShellQuote.hasUnsafeContent(":"))
        XCTAssertFalse(ShellQuote.hasUnsafeContent(","))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("."))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("/"))
        XCTAssertFalse(ShellQuote.hasUnsafeContent("-"))

        XCTAssertTrue(ShellQuote.hasUnsafeContent(";"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("&"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent(">"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("<"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("!"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("("))
        XCTAssertTrue(ShellQuote.hasUnsafeContent(")"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("{"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("}"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("["))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("]"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("#"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("$"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("^"))
        XCTAssertTrue(ShellQuote.hasUnsafeContent("*"))
    }

    func test_quote() throws {
        XCTAssertEqual(ShellQuote.quote("$'b"), #"'$'"'"'b'"#)
        XCTAssertEqual(ShellQuote.quote(""), #""#)
        XCTAssertEqual(ShellQuote.quote("abc"), #"abc"#)
        XCTAssertEqual(ShellQuote.quote(";"), #"';'"#)
    }

}
