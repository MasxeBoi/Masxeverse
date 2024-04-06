extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	# Did this card just get hit?
	if event == "card_hit" and params[0] == card:
		
		# params[0] == card hit
		# params[1] == card that hit it
		
		params[0].health += 2
