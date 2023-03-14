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

import Foundation


// This is a port of Python's shlex.quote
// https://github.com/python/cpython/blob/5ffdaf748d98da6065158534720f1996a45a0072/Lib/shlex.py#L323


/// `ShellQuote` is a micro-library to return shell-escaped input for use in POSIX shells.
public struct ShellQuote {
    private static let unsafe = #"[^\w@%+=:,./-]"#

    /// Returns true if input contains characters that require quoting.
    /// - Parameter input: input string
    /// - Returns: true/false signifying unsafe content
    public static func hasUnsafeContent(_ input: String) -> Bool {
        input.range(of: unsafe, options: .regularExpression) != nil
    }

    /// Return a shell-escaped version of the input string.
    ///
    /// The input string will be wrapped in single quotes (') and all existing single quotes within the string
    /// will be escaped via double quotes: "'".
    ///
    /// For example, $'b will be quoted as '$'"'"'b'.
    /// - Parameter input: input string
    /// - Returns: shell-escaped output string
    public static func quote(_ input: String) -> String {
        if !hasUnsafeContent(input) { return input }
        return "'" + input.replacingOccurrences(of: "'", with: #"'"'"'"#) + "'"
    }
}
