<template>
  <div class="vc-result">
    <ul class="vc-result__list">
      <li v-for="companie in companies" class="vc-result__item">
        <h3 class="vc-result__caption">{{companie.title}}</h3>
        <div class="vc-result__row">
          <div class="vc-result__region">{{companie.region[0]}}</div>
        </div>
        <div class="vc-result__row">
          <div class="vc-result__name">Вид деятельности предприятия:</div>
          <p class="vc-result__descr">{{companie.activities}}</p>
        </div>
        <div v-if="companie.recruitment[0].toLowerCase()==='нету'">
          <div class="vc-result__row">
            <div class="vc-result__name">Нет вакансий</div>
          </div>
        </div>
        <div v-else-if="companie.recruitment[0].toLowerCase()==='есть'">
          <div class="vc-result__row">
            <div class="vc-result__name">Тип занятости:</div>
            <div class="vc-result__flex">
              <span class="vc-result__filter" v-for="empl in companie.employment">{{empl}}</span>
            </div>
          </div>
          <div class="vc-result__row">
            <div class="vc-result__name">Место работы:</div>
            <div class="vc-result__flex">
              <span class="vc-result__filter" v-for="place in companie.place_work">{{place}}</span>
            </div>
          </div>
          <div class="vc-result__row">
            <div class="vc-result__name">Доступные специализации:</div>
            <div class="vc-result__flex">
              <span class="vc-result__filter" v-for="prof in companie.profession">{{prof}}</span>
            </div>
          </div>
          <div class="vc-result__row">
            <div class="vc-result__name">Допустимые виды инвалидности:</div>
            <div class="vc-result__flex">
              <span class="vc-result__filter" v-for="disab in companie.disability">{{disab}}</span>
            </div>
          </div>
        </div>
        <div class="vc-result__row  vc-result__row--advanced">
          <div class="vc-result__cell" v-if="companie.address">
            <a href="#" class="vc-result__link" @click.prevent.stop="onShowDropdown($event)">Показать адрес</a>
            <div class="vc-result__dropdown" @click.stop><p>{{companie.address}}</p></div>
          </div>
          <div class="vc-result__cell" v-if="companie.contacts">
            <a href="#" class="vc-result__link" @click.prevent.stop="onShowDropdown($event)">Показать контакты</a>
            <div class="vc-result__dropdown" @click.stop><p>{{companie.contacts}}</p></div>
          </div>
        </div>
      </li>
    </ul>
    <slot name="pagination"></slot>
  </div>
</template>

<script>
  export default {
    name: 'results',
    data() {
      return {
        address: false,
        contacts: false,
      }
    },
    props: ['companies'],
    methods: {
      onShowDropdown(event) {
        this.onHideDropdown()
        const elem = event.target.nextElementSibling
        elem.classList.toggle('vc-result__dropdown--show')
        const windowHeight = document.documentElement.clientHeight
        const windowWidth = document.documentElement.clientWidth
        const elemPosition = elem.getBoundingClientRect()
        const elemHeight = elem.clientHeight
        if (elemPosition.bottom > windowHeight) {
          elem.style.top = -(elemHeight + 10) + 'px'
        } else {
          elem.style.top = '30px'
        }
        if (elemPosition.right > windowWidth) {
          elem.style.right = 0
          elem.style.left = 'auto'
        } else {
          elem.style.right = 'auto'
          elem.style.left = 0
        }
        // if (!elem.classList.contains('vc-result__dropdown--show')) {
        // } else {
        //   this.onHideDropdown()
        // }
      },
      onHideDropdown(event) {
        const allDropdown = document.querySelectorAll('.vc-result__dropdown');
        [].forEach.call(allDropdown, function (item) {
          item.classList.remove('vc-result__dropdown--show')
          item.style.top = '30px'
          item.style.right = 'auto'
          item.style.left = 0
        })
      },
    },
    mounted() {
      document.body.addEventListener('click', (event) => {
        this.onHideDropdown(event)
      })
    },
  }
</script>

<style lang="scss">
  @import "../assets/css/mixins";

  .vc-result {
    line-height: 1.4;
    margin-bottom: 50px;
  }

  .vc-result__list {
    margin: 1px;
    outline: 1px solid rgba(231, 231, 231, 0.6);
    outline-offset: -1px;
    padding: 0;
    list-style-type: none;
  }

  .vc-result__item {
    padding: 20px;
    outline: 1px solid rgba(231, 231, 231, 0.6);
    position: relative;
    transition: 300ms;
    box-sizing: border-box;
    width: 100%;
    &:hover {
      z-index: 200;
      outline: 1px solid rgba(118, 119, 184, 0.6);
    }
  }

  .vc-result__caption {
    margin: 0 0 3px;
    padding: 0;
    font-size: 22px;
    line-height: 1.2;
  }

  .vc-result__row {
    margin-bottom: 13px;
  }

  .vc-result__row--advanced {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 0;
    .vc-result__cell {
      margin-right: 30px;
      position: relative;
      z-index: 800;
      &:last-child {
        margin-right: 0;
      }
    }
  }

  .vc-result__flex {
    display: flex;
    flex-wrap: wrap;
  }

  .vc-result__name {
    font-weight: 700;
    font-size: 17px;
  }

  .vc-result__descr {
    margin: 2px 0 0;
    padding: 0;
  }

  .vc-result__filter {
    margin-right: 20px;
    position: relative;
    padding-left: 9px;
    text-transform: lowercase;
    @include pseudo-before(4px, 4px);
    &::before {
      background: #666666;
      border-radius: 50%;
      left: 0;
      top: 9px;
    }
  }

  .vc-result__link {
    outline: none;
    border: 0;
    text-decoration: none;
    cursor: pointer;
    box-shadow: none;
    z-index: 800;
    position: relative;
    color: rgba(118, 119, 184, 1);
    transition: 300ms;
    &:hover {
      color: rgba(118, 119, 184, 1);
      text-decoration: underline;
    }
  }

  .vc-result__dropdown {
    width: 0;
    z-index: 900;
    position: absolute;
    color: #333333;
    background-color: #ffffff;
    transition: opacity 400ms;
    opacity: 0;
    box-shadow: 0 0 8px rgba(0, 0, 0, .2);
    overflow: hidden;
    p {
      padding: 20px 25px;
      margin: 0;
    }
  }

  .vc-result__dropdown--show {
    width: 400px;
    opacity: 1;
  }

  @media (min-width: 1000px) {
    .vc-result__list {
      display: flex;
      flex-wrap: wrap;
    }
    .vc-result__item {
      width: 50%;
    }
  }

  @media (max-width: 590px) {
    .vc-result__row--advanced {
      position: relative;
      .vc-result__cell {
        position: static;
      }
    }
    .vc-result__dropdown {
      top: 100% !important;
      left: 0 !important;
      right: 0 !important;
    }
    .vc-result__dropdown--show {
      width: 100%;
    }
  }
</style>