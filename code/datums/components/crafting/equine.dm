/datum/crafting_recipe/insulated_horseshoes
	name = "Insulated Horseshoes"
	desc = "A crude but workable conversion. Requires properly insulated gloves."
	result = /obj/item/clothing/shoes/horseshoes/insulated
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	reqs = list(
		/obj/item/clothing/gloves = 1,
		/obj/item/stack/sheet/iron = 1,
	)
	category = CAT_EQUINE

/datum/crafting_recipe/insulated_horseshoes/check_requirements(mob/user, list/collected_requirements)
	var/obj/item/clothing/gloves/insulated = collected_requirements[/obj/item/clothing/gloves][1]
	return insulated.siemens_coefficient == 0 // gloves are not subtyped, so a special check is required to make sure they are insulated

/datum/crafting_recipe/kravmaga_horseshoes
	name = "Krav Maga Horseshoes (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/krav_maga/sec
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/krav_maga/sec = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/combatplus_horseshoes
	name = "Combat Horseshoes Plus (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/krav_maga/combathorseshoesplus
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/krav_maga/combatglovesplus = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/tackler_horseshoes
	name = "Enhanced Retrieval Horseshoes (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/tackler
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/tackler = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/tacklercombat_horseshoes
	name = "Gorilla Horseshoes (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/tackler/combat
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/tackler/combat = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/rapid_horseshoes
	name = "Hooves of the North Star (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/rapid
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/rapid = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/radio_horseshoes
	name = "Translation Horseshoes (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/radio
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/radio = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/atmos_horseshoes
	name = "Atmospheric Extrication Horseshoes (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/atmos
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/atmos = 1,
		/obj/item/stack/sheet/iron = 1,
	)

/datum/crafting_recipe/captain_horseshoes
	name = "Captain's Horseshoes (Conversion)"
	desc = "A crude but workable conversion."
	result = /obj/item/clothing/shoes/horseshoes/captain
	time = 6 SECONDS
	tool_behaviors = list(TOOL_WIRECUTTER)
	category = CAT_EQUINE
	reqs = list(
		/obj/item/clothing/gloves/captain = 1,
		/obj/item/stack/sheet/iron = 1,
	)