#!/usr/bin/perl
use strict;
use File::stat;
print scalar( localtime( stat( @ARGV[0] )->mtime ) ) . "\n";