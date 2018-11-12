source src/global.tcl
source src/assert.tcl

namespace import ::testcl::*

# Comment out to suppress logging
#log::lvSuppressLE info 0

assertStringEquals [getfield "foo:bar" "|" 0] ""
assertStringEquals [getfield "foo:bar" ":" 0] ""
assertStringEquals [getfield "foo:bar" ":" 1] "foo"
assertStringEquals [getfield "foo:bar" ":" 2] "bar"
assertStringEquals [getfield "foo:bar" ":" 3] ""

assertStringEquals [b64encode ""] ""
assertStringEquals [b64encode "f"] "Zg=="
assertStringEquals [b64encode "fo"] "Zm8="
assertStringEquals [b64encode "foo"] "Zm9v"
assertStringEquals [b64encode "foob"] "Zm9vYg=="
assertStringEquals [b64encode "fooba"] "Zm9vYmE="
assertStringEquals [b64encode "foobar"] "Zm9vYmFy"

assertStringEquals [b64decode ""] ""
assertStringEquals [b64decode "Zg=="] "f"
assertStringEquals [b64decode "Zm8="] "fo"
assertStringEquals [b64decode "Zm9v"] "foo"
assertStringEquals [b64decode "Zm9vYg=="] "foob"
assertStringEquals [b64decode "Zm9vYmE="] "fooba"
assertStringEquals [b64decode "Zm9vYmFy"] "foobar"

assertStringEquals [domain "www.test.local.com" 0] ""
assertStringEquals [domain "www.test.local.com" 1] "com"
assertStringEquals [domain "www.test.local.com" 2] "local.com"
assertStringEquals [domain "www.test.local.com" 3] "test.local.com"
assertStringEquals [domain "www.test.local.com" 4] "www.test.local.com"
assertStringEquals [domain "www.test.local.com" 10] "www.test.local.com"
