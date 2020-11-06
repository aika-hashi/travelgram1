/** Vueアプリの生成 */
function createApp() {
  // swiperをインストール
  Vue.use(VueAwesomeSwiper)
  
  
  new Vue({
    el: "#app"
  })
 }
 
 /** 初期化 */
 function initialize() {
  createApp()
 }
 
 document.addEventListener("DOMContentLoaded",initialize.bind(this))