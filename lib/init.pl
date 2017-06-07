#!/usr/bin/perl -w

# Riferimento per le librerie richieste da OpenMCE
# Copyright (C) 2017 by Grizzly  http://www.g-sr.eu/

#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see .

# This programme is CardWare: if you like it, please send me a pictured postcard
# This programme is TeddyWare: if you *enjoyed* it, please send me a stuffed teddy bear (-:
# Sell your items to:
#     Grizzly aka Mirko Tuccitto c/o Undefined Illusion BBS
#     12A, via Salvatore Monteforte - 96100 Siracusa ITALY

##### 

use strict;
use LWP::UserAgent;
use MIME::Base64;
use Config::Abstract::Ini;

	#TEMP
	use Data::Dumper;

# Must use besms.pl DESTNUM "message"
if ($#ARGV < 1) {
  die("Uso: besms.pl NUMERO \"testo messaggio\"\n");
}

# Configuration file
my $config_file = '.besmsrc.ini';

my $parametri = new Config::Abstract::Ini($config_file);
my $authlogin = $parametri->get_entry_setting('besms','username');
my $authpasswd = $parametri->get_entry_setting('besms','password');
my $sender = encode_base64($parametri->get_entry_setting('besms','from'));
my $id_api = $parametri->get_entry_setting('besms','sms_type');

# Parameters
my $destination = "39".$ARGV[0];
my $body = encode_base64($ARGV[1]);

##### Now act

#my $browser = LWP::UserAgent->new;

# Send via POST
#my $response = $browser->post (
# 'https://secure.apisms.it/http/send_sms',
# [
#   'authlogin' => $authlogin,
#   'authpasswd' => $authpasswd,
#   'sender' => $sender,
#   'body' => $body,
#   'destination' => $destination,
#   'id_api' => $id_api
# ],
#);

# Adesso semplicemente fornisce la risposta, se e' tutto a posto
# semplicemente "+OK", altrimenti "+KO QUALCOSA"
print $destination." : ".$response->content."\n";
exit;

