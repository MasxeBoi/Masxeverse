extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# Was card summoned / moved to the space opposing this one?
	
	# On the board
	if not card.in_hand:
		if event == "card_summoned" and params[0] == card:
			# Fuck necromancer. All my homies hate necromancer
			if params[0].get_node("AnimationPlayer").current_animation == "DoublePerish":
				return
				
			# If I'm moving, hit 'em where it hurts
			if params[0] == card
				hit_and_run(params)


func hit_and_run(params: Array):
	var opposing_card = \
		slotManager.get_enemy_card(card.slot_idx()) if isFriendly \
		else slotManager.get_friendly_card(card.slot_idx())
	
	if opposing_card:
		opposing_card.take_damage(card, 999)
