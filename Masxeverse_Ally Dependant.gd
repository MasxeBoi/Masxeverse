extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# Don't die in hand
	if card.get_parent().name == "PlayerHand":
		return

	# attached_card_summoned represents the card bearing the sigil being summoned
	if (event == "card_summoned" and params[0] == card) or (event == "card_perished" and params[0] != card):

		# Die if no guys
		if not "Perish" in card.get_node("AnimationPlayer").current_animation:
		
		print("no adjescent allies! wah wah")
		
		var cardSlots = slotManager.playerSlots if isFriendly else slotManager.enemySlots
		var slot = card.slot_idx()
		
		if slot > 0 and slotManager.is_slot_empty(cardSlots[slot - 1]):
			card.get_node("AnimationPlayer").play("Perish")

		if slot < 3 and slotManager.is_slot_empty(cardSlots[slot + 1]):
			card.get_node("AnimationPlayer").play("Perish")
		
