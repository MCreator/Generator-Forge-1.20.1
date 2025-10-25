private static boolean canReceiveEnergy(LevelAccessor level, BlockPos pos, Direction direction) {
    AtomicBoolean result = new AtomicBoolean(false);
    BlockEntity entity = level.getBlockEntity(pos);
    if (entity != null)
        entity.getCapability(ForgeCapabilities.ENERGY, direction)
		    .ifPresent(capability -> result.set(capability.canReceive()));

	return result.get();
}