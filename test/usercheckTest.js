const chai = require('chai'),
    assert = chai.assert,
    childProcess = require('child_process'),
    spawnSync = childProcess.spawnSync,
    userCheck = require('../usercheck.js'),
    fileName = 'testFile.php';

// Creating file:
spawnSync('touch', [`test/testdir/${fileName}`]);

describe('usercheck test:', () => {
    let res = userCheck.checkUser(`test/testdir/${fileName}`);
    console.log(res+'!!!');
    it('Should return string', () => {
        assert.typeOf(res, 'string')
    });
   
    // it('Checking result', () => {
        // let res = userCheck.checkUser(`test/testdir/${fileName}`);
        // console.log(`${fileName} ---> ${res}`);
    // });
});
// Deleting file
spawnSync('rm', [`test/testdir/${fileName}`]);
