<template>
  <div class="vc-filters">
    <div class="vc-filters__open"></div>
    <div class="vc-filters__wrapper">
      <div class="vc-header__logo">
        <img src="dist/img/logo.png" alt="Job Sova" width="116" height="60">
      </div>
      <form class="vc-form">
        <div class="vc-form__row">
          <div class="vc-form__caption">Регион</div>
          <select class="vc-form__select" v-model="selectsValue.region" name="region" @change="onSelect($event)">
            <option v-for="key in availableFilterValues.region">{{key}}</option>
          </select>
          <a class="vc-form__reset-filter" name="region" href="#" title="Сбросить этот фильтр"
                  v-show="selectsValue.region" @click.prevent="onResetSelect($event)"></a>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption">Вид инвалидности</div>
          <select class="vc-form__select" v-model="selectsValue.disability" name="disability"
                  @change="onSelect($event)">
            <option v-for="key in availableFilterValues.disability">{{key}}</option>
          </select>
          <a class="vc-form__reset-filter" name="disability" href="#" title="Сбросить этот фильтр"
                  v-show="selectsValue.disability" @click.prevent="onResetSelect($event)"></a>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption">Специализация</div>
          <select class="vc-form__select" v-model="selectsValue.profession" name="profession"
                  @change="onSelect($event)">
            <option v-for="key in availableFilterValues.profession">{{key}}</option>
          </select>
          <a class="vc-form__reset-filter" name="profession" href="#" title="Сбросить этот фильтр"
                  v-show="selectsValue.profession" @click.prevent="onResetSelect($event)"></a>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption">Образование</div>
          <select class="vc-form__select" v-model="selectsValue.education" name="education"
                  @change="onSelect($event)">
            <option v-for="key in availableFilterValues.education">{{key}}</option>
          </select>
          <a class="vc-form__reset-filter" name="education" href="#" title="Сбросить этот фильтр"
                  v-show="selectsValue.education" @click.prevent="onResetSelect($event)"></a>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption  vc-form__caption--checkbox">Наличие вакансий</div>
          <label class="vc-form__label" v-for="(key,ind) in allCheckboxValues.recruitment" :key="key.id">
            <input class="vc-form__checkbox" type="checkbox"
                    :value="key" :name="'recruitment' + ind" @click="onChangeCheckbox($event)">
            <span>{{key}}</span></label>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption  vc-form__caption--checkbox">Опыт работы</div>
          <label class="vc-form__label" v-for="(key,ind) in allCheckboxValues.experience" :key="key.id">
            <input class="vc-form__checkbox" type="checkbox"
                    :value="key" :name="'experience' + ind" @click="onChangeCheckbox($event)">
            <span>{{key}}</span></label>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption  vc-form__caption--checkbox">Обучение</div>
          <label class="vc-form__label" v-for="(key,ind) in allCheckboxValues.training" :key="key.id">
            <input class="vc-form__checkbox" type="checkbox"
                    :value="key" :name="'training' + ind" @click="onChangeCheckbox($event)">
            <span>{{key}}</span></label>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption  vc-form__caption--checkbox">Безбарьерная среда</div>
          <label class="vc-form__label" v-for="(key,ind) in allCheckboxValues.working_conditions" :key="key.id">
            <input class="vc-form__checkbox" type="checkbox"
                    :value="key" :name="'working_conditions' + ind" @click="onChangeCheckbox($event)">
            <span>{{key}}</span></label>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption  vc-form__caption--checkbox">Место работы</div>
          <label class="vc-form__label" v-for="(key,ind) in allCheckboxValues.place_work" :key="key.id">
            <input class="vc-form__checkbox" type="checkbox"
                    :value="key" :name="'place_work' + ind" @click="onChangeCheckbox($event)">
            <span>{{key}}</span></label>
        </div>
        <div class="vc-form__row">
          <div class="vc-form__caption  vc-form__caption--checkbox">Тип занятости</div>
          <label class="vc-form__label" v-for="(key,ind) in allCheckboxValues.employment" :key="key.id">
            <input class="vc-form__checkbox" type="checkbox"
                    :value="key" :name="'employment' + ind" @click="onChangeCheckbox($event)">
            <span>{{key}}</span></label>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'filters',
    data() {
      return {
        selectsValue: {
          region: '',
          disability: '',
          profession: '',
          education: '',
        },
      }
    },
    props: ['availableFilterValues', 'allCheckboxValues'],
    methods: {
      onSelect(event) {
        const name = event.target.name
        const value = event.target.value
        if (value !== '') {
          event.target.parentElement.classList.add('vc-form__row--active')
          event.target.classList.add('vc-form__select--active')
          this.$emit('onSelect', {name, value})
        }
      },
      onResetSelect(event) {
        event.target.parentElement.classList.remove('vc-form__row--active')
        event.target.previousElementSibling.classList.remove('vc-form__select--active')
        const name = event.target.name
        this.selectsValue[name] = ''
        this.$emit('onResetSelect', name)
      },
      lockActiveSelect() {
        const allSelects = document.querySelectorAll('.vc-form__select')
        const activeSelects = document.querySelectorAll('.vc-form__select--active');
        [].forEach.call(allSelects, function (select) {
          select.removeEventListener('mousedown', lockActiveSelect)
        });
        [].forEach.call(activeSelects, function (select) {
          select.addEventListener('mousedown', lockActiveSelect)
        });
      },
      lockEmptySelect() {
        const allSelects = document.querySelectorAll('.vc-form__select')
        const emptySelects = [];
        [].forEach.call(allSelects, function (select) {
          if (select.textContent.length === 0) {
            emptySelects.push(select)
          }
        });
        [].forEach.call(allSelects, function (select) {
          select.removeEventListener('mousedown', lockEmptySelect)
        });
        [].forEach.call(emptySelects, function (select) {
          select.addEventListener('mousedown', lockEmptySelect)
        });
      },
      onChangeCheckbox(event) {
        const name = event.target.name
        const value = event.target.value
        if (event.target.checked) {
          event.target.classList.add('vc-form__checkbox--active')
          this.$emit('onSelect', {name, value})
        } else {
          this.onResetCheckbox(event)
        }
      },
      onResetCheckbox(event) {
        event.target.classList.remove('vc-form__checkbox--active')
        const name = event.target.name
        this.$emit('onResetSelect', name)
      },
      lockUnavailableCheckox() {
        const allCheckbox = document.querySelectorAll('.vc-form__checkbox');
        [].forEach.call(allCheckbox, (checkbox) => {
          const name = checkbox.name.slice(0, -1)
          const value = checkbox.value
          if (!~this.availableFilterValues[name].indexOf(value)) {
            checkbox.disabled = true
          } else {
            checkbox.disabled = false
          }
        });
      },
      fixationFiltersMenu() {
        const menu = document.querySelector('.vc-form')
        const menuTop = menu.getBoundingClientRect().top
        window.addEventListener('scroll', function () {
          if (menuTop < document.documentElement.scrollTop) {
            menu.classList.add('vc-form--fixed')
          } else {
            menu.classList.remove('vc-form--fixed')
          }
        })
      },
    },
    updated: function () {
      this.lockUnavailableCheckox()
      this.lockActiveSelect()
      this.lockEmptySelect()
    },
    mounted: function () {
      // this.fixationFiltersMenu()
    },
  }

  function lockActiveSelect(event) {
    event.preventDefault()
  }

  function lockEmptySelect(event) {
    event.preventDefault()
  }
