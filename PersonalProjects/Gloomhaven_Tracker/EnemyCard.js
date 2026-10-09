class EnemyCard {
	constructor(normals, elites, level, totalPlayers) {
		this.name = normals[0];

		this.nMove = normals[2][level];
		this.nAttack = normals[3][level];
		this.nShield = normals[5][level];
		this.nCon01 = normals[6][level];
		this.nCon02 = normals[7][level];

		this.eMove = elites[2][level];
		this.eAttack = elites[3][level];
		this.eShield = elites[5][level];
		this.eCon01 = elites[6][level];
		this.eCon02 = elites[7][level];

		if (normals[0].includes("Boss") ) {
			this.nMove *= totalPlayers;
			this.eMove *= totalPlayers;
		}

		if (normals[0].includes("BossC") ) {
			this.nAttack += totalPlayers;
			this.eAttack += totalPlayers;
		}

		this.flipped = false;
		this.fresh = false;
	}
}
