class EnemyStandee {
	constructor(enemy, level, type, globalNum, summoned, totalPlayers) {
		this.name = enemy[0] + "_" + globalNum;
		this.type = type;

		this.health = enemy[1][level];
		if (enemy[0].includes("Boss") ) {
			this.health *= totalPlayers;
		}
		this.shield = enemy[5][level];
		this.maxHealth = this.health;
		this.maxShield = this.shield;
		this.attack = enemy[3][level];

		this.posCons = [];
		this.negCons = [];

		this.summoned = summoned;
		this.number = 0;
	}
}
