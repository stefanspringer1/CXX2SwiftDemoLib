# CXX2SwiftDemoLib

This project is a small example for how to call a Swift function from C++. It builds a library file and an according header file so that the library can be used in a C++ project.

You will find the library file and the CXX2SwiftDemoLib-Swift.h header generated by the Swift build under the .build directory.

Swift 5.8 or later is to be used.

Use the following C++ code in your C++ project which calls the Swift function `my_swift_add(a:b:)`:

```C++
//  main.cpp

#include <iostream>
#include <stdint.h>
#include "CXX2SwiftDemoLib-Swift.h"

int main(int argc, const char * argv[]) {
    
    int64_t result = CXX2SwiftDemoLib::my_swift_add(2, 7);
    
    std::cout << "Hello, World! " << result << "\n";
    return 0;
}
```

You need:

- On Windows, you need to explicitely include the C++ interop core headers that ship as are part of the Swift distribution (in the subdirectory swiftToCxx)[^1] in your C++ project. You should add an include path to your clang compilation that points to something like `<SWIFT_TOOLCHAIN_DIR>/usr/lib/swift/` (cf. [this comment on the Swift forums](https://forums.swift.org/t/report-swift-and-c-interoperability-project-progress-in-the-swift-5-7-time-frame/61005/39)).
- Include the CXX2SwiftDemoLib-Swift.h header in your C++ project.
- Add the libCXX2SwiftDemoLib.\* libary file to your C++ project (quick solution: place it where the linker can find it, on macOS e.g. `/usr/local/lib` or the build directory).

[^1]: As of february 2023, you need to copy them from the macOS toolchain.

You might use the following build command when using a development snapshot of the Swift toolchain:

```bash
xcrun --toolchain "Swift Development Snapshot" clang++ main.cpp -lCXX2SwiftDemoLib -o CXX2SwiftDemoApp -v
```

The resulting program CXX2SwiftDemoApp prints the following:

```text
Hello, World! 9
```

Also see the description in the CXX2SwiftDemoLib.swift file.

## References

- [Guide: Calling Swift APIs from C++](https://github.com/apple/swift/blob/main/docs/CppInteroperability/UserGuide-CallingSwiftFromC%2B%2B.md)
- See the [according topic on the Swift forums](https://forums.swift.org/t/report-swift-and-c-interoperability-project-progress-in-the-swift-5-7-time-frame/61005).
- See the [announcement on the Swift forums about updates for Swift in CMake 3.26](https://forums.swift.org/t/updates-for-swift-in-the-upcoming-cmake-3-26/62943).
- Also see the [discussion about incorporating Swift argument labels into generated C++ function names](https://forums.swift.org/t/swift-to-c-incorporating-swift-argument-labels-into-generated-c-function-name/62195).
- [C++ Interop User Manual](https://github.com/apple/swift/blob/main/docs/CppInteroperability/UserManual.md)
- [Getting started with C++ Interoperability](https://github.com/apple/swift/blob/main/docs/CppInteroperability/GettingStartedWithC%2B%2BInterop.md)

## Acknowledgements

The initial version was posted [on the Swift forums by user 
Datagram](https://forums.swift.org/t/report-swift-and-c-interoperability-project-progress-in-the-swift-5-7-time-frame/61005/21).
