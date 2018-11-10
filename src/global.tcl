package provide testcl 1.0.12
package require log

namespace eval ::testcl {
  # namespace export accumulate
  # namespace export active_members
  # namespace export active_nodes
  # namespace export after
  namespace export b64decode
  namespace export b64encode
  # namespace export call
  # namespace export CATEGORY::lookup
  # namespace export class
  # namespace export client_addr
  # namespace export client_port
  # namespace export clientside
  # namespace export clone
  # namespace export cpu
  # namespace export crc32
  # namespace export decode_uri
  # namespace export DEMANGLE::disable
  # namespace export DEMANGLE::enable
  # namespace export discard
  # namespace export domain
  # namespace export drop
  # namespace export event
  # namespace export findclass
  # namespace export findstr
  # namespace export forward
  # namespace export FTP::port
  namespace export getfield
  # namespace export HA::status
  # namespace export htonl
  # namespace export htons
  # namespace export http_cookie
  # namespace export http_header
  # namespace export http_host
  # namespace export http_method
  # namespace export http_uri
  # namespace export http_version
  # namespace export iFile
  # namespace export imid
  # namespace export ip_protocol
  # namespace export ip_tos
  # namespace export ip_ttl
  # namespace export lasthop
  # namespace export link_qos
  # namespace export listen
  # namespace export llookup
  # namespace export local_addr
  namespace export log
  # namespace export matchclass
  # namespace export md5
  # namespace export members
  # namespace export nexthop
  # namespace export node
  # namespace export nodes
  # namespace export ntohl
  # namespace export ntohs
  # namespace export Operators
  # namespace export peer
  # namespace export persist
  # namespace export pool
  # namespace export priority
  # namespace export rateclass
  # namespace export redirect
  # namespace export reject
  # namespace export relate_client
  # namespace export relate_server
  # namespace export remote_addr
  # namespace export RESOLV::lookup
  # namespace export return
  # namespace export rmd160
  # namespace export server_addr
  # namespace export server_port
  # namespace export serverside
  # namespace export session
  # namespace export sha1
  # namespace export sha256
  # namespace export sha384
  # namespace export sha512
  # namespace export sharedvar
  # namespace export SMTPS::disable
  # namespace export SMTPS::enable
  # namespace export snat
  # namespace export snatpool
  # namespace export substr
  # namespace export table
  # namespace export tcl_platform
  # namespace export timing
  # namespace export TMM::cmp_count
  # namespace export TMM::cmp_group
  # namespace export TMM::cmp_unit
  # namespace export traffic_group
  # namespace export translate
  # namespace export urlcatquery
  # namespace export use
  # namespace export virtual
  # namespace export vlan_id
  # namespace export when
  # namespace export whereis
}

# testcl::b64decode --
#
# stub for the iRule GLOBAL::b64decode - decodes base64 string
#
# Arguments:
# string
#
# Side Effects:
# None.
#
# Results:
# decoded string
#
# Usage syntax:
# b64decode <string>
proc ::testcl::b64decode {str} {
  log::log debug "GLOBAL::b64decode $str invoked"

  set nstr [string trimright $str =]
  set dstr [string map {
    A 000000 B 000001 C 000010 D 000011 E 000100 F 000101
    G 000110 H 000111 I 001000 J 001001 K 001010 L 001011
    M 001100 N 001101 O 001110 P 001111 Q 010000 R 010001
    S 010010 T 010011 U 010100 V 010101 W 010110 X 010111
    Y 011000 Z 011001 a 011010 b 011011 c 011100 d 011101
    e 011110 f 011111 g 100000 h 100001 i 100010 j 100011
    k 100100 l 100101 m 100110 n 100111 o 101000 p 101001
    q 101010 r 101011 s 101100 t 101101 u 101110 v 101111
    w 110000 x 110001 y 110010 z 110011 0 110100 1 110101
    2 110110 3 110111 4 111000 5 111001 6 111010 7 111011
    8 111100 9 111101 + 111110 / 111111
  } $nstr]
  switch [expr [string length $str]-[string length $nstr]] {
    0 {#nothing to do}
    1 {set dstr [string range $dstr 0 {end-2}]}
    2 {set dstr [string range $dstr 0 {end-4}]}
  }
  set decodedStr [binary format B* $dstr]
  log::log debug "b64decode returning $decodedStr"
  return $decodedStr
}

# testcl::b64encode --
#
# stub for the iRule GLOBAL::b64encode - performs base64 encoding on a string
#
# Arguments:
# string
#
# Side Effects:
# None.
#
# Results:
# base64 encoded string
#
# Usage syntax:
# b64encode <base64 string>
proc ::testcl::b64encode {str} {
  log::log debug "GLOBAL::b64encode $str invoked"

  binary scan $str B* bits
  switch [expr {[string length $bits]%6}] {
    0 {set tail {}}
    2 {append bits 0000; set tail ==}
    4 {append bits 00; set tail =}
  }
  set encodedStr [string map {
    000000 A 000001 B 000010 C 000011 D 000100 E 000101 F
    000110 G 000111 H 001000 I 001001 J 001010 K 001011 L
    001100 M 001101 N 001110 O 001111 P 010000 Q 010001 R
    010010 S 010011 T 010100 U 010101 V 010110 W 010111 X
    011000 Y 011001 Z 011010 a 011011 b 011100 c 011101 d
    011110 e 011111 f 100000 g 100001 h 100010 i 100011 j
    100100 k 100101 l 100110 m 100111 n 101000 o 101001 p
    101010 q 101011 r 101100 s 101101 t 101110 u 101111 v
    110000 w 110001 x 110010 y 110011 z 110100 0 110101 1
    110110 2 110111 3 111000 4 111001 5 111010 6 111011 7
    111100 8 111101 9 111110 + 111111 /
  } $bits]$tail

  log::log debug "b64encode returning $encodedStr"
  return $encodedStr
}

# testcl::getfield --
#
# stub for the iRule GLOBAL::getfield - Splits a string on a character or string. and returns the string corresponding to the specific field.
#
# Arguments:
# optional new uri string
#
# Side Effects:
# None.
#
# Results:
# current uri string
#
# Usage syntax:
# HTTP::uri [<string>]
#
proc ::testcl::getfield { str delim ind } {
  log::log debug "GLOBAL::getfield $str $delim $ind invoked"

  return [lindex [split $str $delim] [expr {$ind - 1}]]
}

# testcl::log --
#
# stub for the iRule GLOBAL::log - Generates and logs a message to the syslog-ng utility.
#
# Arguments:
# facility.level  - facility is ignored, level is passed through to the underlying test logger
# msg             - the message to log
#
# Side Effects:
# None.
#
# Usage syntax:
# log [-noname] <facility>.<level> <message>
#
proc ::testcl::log { faclvl msg } {
    set level [lindex [split $faclvl "."] 1]

    if { $level eq "" } {
        set level "info"
    }

    log::log $level $msg
}
