class Player {
	constructor(name, level, health, shield) {
		this.name = name;
		this.level = level;

		this.health = health;
		this.shield = shield;
		this.maxHealth = health
		this.maxShield = shield;

		this.attack = 0;

		this.posCons = [];
		this.negCons = [];
	}
}
