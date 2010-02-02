#!/usr/bin/perl

use strict;
use warnings;

use ExtUtils::H2PM 0.03;

module "Socket::Netlink::Generic";

include "sys/socket.h";
include "linux/netlink.h";
include "linux/genetlink.h";

use_export;

constant "NETLINK_GENERIC";

structure "struct genlmsghdr",
   with_tail => 1,
   members => [
      cmd     => member_numeric,
      version => member_numeric,
   ];

constant "CTRL_CMD_$_" for qw( UNSPEC NEWFAMILY DELFAMILY GETFAMILY NEWOPS
   DELOPS GETOPS NEWMCAST_GRP DELMCAST_GRP GETMCAST_GRP );

constant "CTRL_ATTR_$_" for qw( UNSPEC FAMILY_ID FAMILY_NAME VERSION HDRSIZE
   MAXATTR OPS MCAST_GROUPS );

constant "CTRL_ATTR_OP_$_" for qw( UNSPEC ID FLAGS );

constant "CTRL_ATTR_MCAST_GRP_$_" for qw( UNSPEC NAME ID );

write_output $ARGV[0];
