Extends SigilEffect

func handle_event(event: String, params: Array):
 if event == "card_perished" and params[0] == card and isFriendly:
   slotManager.get_friendly_card(card.slot_idx()).inflict_damage(1)