extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_summoned" and params[0] == card:
		
		print("Gang's here! There's a horde")
		
		var cardSlots = slotManager.playerSlots if isFriendly else slotManager.enemySlots
		var slot = card.slot_idx()
		
                		var old_data = card.card_data.duplicate()
		old_data.sigils = old_data.sigils.duplicate()

		old_data.sigils.erase("Horde")
                #stole this stuff from the fecundity sigil, hope it works

                  
		if slot > 0 and slotManager.is_slot_empty(cardSlots[slot - 1]):
			slotManager.summon_card(old_data, slot - 1, isFriendly)

		if slot < 3 and slotManager.is_slot_empty(cardSlots[slot + 1]):
			slotManager.summon_card(old_data, slot + 1, isFriendly)
