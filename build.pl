#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
system 'fpc main.pas';
if(-f "main"){
        say "========================================";
        system "./main";
        unlink<*.o>;
        unlink<*.ppu>;
        system("rm main");
}
