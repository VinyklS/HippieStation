/datum/species/tarajan
	name = "Catbeast"
	id = "tarajan"
	say_mod = "meows"
	blacklisted = 0
	sexes = 1
	species_traits = list(MUTCOLORS,EYECOLOR,NOTRANSSTING)
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	mutant_bodyparts = list("tail_human")
	meat = /obj/item/weapon/reagent_containers/food/snacks/meat/slab/human/mutant/cat
	skinned_type = /obj/item/stack/sheet/animalhide/cat
	teeth_type = /obj/item/stack/teeth/cat

/datum/species/tarajan/qualifies_for_rank(rank, list/features)
	if(rank in GLOB.command_positions) //even if you turn off humans only
		return 0
	if(rank in GLOB.security_positions) //This list does not include lawyers.
		return 0
	if(rank in GLOB.science_positions)
		return 0
	if(rank in GLOB.medical_positions)
		return 0
	if(rank in GLOB.engineering_positions)
		return 0
	if(rank == "Quartermaster") //QM is not contained in command_positions but we still want to bar mutants from it.
		return 0
	return 1

/datum/species/tarajan/on_species_gain(mob/living/carbon/human/C)
	C.draw_hippie_parts()
	C.dna.features["tail_human"] = "TCat"
	. = ..()

/datum/species/tarajan/on_species_loss(mob/living/carbon/human/C)
	C.draw_hippie_parts(TRUE)
	C.dna.features["tail_human"] = null
	. = ..()

/datum/species/tarajan/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		H.endTailWag()
