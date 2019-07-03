<template>
  <div class="vc-partners">
    <tiny-slider :responsive="responsiveOptions" :autoplayButtonOutput="false"
            :controlsContainer="'.vc-partners__controls'">
      <div class="vc-partners__item">
        <a href="#" class="vc-partners__link">
          <img src="../assets/img/links-logo-hoster.png" alt="">
        </a>
      </div>
      <div class="vc-partners__item">
        <a href="#" class="vc-partners__link">
          <img src="../assets/img/links-logo-imena.png" alt="">
        </a>
      </div>
      <div class="vc-partners__item">
        <a href="#" class="vc-partners__link">
          <img src="../assets/img/links-logo-irvin.png" alt="">
        </a>
      </div>
      <div class="vc-partners__item">
        <a href="#" class="vc-partners__link">
          <img src="../assets/img/links-logo-itsova.png" alt="">
        </a>
      </div>
      <div class="vc-partners__item">
        <a href="#" class="vc-partners__link">
          <img src="../assets/img/links-logo-sovaby.png" alt="">
        </a>
      </div>
    </tiny-slider>
    <div class="vc-partners__controls">
      <div class="vc-partners__toggler  vc-partners__toggler--prev"></div>
      <div class="vc-partners__toggler  vc-partners__toggler--next"></div>
    </div>
  </div>
</template>

<script>
  import '../assets/css/tiny-slider.css'
  import TinySlider from 'vue-tiny-slider'

  export default {
    name: 'vc-partners',
    data() {
      return {
        responsiveOptions: {
          480: {items: 2, 'mouseDrag': true, loop: true, autoplay: true,},
          720: {items: 2},
          1000: {items: 3},
          1240: {items: 4},
          1500: {items: 5, autoplay: false},
        },
      }
    },
    components: {TinySlider},
  }
</script>

<style lang="scss">
  @import "../assets/css/mixins";

  .vc-partners {
    border-bottom: 2px solid #e7e7e7;
    border-top: 2px solid #e7e7e7;
    margin: 50px 0 80px 295px;
    padding: 30px 20px;
    position: relative;
    box-sizing: border-box;
    .tns-outer {
      button[aria-controls='tns2'] {
        display: block;
        width: 20px;
        height: 20px;
        outline: 1px solid red;
      }
    }
  }

  .vc-partners__link {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 105px;
    opacity: 0.4;
    transition-duration: 300ms;
    &:hover, &:active {
      opacity: 1;
    }
  }

  .vc-partners__toggler {
    @include center-y();
    width: 20px;
    height: 32px;
    cursor: pointer;
    opacity: 0.4;
    border: none;
    outline: none;
    &:hover {
      opacity: 1;
    }
  }

  .vc-partners__toggler--prev {
    left: 0;
    background: url("../assets/img/chevron-left.svg") no-repeat;
  }

  .vc-partners__toggler--next {
    right: 0;
    background: url("../assets/img/chevron-right.svg") no-repeat;
  }

  @media (max-width: 1200px) {
    .vc-partners {
      margin-left: 0;
    }
  }
</style>