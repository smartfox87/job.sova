<template>
  <div class="top  js-button-top-page" id="js-button-top-page" data-active="false">
    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 405.457 405.457" style="enable-background:new 0 0 405.457 405.457;" xml:space="preserve">
	<path style="fill:#222222;" d="M331.322,341.31c4.985-0.078,9.911-2.163,13.438-5.688l55-55c3.601-3.599,5.697-8.659,5.697-13.75
		s-2.096-10.151-5.697-13.75L216.478,69.841c-3.599-3.601-8.659-5.697-13.75-5.697s-10.151,2.096-13.75,5.697L5.697,253.123
		C2.096,256.722,0,261.782,0,266.873s2.096,10.151,5.697,13.75l55,55c3.598,3.591,8.651,5.681,13.734,5.681
		s10.136-2.09,13.734-5.681l114.562-114.562L317.29,335.623C320.958,339.287,326.139,341.387,331.322,341.31z"/>
</svg>
  </div>
</template>

<script>
  export default {
    name: 'button-top-page',
    created() {
      window.addEventListener('load', function () {
        const btn = document.querySelector('#js-button-top-page')
        window.addEventListener('scroll', function () {
          if (window.innerHeight < document.documentElement.scrollTop) {
            btn.setAttribute('data-active', 'true')
          } else {
            btn.setAttribute('data-active', 'false')
          }
        })
        btn.addEventListener('click', function () {
          requestAnimationFrame(function animate() {
            document.documentElement.scrollTop = document.documentElement.scrollTop - 100;
            if (document.documentElement.scrollTop > 0) {
              requestAnimationFrame(animate);
            }
          });
        })
      })
    }
  }
</script>

<style lang="scss" scoped>
  .top {
    z-index: 900;
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    bottom: 110px;
    right: 20px;
    width: 46px;
    height: 46px;
    background-color: rgba(125, 125, 125, 0.4);
    cursor: pointer;
    transition: 400ms opacity;
    &:hover {
      background-color: rgba(125, 125, 125, 0.6);
    }
    &[data-active='false'] {
      width: 0;
      opacity: 0;
    }
    &[data-active='true'] {
      width: 46px;
      opacity: 1;
    }
    svg {
      width: 12px;
      height: 12px;
    }
  }
</style>