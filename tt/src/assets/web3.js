import Web3 from 'web3';

if (window.ethereum) {
  window.web3 = new Web3(window.ethereum);
  try {
    // Request account access if needed
    window.ethereum.enable();
  } catch (error) {
    // User denied account access...
  }
}
//console.log(web3);
export default window.web3;
