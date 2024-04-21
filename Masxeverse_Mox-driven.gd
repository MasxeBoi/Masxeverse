extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
		
		var atk_acc = 0
		var hp_acc = 0
		
		for card in slotManager.all_friendly_cards() if isFriendly else slotManager.all_enemy_cards():
			if "Mox" in card.card_data.name: #in theory activates for each friendly mox
				continue
			
			atk_acc += fCard.attack
			hp_acc += fCard.health
		
		var new_data = card.card_data
		
		new_data.attack = atk_acc
		new_data.health = max(1, hp_acc)
		
		card.from_data(new_data)