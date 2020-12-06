<template>
  <div id="app" >
    <img alt="Vue logo" src="./assets/logo.png">
    <div>
    <div class="mt-2">ScCurrent: {{ scAddr }}</div>
    <b-form-input v-model="scAddr" placeholder="Enter Smart Contract Address"></b-form-input>
    <b-form-input v-model="price" placeholder="Enter Smart Contract Price"></b-form-input>
    <br>
    <div class="b-row">
    <b-button @click="setOwnership">Set Ownership</b-button>
    <b-button @click="mintTkn">Tokenize Ownership</b-button>
    <b-button @click="getLoan">Get Loan</b-button>
    <b-button @click="compLoan">Return Loan</b-button>
    <b-button @click="redeemTkn">Redeem Ownership</b-button>
    <br>
    <b-button @click="updateUSDTBalances">Get Token Balances In Console</b-button>
    <b-button @click="contractOwnerUpdate">Get Contract Owner in Console</b-button>
    </div>
    </div>

  </div>
</template>


<script>
import web3 from './assets/web3';
import owntkn from './assets/owntknInstance';
import usdt from './assets/usdtInstance';
import ownEx from './assets/ownExInstance';
export default {
  name: 'APP',
  data() {
    return {
      scAddr: '0x2dB37fC73DbCEF6143CfdAdBaaB54D8ca4438d66',
      price: '4',
      otBalance: '',
      acc1Balance: '',
      acc2Balance: '',
      contractOwner: '',
    };
  },
  methods: {
    setOwnership() {
      web3.eth.getAccounts().then((accounts) => {
        return owntkn.methods.setOwnership(this.scAddr)
          .send({ from: accounts[0] });
      })
    },
    mintTkn(){
      web3.eth.getAccounts().then((accounts) => {
        return owntkn.methods.mintTkn(this.scAddr, this.price)
          .send({ from: accounts[0] });
    })
    },
    getLoan(){
      web3.eth.getAccounts().then((accounts) => {
        return owntkn.methods.getLoan(this.scAddr)
          .send({ from: accounts[0] });
    })
    },
    compLoan(){
      web3.eth.getAccounts().then((accounts) => {
        return owntkn.methods.compLoan(this.scAddr)
          .send({ from: accounts[0] });
    })
    },
    redeemTkn(){
      web3.eth.getAccounts().then((accounts) => {
        return owntkn.methods.redeemTkn(this.scAddr)
          .send({ from: accounts[0] });
    })
    },
    updateUSDTBalances() {
      web3.eth.getAccounts().then((accounts) => {
        usdt.methods.balanceOf("0x2dB37fC73DbCEF6143CfdAdBaaB54D8ca4438d66").call({
          from: accounts[0] }).then(function(result) {
              console.log("OwnerToken Smart Contract USDT Balance: " + result);
            });
        usdt.methods.balanceOf("0x932Effb7f47f75126468F665E0651B090ec42552").call({
          from: accounts[0] }).then(function(result) {
              console.log("Account1 USDT Balance: " + result);
            });
        usdt.methods.balanceOf("0xF2B465C54597012F95Adfa493451B0cD6B53a96F").call({
          from: accounts[0] }).then(function(result) {
              console.log("Account2 Balance: " + result);
            });
          });
    },
    contractOwnerUpdate() {
      web3.eth.getAccounts().then((accounts) => {
        ownEx.methods.owner().call({
          from: accounts[0] }).then(function(result) {
              console.log("Current Owner: " + result);
            });
          });
    },
  },

};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
