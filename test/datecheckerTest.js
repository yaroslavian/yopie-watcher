const chai = require('chai'),
	asserttype = require('chai-asserttype'),
	chaidatetime = require('chai-datetime');

chai.use(asserttype);
chai.use(chaidatetime);

const assert = chai.assert,
	datechecker = require('../datechecker.js');
	
var firstRunResult = datechecker.checkDate(),
	secondRunResult = datechecker.checkDate();
	
describe('datechecker test:', () => {
	it('Should return Date', () => {
		assert.typeOf(firstRunResult, 'date');
	});
	
	it('Date should be less than current', () => {
		assert.beforeTime(firstRunResult, new Date());
	});
	
	it('Should return null when called on the same date', () => {
		assert.equal(secondRunResult, null);
	});
});
