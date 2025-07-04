/datum/quirk/item_quirk/signer
	name = "Signer"
	desc = "You possess excellent communication skills in sign language."
	icon = FA_ICON_HANDS
	value = 4
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_CHANGES_APPEARANCE
	medical_record_text = "Patient can communicate with sign language."

/datum/quirk/item_quirk/signer/add(client/client_source)
	quirk_holder.AddComponent(/datum/component/sign_language)

/datum/quirk/item_quirk/signer/add_unique(client/client_source)
	var/obj/item/clothing/gloves/gloves_type = /obj/item/clothing/gloves/radio
	if(isplasmaman(quirk_holder))
		gloves_type = /obj/item/clothing/gloves/color/plasmaman/radio
	if(ispony(quirk_holder))
		gloves_type = /obj/item/clothing/shoes/horseshoes/radio
	give_item_to_holder(gloves_type, list(LOCATION_GLOVES, LOCATION_HANDS))

/datum/quirk/item_quirk/signer/remove()
	qdel(quirk_holder.GetComponent(/datum/component/sign_language))
