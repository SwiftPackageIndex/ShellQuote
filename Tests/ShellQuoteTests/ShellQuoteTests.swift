// Copyright Dave Verwer, Sven A. Schmidt, and other contributors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
