# encoding: utf-8

# From Lingua::FI::Hyphenate - Finnish hyphenation (suomen tavutus)
#
# tavuta() returns as a list the syllables of its Finnish input list.

# The used character set is ISO 8859-1, of which the Finnish word
# characters the vowels are

#     aeiouyäåö AEIOUYÅÄÖ

# and the consonants are

#     bcdfghjklmnpqrstvwxz BCDFGHJKLMNPQRSTVWXZ

# The rules for syllable divisions are:
# B<Before> any consonant-vowel pair I<except> when the said consonant is
# the latter consonant of a syllable-initial consonant-consonant pair.

# =item *

# B<Between> any vowel-vowel pair I<except> when the vowel pair is a
# Finnish diphthong, that is any of the I<ai au ei eu ey ie iu iy oi ou
# ui uo yi yö äi äy öi öy>.

# sanat = word
# tavuta = hyphenate
#
class Hyphenate

	VOWELS     = "aeiouyäåöAEIOUYÅÄÖ"
	CONSONANTS = "bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ"
	VOWELS_CLASS = '[' + VOWELS + ']'
	CONSONANTS_CLASS = '[' + CONSONANTS + ']'

	def self.tavuta( sanat )
		# Anything not a letter is a syllable division.
		# @tavut = map { split /[^$v$k]+/ } @tavut;
#		tavut = sanat.split(/[VOWELS_CLASS CONSONANTS_CLASS]+/)
		#tavut = sanat.split(/[["aeiouyäåöAEIOUYÅÄÖ"]["bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ"]]+/)
		tavut = sanat.split(/\W/).join(" ")
    	puts "Input word = " + sanat
    	# Syllable division before any CV.
    	# Exception: the rare loanword-based ^CC syllables.
	    # @tavut = map { split /(?=(?<!^$K)$K$V)/ } @tavut;
	    tavut = tavut.split(/(?=(?<!^[bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ])[bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ][aeiouyäåöAEIOUYÅÄÖ])/).join(" ")

	    #
	    # Syllable division between any VV pair that is not a Finnish diphthong.
	    #
    	#@tavut = map { split /(.*?[aA])(?=[eoEO])/ }       @tavut;
    	#@tavut = map { split /(.*?[eiEI])(?=[aoäöAOÄÖ])/ } @tavut;
    	#@tavut = map { split /(.*?[ouOU])(?=[aeAE])/ }     @tavut;
    	#@tavut = map { split /(.*?[yäYÄ])(?=[eäEÄ])/ }     @tavut;
    	#@tavut = map { split /(.*?[öÖ])(?=[eE])/ }         @tavut;

		tavut = tavut.split(/(.*?[aA])(?=[eoEO])/).join(" ")
		tavut = tavut.split(/(.*?[eiEI])(?=[aoäöAOÄÖ])/).join(" ")
    	tavut = tavut.split(/(.*?[ouOU])(?=[aeAE])/).join(" ")
    	tavut = tavut.split(/(.*?[yäYÄ])(?=[eäEÄ])/).join(" ")
    	tavut = tavut.split(/(.*?[öÖ])(?=[eE])/).join(" ")

		tavut
	end

end