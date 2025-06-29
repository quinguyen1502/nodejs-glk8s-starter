const { expect } = require('chai');

describe('Sample Test', function() {
  it('should return true when 1 + 1 equals 2', function() {
    expect(1 + 1).to.equal(2);
  });

  it('should return false when 1 + 1 does not equal 3', function() {
    expect(1 + 1 === 3).to.be.false;
  });
});
