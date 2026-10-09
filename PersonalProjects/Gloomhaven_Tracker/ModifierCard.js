
class ModifierCard {
	constructor(value) {
		this.name = value;
		this.shuffle = false;

		//Number
		if (typeof value === "number") {
			this.value = value;
			this.effect = null;
		}
		//If Number + Neg Condition or Heal
		else if (value.includes("Poison") || value.includes("Wound") || value.includes("Muddle") || value.includes("Heal") ) {
			this.value = value.split("_")[0];
			this.effect = value.split("_")[1];
			if (value.includes("Heal") ) { this.effect = null; }
		}
		//If Only Curse, Null, Bless, or Crit
		else if (value === "Curse" || value === "Null" || value === "Bless" || value === "Crit") {
			this.value = null;
			this.effect = value;
			if (value === "Null" || value === "Crit") {
				this.shuffle = true;
			}
		}
		//If Number + Curse
		else if (value.includes("Curse") ) {
			this.value = value.split("_")[0];
		}
	}
}