</script>

<style lang="scss">
  @import "../assets/css/mixins";

  .vc-filters {
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    z-index: 900;
    background-color: #f9f9f9;
    width: 295px;
  }

  .vc-filters__open {
    display: none;
    position: absolute;
    left: 0;
    z-index: 900;
    top: 91px;
    width: 50px;
    height: 50px;
    background: rgba(125, 125, 125, 0.4) url("../assets/img/search.svg") no-repeat center / 60% 60%;
    &:hover + .vc-filters__wrapper {
      left: 0;
    }
  }

  .vc-filters__wrapper {
    position: absolute;
    left: 0;
    bottom: 0;
    top: 91px;
    padding: 3px 0 0 10px;
    box-sizing: border-box;
    transition: 600ms;
    z-index: 901;
    overflow-y: auto;
    &:hover {
      left: 0;
    }
    .vc-header__logo {
      display: none;
      position: absolute;
      left: 0;
      padding-left: 24px;
      top: 0;
      width: 100%;
    }
  }

  .vc-form {
    margin: 0;
    padding: 10px 0 10px 10px;
    width: 270px;
    box-sizing: border-box;
  }

  .vc-form__row {
    margin-bottom: 20px;
    padding-right: 20px;
    position: relative;
  }

  .vc-form__row--active {
    .vc-form__caption {
      position: static;
    }
  }

  .vc-form__caption {
    padding: 4px;
    font-weight: 700;
    position: absolute;
    font-size: 17px;
    top: 2px;
    z-index: 101;
  }

  .vc-form__caption--checkbox {
    position: static;
    margin-bottom: 2px;
  }

  .vc-form__select {
    position: relative;
    z-index: 200;
    border: none;
    outline: none;
    width: 240px;
    padding: 5px 4px 4px;
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    background: rgba(0, 0, 0, 0) url("../assets/img/down-arrow.svg") no-repeat 216px 7px/16px 16px;
    appearance: none;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    transition: 300ms;
    &:hover,
    &:focus {
      background-color: rgba(0, 0, 0, 0.04);
      border: none;
      border-bottom: 1px solid rgba(0, 0, 0, 0.02);
      outline: none;
    }
  }

  .vc-form__select--active {
    background-color: rgba(0, 0, 0, 0.04);
    border-bottom: 1px solid rgba(0, 0, 0, 0.02);
    &:hover {
      background-color: rgba(0, 0, 0, 0.06);
    }
  }

  .vc-form__reset-filter {
    display: block;
    right: 0;
    bottom: 6px;
    opacity: 0.3;
    transition: 300ms;
    @include modal-close(16px, 16px, 14px, 3px, #000000);
    &:hover {
      opacity: 1;
    }
  }

  .vc-form__label {
    display: inline-block;
    margin-left: 4px;
    padding-right: 24px;
    height: 22px;
    line-height: 1.25;
    font-weight: 400;
    &:hover {
      span {
        color: #000000;
        &::before {
          border-color: #000000;
        }
        &:after {
          border-left-color: #000000;
          border-bottom-color: #000000;
        }
      }
    }
    &:last-of-type {
      padding-right: 0;
    }
    input {
      display: none;
      &:checked + span {
        color: #000000;
        &::before {
          border-color: #000000;
        }
        &::after {
          display: block;
          border-left-color: #000000;
          border-bottom-color: #000000;
        }
      }
      &:disabled + span {
        opacity: 0.4;
      }
    }
    span {
      position: relative;
      display: inline-block;
      padding-left: 25px;
      cursor: pointer;
      color: #333333;
      &:before {
        content: '';
        width: 20px;
        height: 20px;
        top: -1px;
        left: 0;
        box-sizing: border-box;
        background-color: #ffffff;
        border: 1px solid #666666;
        border-radius: 4px;
        display: block;
        position: absolute;
      }
      &::after {
        @include checkbox-in(12px, 6px, 1px, #666666);
        top: 2px;
        left: 3px;
      }
    }
  }

  @media (max-width: 1200px) {
    .vc-filters {
      width: auto;
    }
    .vc-filters__open {
      display: block;
    }
    .vc-filters__wrapper {
      .vc-header__logo {
        display: flex;
      }
      padding-top: 95px;
      top: 0;
      padding-right: 15px;
      left: -295px;
      background-color: #f9f9f9;
      z-index: 1000;
    }
  }
</style>