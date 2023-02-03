# CXX2SwiftDemoLib

This project builds a library and a header file so that the library can be used in a C++ project.

You will find the library file and the CXX2SwiftDemoLib-Swift.h header generated by the Swift build under the .build directory.

Swift 5.8 or later is to be used.

Use the following C++ code in your C++ project:

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

- Place the CXX2SwiftDemoLib-Swift.h header to where the C++ source file is.
- Place the libCXX2SwiftDemoLib.\* libary file should be placed where the linker can find it, on macOS e.g. `/usr/local/lib` or the build directory.
- Including the C++ interop core headers that ship as are part of the Swift distribution. You should add an include path to your clang compilation that points to something like `<SWIFT_TOOLCHAIN_DIR>/usr/lib/swift/`.

Use the following build command:

```bash
xcrun --toolchain "Swift Development Snapshot" clang++ main.cpp -lCXX2SwiftDemoLib -o CXX2SwiftDemoApp -v
```

The resulting program CXX2SwiftDemoApp prints the following:

```text
Hello, World! 9
```

Also see the description in the CXX2SwiftDemoLib.swift file.

## Acknowledgements

The initial version was exposed in the Swift forums by user 
Datagram see [there](https://forums.swift.org/t/report-swift-and-c-interoperability-project-progress-in-the-swift-5-7-time-frame/61005/21) and [there](https://forums.swift.org/t/report-swift-and-c-interoperability-project-progress-in-the-swift-5-7-time-frame/61005/22).