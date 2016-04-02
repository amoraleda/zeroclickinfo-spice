package DDG::Spice::Forvo;
# ABSTRACT: Shows how to pronounce words

use strict;
use DDG::Spice;
use utf8;

triggers any => "pronounce", "pronunciation", "how to pronounce", "pronunciation of", "pronounciation of", "how do you say", "how do you pronounce", "how to say", "how do i say", "how do i pronounce";

spice to => 'http://apicorporate.forvo.com/key/{{ENV{DDG_SPICE_FORVO_APIKEY}}}/format/json/action/pronounced-words-search/search/$1/language/$2/callback/{{callback}}';
spice from => '([^/]+)/([^/]+)';

spice proxy_cache_valid   => "200 1h";

my %langs = ("abkhazian" => "ab", "adygean" => "ady", "afar" => "aa", "afrikaans" => "af", "akan" => "ak", "albanian" => "sq", "amharic" => "am", "ancient greek" => "grc", "arabic" => "ar", "aragonese" => "an", "arbëresh" => "aae", "armenian" => "hy", "assamese" => "as", "assyrian neo-aramaic" => "aii", "asturian" => "ast", "avaric" => "av", "aymara" => "ay", "azerbaijani" => "az", "balochi" => "bal", "bambara" => "bm", "bardi" => "bcj", "bashkir" => "ba", "basque" => "eu", "bavarian" => "bar", "belarusian" => "be", "bengali" => "bn", "bihari" => "bh", "bislama" => "bi", "bosnian" => "bs", "botlikh" => "bph", "breton" => "br", "bulgarian" => "bg", "buriat" => "bxr", "burmese" => "my", "burushaski" => "bsk", "cantonese" => "yue", "cape verdean creole" => "kea", "catalan" => "ca", "cebuano" => "ceb", "central bikolano" => "bcl", "chamorro" => "ch", "chechen" => "ce", "cherokee" => "chr", "chichewa" => "ny", "chuvash" => "cv", "cornish" => "kw", "corsican" => "co", "cree" => "cr", "creek" => "mus", "crimean tatar" => "crh", "croatian" => "hr", "czech" => "cs", "dagbani" => "dag", "danish" => "da", "dari" => "prs", "divehi" => "dv", "dutch" => "nl", "dzongkha" => "dz", "emilian" => "egl", "english" => "en", "erzya" => "myv", "esperanto" => "eo", "estonian" => "et", "eton" => "eto", "ewe" => "ee", "ewondo" => "ewo", "faroese" => "fo", "fijian" => "fj", "finnish" => "fi", "flemish" => "vls", "franco-provençal" => "frp", "french" => "fr", "friulan" => "fur", "fulah" => "ff", "galician" => "gl", "gan chinese" => "gan", "georgian" => "ka", "german" => "de", "gilaki" => "glk", "greek" => "el", "guarani" => "gn", "gujarati" => "gu", "haitian" => "ht", "hakka" => "hak", "hassaniyya" => "mey", "hausa" => "ha", "hawaiian" => "haw", "hebrew" => "he", "herero" => "hz", "hiligaynon" => "hil", "hindi" => "hi", "hiri motu" => "ho", "hmong" => "hmn", "hungarian" => "hu", "icelandic" => "is", "igbo" => "ig", "iloko" => "ilo", "indonesian" => "ind", "ingush" => "inh", "interlingua" => "ia", "inuktitut" => "iu", "inupiaq" => "ik", "irish" => "ga", "italian" => "it", "iwaidja" => "ibd", "jamaican patois" => "jam", "japanese" => "ja", "javanese" => "jv", "jin chinese" => "cjy", "kabardian" => "kbd", "kabyle" => "kab", "kalaallisut" => "kl", "kalmyk" => "xal", "kannada" => "kn", "kanuri" => "kr", "karakalpak" => "kaa", "kashmiri" => "ks", "kazakh" => "kk", "khasi" => "kha", "khmer" => "km", "kikuyu" => "ki", "kimbundu" => "kmb", "kinyarwanda" => "rw", "kirundi" => "rn", "klingon" => "tlh", "komi" => "kv", "kongo" => "kg", "konkani" => "gom", "korean" => "ko", "kotava" => "avk", "krio" => "kri", "kuanyama" => "kj", "kurdish" => "ku", "kutchi" => "kfr", "kyrgyz" => "ky", "lakota" => "lkt", "lao" => "lo", "latin" => "la", "latvian" => "lv", "lezgian" => "lez", "ligurian" => "lij", "limburgish" => "li", "lingala" => "ln", "lithuanian" => "lt", "lombard" => "lmo", "low german" => "nds", "lozi" => "loz", "luba-katanga" => "lu", "luganda" => "lg", "luo" => "luo", "lushootseed" => "lut", "luxembourgish" => "lb", "macedonian" => "mk", "mainfränkisch" => "vmf", "malagasy" => "mg", "malay" => "ms", "malayalam" => "ml", "maltese" => "mt", "mandarin chinese" => "zh", "manx" => "gv", "māori" => "mi", "mapudungun" => "arn", "marathi" => "mr", "marshallese" => "mh", "masbateño" => "msb", "mauritian creole" => "mfe", "mazandarani" => "mzn", "mbe" => "mfo", "meitei" => "mni", "micmac" => "mic", "min dong" => "cdo", "min nan" => "nan", "minangkabau" => "min", "mohawk" => "moh", "moksha" => "mdf", "mongolian" => "mn", "nahuatl" => "nah", "nauru" => "na", "navajo" => "nv", "naxi" => "nxq", "ndonga" => "ng", "neapolitan" => "nap", "nepal bhasa" => "new", "nepali" => "ne", "nogai" => "nog", "north ndebele" => "nd", "northern sami" => "se", "norwegian bokmål" => "no", "norwegian nynorsk" => "nn", "nuosu" => "ii", "nǀuu" => "ngh", "occitan" => "oc", "ojibwa" => "oj", "okinawan" => "ryu", "oriya" => "or", "oromo" => "om", "osage" => "osa", "ossetian" => "os", "ottoman turkish" => "ota", "palauan" => "pau", "palenquero" => "pln", "pangasinan" => "pag", "panjabi" => "pa", "papiamento" => "pap", "pashto" => "ps", "pennsylvania dutch" => "pdc", "persian" => "fa", "picard" => "pcd", "piedmontese" => "pms", "pitjantjatjara" => "pjt", "polish" => "pl", "portuguese" => "pt", "pulaar" => "fuc", "quechua" => "qu", "quiatoni zapotec" => "zpf", "rapa nui" => "rap", "romagnol" => "rgn", "romani" => "rom", "romanian" => "ro", "romansh" => "rm", "rukiga" => "cgg", "russian" => "ru", "rusyn" => "rue", "samoan" => "sm", "sango" => "sg", "sanskrit" => "sa", "sardinian" => "sc", "scots" => "sco", "scottish gaelic" => "gd", "serbian" => "sr", "serer" => "srr", "shona" => "sn", "shoshoni" => "shh", "sicilian" => "scn", "silesian" => "szl", "sindhi" => "sd", "sinhalese" => "si", "slovak" => "sk", "slovenian" => "sl", "somali" => "so", "sotho" => "st", "south ndebele" => "nr", "spanish" => "es", "sranan tongo" => "srn", "sundanese" => "su", "swabian german" => "swg", "swahili" => "sw", "swati" => "ss", "swedish" => "sv", "swiss german" => "gsw", "sylheti" => "syl", "tagalog" => "tl", "tahitian" => "ty", "tajik" => "tg", "tamil" => "ta", "tatar" => "tt", "telugu" => "te", "tetum" => "tet", "thai" => "th", "tibetan" => "bo", "tigrinya" => "ti", "tok pisin" => "tpi", "toki pona" => "x-tp", "tondano" => "tdn", "tonga" => "to", "tsonga" => "ts", "tswana" => "tn", "tuareg" => "tmh", "tundra nenets" => "yrk", "turkish" => "tr", "turkmen" => "tk", "tuscarora" => "tus", "tuvan" => "tyv", "twi" => "tw", "udmurt" => "udm", "uighur" => "ug", "ukrainian" => "uk", "upper sorbian" => "hsb", "urdu" => "ur", "uzbek" => "uz", "valencian" => "caval", "venda" => "ve", "venetian" => "vec", "vietnamese" => "vi", "võro" => "vro", "walloon" => "wa", "welsh" => "cy", "western frisian" => "fy", "wolof" => "wo", "wu chinese" => "wuu", "xhosa" => "xh", "xiang chinese" => "hsn", "yakut" => "sah", "yiddish" => "yi", "yoruba" => "yo", "yucatec maya" => "yua", "yupik" => "esu", "zazaki" => "zza", "zhuang" => "za", "zulu" => "zu");

