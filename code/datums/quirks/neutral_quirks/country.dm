/datum/quirk/country
	name = "Country"
	desc = "You grew up in the Space South."
	icon = FA_ICON_HAT_COWBOY_SIDE
	value = 0
	mob_trait = TRAIT_COUNTRY
	gain_text = span_notice("You suddenly understand the value of a honest day's work.")
	lose_text = span_danger("You don't really care for stetsons anymore.")
	var/datum/component/speechmod/speechmod
	var/static/list/speech_replacements = list(
		new /regex(@"\bI(?:'|’)?M\b",  "g") = "AH'M",
		new /regex(@"\bI(?:'|’)?VE\b", "g") = "AH'VE",
		new /regex(@"\bI(?:'|’)?LL\b", "g") = "AH'LL",
		new /regex(@"\bI(?:'|’)?D\b",  "g") = "AH'D",
		new /regex(@"\bi(?:'|’)?m\b", "gi") = "ah'm",
		new /regex(@"\bi(?:'|’)?ve\b", "gi") = "ah've",
		new /regex(@"\bi(?:'|’)?ll\b", "gi") = "ah'll",
		new /regex(@"\bi(?:'|’)?d\b", "gi") = "ah'd",
		new /regex(@"\byou all\b", "gi") = "y'all",
		new /regex(@"\byou guys\b", "gi") = "y'all",
		new /regex(@"\b(are|is|am) not\b", "gi") = "ain't",
		new /regex(@"\bcannot\b", "gi") = "cain't",
		new /regex(@"\bi am\b", "gi") = "ah'm",
		new /regex(@"\bi have\b", "gi") = "ah've",
		new /regex(@"\bi will\b", "gi") = "ah'll",
		new /regex(@"\bi (?:had|would)\b", "gi") = "ah'd",
		new /regex(@"\bi\b", "gi") = "ah",
		new /regex(@"\bmy\b", "gi") = "mah",
		new /regex(@"\byour\b", "gi") = "yer",
		new /regex(@"\bthem\b", "gi") = "'em",
		new /regex(@"\blet me\b", "gi") = "lemme",
		new /regex(@"\bgive me\b", "gi") = "gimme",
		new /regex(@"\bbecause\b", "gi") = "'cause",
		new /regex(@"\bgoing to\b", "gi") = "gonna",
		new /regex(@"\bwant to\b", "gi") = "wanna",
		new /regex(@"\bgot to\b", "gi") = "gotta",
		new /regex(@"\bhave to\b", "gi") = "hafta",
		new /regex(@"\bkind of\b", "gi") = "kinda",
		new /regex(@"\bsort of\b", "gi") = "sorta",
		new /regex(@"\bout of\b", "gi") = "outta",
		new /regex(@"\bcould have\b", "gi") = "coulda",
		new /regex(@"\bwould have\b", "gi") = "woulda",
		new /regex(@"\bshould have\b", "gi") = "shoulda",
		new /regex(@"\bdid you\b", "gi") = "didja",
		new /regex(@"\bdon(?:'|’)?t you\b", "gi") = "doncha",
		new /regex(@"\bwhat are you\b", "gi") = "whatcha",
		new /regex(@"\bcome on\b", "gi") = "c'mon",
		new /regex(@"\bover there\b", "gi") = "over yonder",
		new /regex(@"\bfriend\b", "gi") = "sugarcube",
		new /regex(@"\bpal\b", "gi") = "sugarcube",
		new /regex(@"\bhello\b", "gi") = "howdy",
		new /regex(@"\bhi\b", "gi") = "howdy",
		new /regex(@"\byes\b", "gi") = "yup",
		new /regex(@"\bno\b", "gi") = "nope",
		new /regex(@"\bvery\b", "gi") = "mighty",
		new /regex(@"\bevening\b", "gi") = "evenin'",
		new /regex(@"\bmorning\b", "gi") = "mornin'",
		new /regex(@"\bchildren\b", "gi") = "young'uns",
		new /regex(@"\bkids\b", "gi") = "young'uns",
		new /regex(@"\balien(s?)\b", "gi") = "space critter$1",
		new /regex(@"\b(\w+)ing\b", "gi") = "$1in'"
	)

/datum/quirk/country/post_add()
	. = ..()
	speechmod = quirk_holder.AddComponent(/datum/component/speechmod, replacements = speech_replacements)

/datum/quirk/country/remove()
	. = ..()
	QDEL_NULL(speechmod)