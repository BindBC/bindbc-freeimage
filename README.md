# bindbc-freeimage
This project provides both static and dynamic bindings to the [FreeImage library](http://freeimage.sourceforge.net/download.html). They are `@nogc` and `nothrow` compatible and can be compiled for compatibility with `-betterC`. This package is intended as a replacement of [DerelictFI](https://github.com/DerelictOrg/DerelictFI), which is not compatible with `@nogc`,  `nothrow`, or `-betterC`.

## Usage
By default, `bindbc-freeimage` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the FreeImage library, so the FreeImage shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the FreeImage library---either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use FreeImage, add `bindbc-freeimage` as a dependency to your project's package config file. For example, the following is configured to FreeImage as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-freeimage": "~>0.1.0",
}
```

__dub.sdl__
```
dependency "bindbc-freeimage" version="~>0.1.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the FreeImage shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the FreeImage DLL with your program. On other systems, it usually means the user must install the FreeImage runtime library through a package manager.

To load the shared library, you need to call the `loadFreeImage` function. This returns a member of the `FISupport` enumeration (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `FISupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `FISupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `FISupport` indicating a version number that matches the version of FreeImage that `bindbc-freeimage` was configured at compile-time to load. By default, that is `FISupport.fi317`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `fiSupport`.

```d
import bindbc.freeimage;

/*
This version attempts to load the FreeImage shared library using well-known variations
of the library name for the host system.
*/
FISupport ret = loadFreeImage();
if(ret != fiSupport) {

    // Handle error. For most use cases, its reasonable to use the the error handling API in
    // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
    // possible to determine the root cause via the return value:

    if(ret == FISupport.noLibrary) {
        // FreeImage shared library failed to load
    }
    else if(FISupport.badLibrary) {
        // One or more symbols failed to load. The likely cause is that the
        // shared library is for a lower version than bindbc-freeimage was configured
        // to load.
}

/*
This version attempts to load the FreeImage library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `freeimage.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadFreeImage("libs/freeimage.dll")
```
By default, the `bindbc-freeimage` binding is configured to compile to load FreeImage 3.17. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired FreeImage version number. It is recommended that you always select the minimum version you require _and no higher_. In this example, the FreeImage dynamic binding is compiled to support FreeImage 3.18:

__dub.json__
```
"dependencies": {
    "bindbc-freeimage": "~>0.1.0"
},
"versions": ["FI_318"]
```

__dub.sdl__
```
dependency "bindbc-freeimage" version="~>0.1.0"
versions "FI_318"
```

With this example configuration, `fiSupport == FISupport.fi318`. If FreeImage 3.18 or later is installed on the user's system, `loadFreeImage` will return `FISupport.fi318`. If only FreeImage 3.17 is installed, `loadFreeImage` will return `FISupport.badLibrary`. In this scenario, calling `loadedFreeImageVersion()` will return a `FISupport` member indicating which version of FreeImage, if any, actually loaded. If a lower version was loaded, it's still possible to call functions from that version of FreeImage, but any calls to functions from higher versions will result in a null pointer access. For this reason, it's recommended to always specify your required version of the FreeImage library at compile time and abort when you receive an `FISupport.badLibrary` return value from `loadFreeImage`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedFreeImageVersion`. It returns one of the following:

* `FISupport.noLibrary` if `loadFreeImage` returned `FISupport.noLibrary`
* `FISupport.badLibrary` if `loadFreeImage` returned `FISupport.badLibrary` and no version of FreeImage successfully loaded
* a member of `FISupport` indicating the version of FreeImage that successfully loaded. When `loadFreeImage` returns `FISupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `fiSupport`.

The function `isFreeImageLoaded` returns `true` if any version of FreeImage was successfully loaded and `false` otherwise.

Following are the supported versions of FreeImage, the corresponding version IDs to pass to the compiler, and the corresponding `FISupport` members.

| Library & Version  | Version ID       | `FISupport` Member |
|--------------------|------------------|--------------------|
|FreeImage 3.17      | FI_317 (Default) | `FISupport.fi317`  |
|FreeImage 3.18      | FI_318           | `FISupport.fi318`  |

## The static binding
The static binding has a link-time dependency on either the shared or the static FreeImage library. On Windows, you can link with the static library or, to use the shared library (`freeimage.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the FreeImage development package be installed on your system at compile time, either by compiling the FreeImage source yourself, downloading the FreeImage precompiled binaries for Windows, or installing via a system package manager. [See the FreeImage download page](http://freeimage.sourceforge.net/download.html) for details.

When linking with the static library, there is no runtime dependency on FreeImage. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually---loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindFI_Static` version to the compiler and link with the appropriate library.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindFI_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-freeimage` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-freeimage": "~>0.1.0"
},
"versions": ["BindFI_Static"],
"libs": ["freeimage"]
```

__dub.sdl__
```
dependency "bindbc-freeimage" version="~>0.1.0"
versions "BindFI_Static"
libs "freeimage"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-freeimage` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-freeimage": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-freeimage": "static"
},
"libs": ["freeimage"]
```

__dub.sdl__
```
dependency "bindbc-freeimage" version="~>0.1.0"
subConfiguration "bindbc-freeimage" "static"
libs "freeimage"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support

`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-freeimage": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-freeimage": "staticBC"
},
"libs": ["freeimage"]
```

__dub.sdl__
```
dependency "bindbc-freeimage" version="~>0.1.0"
subConfiguration "bindbc-freeimage" "staticBC"
libs "freeimage"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.