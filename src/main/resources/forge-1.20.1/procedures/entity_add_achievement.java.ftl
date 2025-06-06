if(${input$entity} instanceof ServerPlayer _player) {
	Advancement _adv = _player.server.getAdvancements().getAdvancement(ResourceLocation.parse("${generator.map(field$achievement, "achievements")}"));
	AdvancementProgress _ap = _player.getAdvancements().getOrStartProgress(_adv);
	if (!_ap.isDone()) {
		for (String criteria : _ap.getRemainingCriteria())
			_player.getAdvancements().award(_adv, criteria);
	}
}