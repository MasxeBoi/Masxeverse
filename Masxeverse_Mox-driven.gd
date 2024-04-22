extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:

		for card in slotManager.all_friendly_cards() if isFriendly else slotManager.all_enemy_cards():
			if "Mox" in card.card_data.name:
				params[0].attack += 1
				params[0].health += 1
				draw_stats()
