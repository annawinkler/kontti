# encoding: utf-8

require "kontti/version"
require "language_defs"
require "hyphenate"

# From http://en.wikipedia.org/wiki/Language_game
#
# Add word 'kontti' after each word and apply the same conversion as in sananmuunnos.
# Finnish counterpart of Pig Latin. This game is also called siansaksa ('Pig German'), 
# which is a common expression for unintelligible gibberish.
#
# Sananmuunnos - Spoonerism: swap first morae of words. 
# Apply vowel harmony (vokaalisointu) according to the initial syllable, 
# repair "broken diphthongs" into permitted diphthongs
# 
# hyphenate - tavuta
#
# Lyle Campbell. 1980. The Psychological and Sociological Reality of Finnish Vowel Harmony. 
# In Issues in Vowel Harmony, edited by Robert Vago, pp. 245-270. 
# (Studies in Language Companion Series, 6.) John Benjamins.
module Kontti

	AFFIX = "kontti"

  class KonttiFun
    
    def self.change( input, key_word = AFFIX )
    	#add_konnti unless !check_keyword( key_word )
    	hyphenated_input = Hyphenate::tavuta( input )
    	
    	# Make sure the key_word to insert is valid, then set the consonants & vowels
    	if check_keyword( key_word )
    		k1 = key_word[0]
    		v1 = key_word[1]
    		k2 = key_word[2]
    		k3 = key_word[3]

    		puts "Keyword #{key_word} is valid #{k1} #{v1} #{k2} #{k3}"
    	end



 #    	for my $s (split(/([$v$k]+)/, $s)) {
	# $kontitettu .= $s, next unless $s =~ /[$v$k]/;
	# my @k = @ak;
	# my @t = tavuta($s);
	# if ($t[0] =~ /^($K)($V)$/) {				# talo
	#     $t[0] = $k1 . $v1 ;					# kolo
	#     $k[0] = $1  . $2 . $k2 . $k3;			# tantti
	# } elsif ($t[0] =~ /^($K)($V)($K)$/) {			# marras
	#     $t[0] = $k1 . $v1  . $3;				# korras
	#     $k[0] = $1  . $2 . $k2 . $k3;			# mantti
	# } elsif ($t[0] =~ /^($K)($V)($V)$/) {
	#     if ($2 eq $3) {					# saari
	# 	$t[0] = $k1 . $v1 . $v1;			# koori
	# 	$k[0] = $1  . $2  . $k2 . $k3;			# santti
	#     } elsif ($3 eq $v1) {				# huomenta
	# 	$t[0] = $k1 . $v1 . $2;				# koumenta
	# 	$k[0] = $1  . $2  . $k2 . $k3;			# huntti
	#     } else {						# taivas
	# 	$t[0] = $k1 . $v1 . $3;				# koivas
	# 	$k[0] = $1  . $2  . $k2 . $k3;			# tantti
	#     }
	# } elsif ($t[0] =~ /^($K)($V)($V)($K)$/) {
	#     if ($2 eq $3) {					# saarni
	# 	$t[0] = $k1 . $v1 . $v1 . $4;			# koorni
	# 	$k[0] = $1  . $2  . $k2 . $k3;			# kantti
	#     } else {						# hiekka
	# 	$t[0] = $k1 . $2  . $3  . $4;			# kiekka
	# 	$k[0] = $1  . $v1 . $k2 . $k3;			# hontti
	#     }
	# } elsif ($t[0] =~ /^($V)($K)$/) {			# alku
	#     $t[0] = $k1 . $v1 . $2;				# kolku
	#     $k[0] = $1  . $k2 . $k3;				# antti
	# } elsif ($t[0] =~ /^($V)$/) {				# ase
	#     $t[0] = $k1 . $v1;					# kose
	#     $k[0] = $1  . $k2 . $k3;				# antti
	# } elsif ($t[0] =~ /^($V)($V)$/) {
	#     if ($1 eq $2) {					# aari
	# 	$t[0] = $k1 . $v1 . $v1;			# koori
	# 	$k[0] = $1  . $k2 . $k3;			# antti
	#     } elsif ($2 eq 'ö') {				# yö
	# 	$t[0] = $k1 . $2  . $1;				# köy
	# 	$k[0] = $1  . $k2 . $k3;			# yntti
	#     } else {						# autio
	# 	$t[0] = $k1 . $v1 . $2;				# koutio
	# 	$k[0] = $1  . $k2 . $k3;			# antti
	#     }
	# } elsif ($t[0] =~ /^($K)($V)($K)($K)$/) {		# tausta
	#     $t[0] = $k1 . $v1  . $3  . $4;			# kousta
	#     $k[0] = $1  . $2   . $k2 . $k3;			# tantti
	# } elsif ($t[0] =~ /^($V)($V)($K)$/) {
	#     if ($1 eq $2) {					# aarni
	# 	$t[0] = $k1 . $v1 . $v1 . $3;			# koorni
	# 	$k[0] = $1  . $k2 . $k3;			# antti
	#     } else {						# aukko
	# 	$t[0] = $k1 . $v1 . $2  . $3;			# koukko
	# 	$k[0] = $1  . $k2 . $k3;			# antti
	#     }
	# } elsif ($t[0] =~ /^($V)($K)($K)$/) {			# arkku
	#     $t[0] = $k1 . $v1  . $2  . $3;			# korkku
	#     $k[0] = $1  . $k2 . $k3;				# antti
	# } elsif ($t[0] =~ /^($K)($K)($V)$/) {			# trapetsi
	#     $t[0] = $k1 . $v1;					# kopetsi
	#     $k[0] = $1  . $2  . $3 . $k2  . $k3;		# trantti
	# } elsif ($t[0] =~ /^($K)($K)($V)($K)$/) {		# traktori
	#     $t[0] = $k1 . $2  . $v1 . $4;			# kroktori
	#     $k[0] = $1  . $3  . $k2 . $k3;			# tantti
	# } elsif ($t[0] =~ /^($K)($K)($V)($V)$/) {
	#     if ($3 eq $4) {					# traani
	# 	$t[0] = $k1 . $v1 . $v1;			# kooni
	# 	$k[0] = $1  . $2  . $3  .  $k2 . $k3;		# trantti
	#     } else {						# trauma
	# 	$t[0] = $k1 . $v1 . $4;				# kouma
	# 	$k[0] = $1  . $2  . $3  .  $k2 . $k3;		# trantti
	#     }
	# } elsif ($t[0] =~ /^($K)($K)($V)($V)($K)$/) {		# truantti
	#     $t[0] = $k1 . $v1 . $4  . $5;			# koantti
	#     $k[0] = $1  . $2 . $3  . $k2 . $k3;			# trantti
	# } elsif ($t[0] =~ /^($K)($K)($V)($K)($K)$/) {		# transsi
	#     $t[0] = $k1 . $v1 . $4  . $5;			# konssi
	#     $k[0] = $1  . $2  . $3  . $k2 . $k3;		# trantti
	# }
	
	# # vokaalisointu

	# @t = map { tr/aouAOU/äöyÄÖY/; $_ } @t if grep { /[yäöYÄÖ]/ } @t;
	# @k = map { tr/aouAOU/äöyÄÖY/; $_ } @k if grep { /[yäöYÄÖ]/ } @k;

	# # Iso alkukirjain
	# my $a = substr($t[0], 0, 1);
	# my $b = substr($k[0], 0, 1);
	# if ($a =~ /^[$p]/ && $b =~ /^[$I]/) {
	#     substr($t[0], 0, 1) = substr($I, index($p, $a), 1);
	#     substr($k[0], 0, 1) = substr($p, index($I, $b), 1);
	# }

	# $kontitettu .= join("", @t) . " " . join("", @k)
 #    } // end for

 #    return $kontitettu;


    end
    
    def self.add_konnti( input, key_word )
    	input + "-" + key_word
    end

    def self.check_keyword( key_word )
    	raise "Key word must be CVCC!" unless key_word.match( /(#{LanguageDefs::CONSONANTS_CLASS})(#{LanguageDefs::VOWELS_CLASS})(#{LanguageDefs::CONSONANTS_CLASS})(#{LanguageDefs::CONSONANTS_CLASS})/ ) 
    	true
    end

  end

end
