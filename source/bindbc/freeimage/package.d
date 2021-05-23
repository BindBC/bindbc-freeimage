//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freeimage;

public import bindbc.freeimage.types;

version(BindBC_Static) version = BindFI_Static;
version(BindFI_Static) public import bindbc.freeimage.bindstatic;
else public import bindbc.freeimage.binddynamic;