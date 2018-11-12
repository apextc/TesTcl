source src/on.tcl
source src/assert.tcl
source src/onirule.tcl
source src/it.tcl
source src/irulehttp.tcl
namespace import ::testcl::*

# Comment out to suppress logging
#log::lvSuppressLE info 0

it "should allow access to variables using run variable arg" {
  event HTTP_REQUEST
  run irules/variables_irule.tcl simple { status 1 }
  endstate pool foo
}

it "should allow access to variables using setvar" {
  setvar testVar 5
  event HTTP_REQUEST
  run irules/variables_irule.tcl simple
  endstate pool foo
}

it "should test irule without variables set" {
  event HTTP_REQUEST
  run irules/variables_irule.tcl simple
  endstate pool bar
}
