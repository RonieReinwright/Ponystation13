/obj/item/clothing/shoes/horseshoes
	name = "horseshoes"
	desc = "Plain, regular horseshoes."
	icon_state = "horseshoes"
	equip_sound = 'sound/items/trayhit/trayhit1.ogg'
	fastening_type = SHOES_SLIPON
	can_be_bloody = FALSE
	strip_delay = 50
	equip_delay_other = 50

/obj/item/clothing/shoes/horseshoes/insulated
	name = "insulated horseshoes"
	desc = "Rubber horseshoes that provide protection against electric shock."
	icon_state = "insulatedhorseshoes"
	custom_price = PAYCHECK_CREW * 10
	custom_premium_price = PAYCHECK_COMMAND * 6
	siemens_coefficient = 0

/obj/item/clothing/shoes/horseshoes/Initialize(mapload)
	. = ..()

// - - - - - - - krav maga

/obj/item/clothing/shoes/horseshoes/krav_maga
	clothing_traits = list(TRAIT_FAST_CUFFING)

/obj/item/clothing/shoes/horseshoes/krav_maga/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/martial_art_giver, /datum/martial_art/krav_maga)

/obj/item/clothing/shoes/horseshoes/krav_maga/sec
	name = "krav maga horseshoes"
	desc = "These horseshoes can teach you to perform Krav Maga using nanochips."
	icon_state = "kravahorseshoes"
	greyscale_colors = "#c41e0d"
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT

/obj/item/clothing/shoes/horseshoes/krav_maga/combathorseshoesplus
	name = "combat horseshoes plus"
	desc = "These tactical horseshoes are fireproof and electrically insulated, and through the use of nanochip technology will teach you the martial art of krav maga."
	icon_state = "blackhorseshoes"
	greyscale_colors = "#2f2e31"
	siemens_coefficient = 0
	strip_delay = 80
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor_type = /datum/armor/krav_maga_combatglovesplus

// - - - - - - - tacklers

/obj/item/clothing/shoes/horseshoes/tackler
	name = "enhanced retrieval horseshoes"
	desc = "Special horseshoes that manipulate the blood vessels in the wearer's hooves, granting them the ability to launch headfirst into walls and tackle fleeing criminals in a single bound."
	icon_state = "tacklehorseshoes"
	inhand_icon_state = null
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	resistance_flags = NONE
	custom_premium_price = PAYCHECK_COMMAND * 3.5
	clothing_traits = list(TRAIT_FINGERPRINT_PASSTHROUGH,TRAIT_FAST_CUFFING)
	var/datum/component/tackler
	var/tackle_stam_cost = 25
	var/base_knockdown = 1 SECONDS
	var/tackle_range = 4
	var/min_distance = 0
	var/tackle_speed = 1
	var/skill_mod = 1
	var/fishing_modifier = -7

/obj/item/clothing/shoes/horseshoes/tackler/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, fishing_modifier) //fishing tackle equipment (ba dum tsh)

/obj/item/clothing/shoes/horseshoes/tackler/Destroy()
	tackler = null
	return ..()

/obj/item/clothing/shoes/horseshoes/tackler/equipped(mob/user, slot)
	. = ..()
	if(!ishuman(user))
		return
	if(slot & ITEM_SLOT_FEET)
		var/mob/living/carbon/human/H = user
		tackler = H.AddComponent(/datum/component/tackler, stamina_cost=tackle_stam_cost, base_knockdown = base_knockdown, range = tackle_range, speed = tackle_speed, skill_mod = skill_mod, min_distance = min_distance)

/obj/item/clothing/shoes/horseshoes/tackler/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(ITEM_SLOT_FEET) == src)
		QDEL_NULL(tackler)

/obj/item/clothing/shoes/horseshoes/tackler/combat
	name = "gorilla horseshoes"
	desc = "Premium quality combative horseshoes, heavily reinforced to give the user an edge in close combat tackles, though they are more taxing to use than normal gripper horseshoes. Fireproof to hoof!"
	icon_state = "gorillahorseshoes"
	inhand_icon_state = null
	tackle_stam_cost = 30
	base_knockdown = 1.25 SECONDS
	tackle_range = 5
	skill_mod = 2
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	resistance_flags = NONE

// - - - - - - - special

/obj/item/clothing/shoes/horseshoes/rapid
	name = "Hooves of the North Star"
	desc = "Just looking at these fills you with an urge to beat the fluff out of ponies."
	icon_state = "rapidhorseshoes"
	inhand_icon_state = null
	clothing_traits = list(TRAIT_FINGERPRINT_PASSTHROUGH)

/obj/item/clothing/shoes/horseshoes/rapid/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/punchcooldown)
	AddComponent(/datum/component/adjust_fishing_difficulty, -9)

/obj/item/clothing/shoes/horseshoes/radio
	name = "translation horseshoes"
	desc = "A pair of electronic horseshoes which connect to nearby radios wirelessly. Allows for sign language users to 'speak' over comms."
	icon_state = "radio_h"
	inhand_icon_state = null
	clothing_traits = list(TRAIT_CAN_SIGN_ON_COMMS)

/obj/item/clothing/shoes/horseshoes/atmos
	name = "atmospheric extrication horseshoes"
	desc = "Heavy duty horseshoes for firefighters. These are thick, non-flammable and let you carry people faster."
	icon_state = "atmoshorseshoes"
	cold_protection = HANDS|FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = HANDS|FEET
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	siemens_coefficient = 0.3
	clothing_traits = list(TRAIT_QUICKER_CARRY, TRAIT_CHUNKYFINGERS)
	clothing_flags = parent_type::clothing_flags | THICKMATERIAL|STOPSPRESSUREDAMAGE

/obj/item/clothing/shoes/horseshoes/atmos/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, 6)

/obj/item/clothing/shoes/horseshoes/captain
	desc = "Regal blue horseshoes, with a nice gold trim, a diamond anti-shock coating, and an integrated thermal barrier. Swanky."
	name = "captain's horseshoes"
	icon_state = "captain"
	inhand_icon_state = null
	greyscale_colors = null
	siemens_coefficient = 0
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	strip_delay = 60
	armor_type = /datum/armor/captain_horseshoes
	resistance_flags = NONE
	clothing_traits = list(TRAIT_FAST_CUFFING)

/obj/item/clothing/shoes/horseshoes/captain/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, -6)

/datum/armor/captain_horseshoes
	bio = 90
	fire = 70
	acid = 50