handle remainder => sub {
    if (defined $_){
        my $remainder = lc($_);
        my $match;
        my @words = qw(pronounce pronunciation of in );

        if ($remainder =~ m/\b(abkhazian|adygean|afar|afrikaans|akan|albanian|amharic|ancient greek|arabic|aragonese|arbëresh|armenian|assamese|assyrian neoaramaic|asturian|avaric|aymara|azerbaijani|balochi|bambara|bardi|bashkir|basque|bavarian|belarusian|bengali|bihari|bislama|bosnian|botlikh|breton|bulgarian|buriat|burmese|burushaski|cantonese|cape verdean creole|catalan|cebuano|central bikolano|chamorro|chechen|cherokee|chichewa|chuvash|cornish|corsican|cree|creek|crimean tatar|croatian|czech|dagbani|danish|dari|divehi|dutch|dzongkha|emilian|english|erzya|esperanto|estonian|eton|ewe|ewondo|faroese|fijian|finnish|flemish|francoprovençal|french|friulan|fulah|galician|gan chinese|georgian|german|gilaki|greek|guarani|gujarati|haitian|hakka|hassaniyya|hausa|hawaiian|hebrew|herero|hiligaynon|hindi|hiri motu|hmong|hungarian|icelandic|igbo|iloko|indonesian|ingush|interlingua|inuktitut|inupiaq|irish|italian|iwaidja|jamaican patois|japanese|javanese|jin chinese|kabardian|kabyle|kalaallisut|kalmyk|kannada|kanuri|karakalpak|kashmiri|kazakh|khasi|khmer|kikuyu|kimbundu|kinyarwanda|kirundi|klingon|komi|kongo|konkani|korean|kotava|krio|kuanyama|kurdish|kutchi|kyrgyz|lakota|lao|latin|latvian|lezgian|ligurian|limburgish|lingala|lithuanian|lombard|low german|lozi|lubakatanga|luganda|luo|lushootseed|luxembourgish|macedonian|mainfränkisch|malagasy|malay|malayalam|maltese|mandarin chinese|manx|māori|mapudungun|marathi|marshallese|masbateño|mauritian creole|mazandarani|mbe|meitei|micmac|min dong|min nan|minangkabau|mohawk|moksha|mongolian|nahuatl|nauru|navajo|naxi|ndonga|neapolitan|nepal bhasa|nepali|nogai|north ndebele|northern sami|norwegian bokmål|norwegian nynorsk|nuosu|nǀuu|occitan|ojibwa|okinawan|oriya|oromo|osage|ossetian|ottoman turkish|palauan|palenquero|pangasinan|panjabi|papiamento|pashto|pennsylvania dutch|persian|picard|piedmontese|pitjantjatjara|polish|portuguese|pulaar|quechua|quiatoni zapotec|rapa nui|romagnol|romani|romanian|romansh|rukiga|russian|rusyn|samoan|sango|sanskrit|sardinian|scots|scottish gaelic|serbian|serer|shona|shoshoni|sicilian|silesian|sindhi|sinhalese|slovak|slovenian|somali|sotho|south ndebele|spanish|sranan tongo|sundanese|swabian german|swahili|swati|swedish|swiss german|sylheti|tagalog|tahitian|tajik|tamil|tatar|telugu|tetum|thai|tibetan|tigrinya|tok pisin|toki pona|tondano|tonga|tsonga|tswana|tuareg|tundra nenets|turkish|turkmen|tuscarora|tuvan|twi|udmurt|uighur|ukrainian|upper sorbian|urdu|uzbek|valencian|venda|venetian|vietnamese|võro|walloon|welsh|western frisian|wolof|wu chinese|xhosa|xiang chinese|yakut|yiddish|yoruba|yucatec maya|yupik|zazaki|zhuang|zulu)\b/ig){
            $match = $1;
            $remainder =~ s/\s*$match\s*//ig;
        }

        foreach my $word (@words) {
            $remainder =~ s/\s*\b$word\b\s*//ig;
        }

        return $remainder, $langs{$match} unless !defined $match;
        return $remainder, "empty";
    }
    return;

};

1;
