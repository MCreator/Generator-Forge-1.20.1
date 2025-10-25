private static int getEntityScore(String score, Entity entity){
	Scoreboard scoreboard = entity.level().getScoreboard();
	Objective scoreboardObjective = scoreboard.getObjective(score);
	if (scoreboardObjective != null)
		return scoreboard.getOrCreatePlayerScore(entity.getScoreboardName(), scoreboardObjective).getScore();
	return 0;
}