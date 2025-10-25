private static AbstractArrow createArrowWeaponItemStack(AbstractArrow entityToSpawn, int knockback, byte piercing) {
	if (knockback > 0)
		entityToSpawn.setKnockback(knockback);
	if (piercing > 0)
		entityToSpawn.setPierceLevel(piercing);
	return entityToSpawn;
}