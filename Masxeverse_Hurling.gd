extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# Was card summoned / moved to the space opposing this one?
	
	# On the board
	if not card.in_hand:
		if event == "card_summoned":
			# Fuck necromancer. All my homies hate necromancer
			if params[0].get_node("AnimationPlayer").current_animation == "DoublePerish":
				return

			if params[0] == card:
				smoke_em(params)


func smoke_em(params: Array):
        if isFriendly:
               fightManager.inflict_damage(1)
        else:
               fightManager.inflict_damage(-1)
