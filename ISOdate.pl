#!/usr/bin/perl
use strict;
use File::stat;
use Time::localtime;

#
# create a ISO date format string
# from the ctime(3) format that Perl uses for file modification date
# 	ex: Thu Oct 13 04:54:34 1994
# 		becomes 1994-10-13T04:54:34

my $mod_datetime = "Thu Oct 13 04:54:34 1994";
print ctime_to_ISO( $mod_datetime ) . "\n";

sub ctime_to_ISO {
	my $ctime = shift;
	my ( $file_day, $file_month, $file_mday, $file_time, $file_year );
	
	$ctime =~ m/^([A-Za-z]*)\s*([A-Za-z]*)\s*([0-9]*)\s*([0-9:]*)\s*([0-9]*)$/;
	$file_day = $1;
	$file_month = $2;
	$file_mday = $3;
	$file_time = $4;
	$file_year = $5;
	
	return( "$file_year-" . leading_zero( number_of_month( $file_month ) ) . "-" . leading_zero( $file_mday ) . "T$file_time" );
	
}

sub number_of_month {
	my $month = shift;
	if ( $month eq "Jan" ) { return( 1 ); }
	if ( $month eq "Feb" ) { return( 2 ); }
	if ( $month eq "Mar" ) { return( 3 ); }
	if ( $month eq "Apr" ) { return( 4 ); }
	if ( $month eq "May" ) { return( 5 ); }
	if ( $month eq "Jun" ) { return( 6 ); }
	if ( $month eq "Jul" ) { return( 7 ); }
	if ( $month eq "Aug" ) { return( 8 ); }
	if ( $month eq "Sep" ) { return( 9 ); }
	if ( $month eq "Oct" ) { return( 10 ); }
	if ( $month eq "Nov" ) { return( 11 ); }
	if ( $month eq "Dec" ) { return( 12 ); }
}

sub leading_zero {
	my $input = shift;
	if ( length( $input ) < 2 ) { return( "0" . $input ); } else { return( $input ); }
}
