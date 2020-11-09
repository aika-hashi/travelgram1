/** Vue アプリケーションの生成 **/
function createApp() {
  Vue.use(VueAwesomeSwiper)

  new Vue({
    el: "#app",
    data: {
      // swiperの設定
      swiperOption: {
        // ページネーションの設定
        pagination: {
          el: ".swiper-pagination"
        },
        // ページ送りボタンの設定
        navigation: {
          // 次に進むボタンの設定
          nextEl: ".swiper-button-next",
          // 前に戻るボタンの設定
          prevEl: ".swiper-button-prev"
        }
      },
    }
  })
}

/** 初期化 **/
function initialize() {
  createApp()
}

document.addEventListener("DOMContentLoaded", initialize.bind(this))
