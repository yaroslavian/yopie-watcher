const chai = require('chai'),
	asserttype = require('chai-asserttype'),
	chaidatetime = require('chai-datetime');

chai.use(asserttype);
chai.use(chaidatetime);

const assert = require('chai').assert,
	datechecker = require('../datechecker.js');
	
var firstRunResult = datechecker.checkDate(),
	secondRunResult = datechecker.checkDate();
	
describe('datechecker test:', function() {
	it('Should return Date', function() {
		assert.typeOf(firstRunResult, 'date');
	});
	
	it('Date should be less than current', function() {
		assert.beforeTime(firstRunResult, new Date());
	});
	
	it('Should return null when called on the same date', function() {
		assert.equal(secondRunResult, null);
	});
});
