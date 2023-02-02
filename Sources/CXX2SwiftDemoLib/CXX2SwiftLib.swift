// Ultra simple Swift library
// CXX2SwiftDemo.swift

import Foundation

// Expose a Swift function to C++
// The function must be public

// To expose _all_ the public functions, use the flag -Xfrontend -clang-header-expose-decls=all-public
// The @_expose attribute can be used to expose the function using a different name, useful when dealing with function overloads
// ref: https://github.com/apple/swift/blob/main/docs/CppInteroperability/UserGuide-CallingSwiftFromC%2B%2B.md

// Note: in the UserGuide this attribute looks like @expose(C++, foo) however,
// at least in the 5.8 and latest toolchain snapshot we must instead write @_expose(Cxx, "foo")

//@_expose(Cxx, "my_exposed_swift_add")
public func my_swift_add(a: Int64, b: Int64) -> Int64 {
    return a + b
}
