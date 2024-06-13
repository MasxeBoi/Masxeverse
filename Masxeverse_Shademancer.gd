extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	
	if event == "card_summoned" and params[0] == card and isFriendly:
		
		print("Shademancer triggered!")

		# Draw the shade
		fightManager.draw_card(card.card_data["evolution"])