require "kontti/version"

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
    
    def change( input )
    	add_konnti( input )
    end
    
    def add_konnti( input )
    	input + "-" + Kontti::AFFIX
    end
  end
end
