<template>
  <div class="vc-search">
    <div class="vc-search__header">
      <div class="vc-search__description">
        <h1>Вакансии для людей с инвалидностью</h1>
        <p>Наш ресурс разработан инклюзивной веб-студией <a class="vc-search__link"
                href="https://sova.by/">SovaTeam.by</a>
          под эгидой дистанционного образовательного проекта <a class="vc-search__link"
                  href="https://sova.by/">«У Совы»</a>. Мы сотрудничаем с компаниями по всей Беларуси и предоставляем
          максимально полный объём вакансий,
          доступных для людей с различными формами инвалидности. Возможно именно у нас Вы найдёте то, что требуется
          именно Вам!</p>
      </div>
      <img src="dist/img/content.png" alt="Вакансии для людей с инвалидностью">
    </div>
    <vc-filters v-if="dataDownloaded" :availableFilterValues="availableFilterValues"
            :allCheckboxValues="allCheckboxValues" @onSelect="onSelect" @onResetSelect="onResetSelect"></vc-filters>
    <div class="vc-search__body">
      <div class="vc-search__panel">
        <div class="vc-search__counts">Количество фирм: {{totalFilteredCompanies}}</div>
        <div class="vc-form__row">
          На странице
          <select class="vc-form__select" v-model="maxCompaniesPerPage">
            <option>5</option>
            <option>10</option>
            <option>20</option>
            <option>30</option>
          </select>
        </div>
      </div>
      <vc-results v-if="dataDownloaded" :companies="companiesWithPage">
        <vc-paginate :totalPage="totalPages" prevText="Предыдущая" nextText="Следующая" :pageRange="3"
                :maxPageWithoutDots="8" @btnClick="changePage" slot="pagination"></vc-paginate>
      </vc-results>
    </div>
    <vc-map v-if="dataDownloaded" :companies="resultCompanies" :mapOptions="mapOptions"></vc-map>
    <vc-partners></vc-partners>
    <button-top-page></button-top-page>
  </div>
</template>

<script>
  import VcFilters from './components/VcFilters'
  import VcResults from './components/VcResults'
  import VcMap from './components/VcMap'
  import VcPartners from './components/VcPartners'
  import VcPaginate from 'vue-paginate-al'
  import ButtonTopPage from './components/ButtonTopPage'
  import 'babel-polyfill'
  import axios from 'axios'
  import 'normalize.css'

  export default {
    name: 'App',
    data() {
      return {
        initCompanies: [{
          'id': '1',
          'title': 'ЧТПУП «ИнваШанс»',
          'activities': 'Швейное производство, оптовая и розничная торговля',
          'contacts': ' тел. 8(0152)722226',
          'region': [
            'Гродненская область'
          ],
          'address': '230005, г. Гродно, ул. Телеграфная, 22',
          'coordinates': [
            '53.682031',
            '23.836715'
          ],
          'recruitment': [
            'Есть'
          ],
          'disability': [
            '2-я группа',
            '3-я группа'
          ],
          'profession': [
            'швея'
          ],
          'employment': [
            'Полная',
            'Частичная'
          ],
          'place_work': [
            'Офис'
          ],
          'working_conditions': [
            'Нету'
          ],
          'education': [
            'без образования'
          ],
          'experience': [
            'Нету'
          ],
          'training': [
            'Нету'
          ]
        },
          {
            'id': '2',
            'title': 'Барановичское ЧУП «Блик» ОО «БелОГ»',
            'activities': 'Производство и продажа мужской обуви и швейных изделий',
            'contacts': '(8-0163) факс 41-67-42, 41-65-89, е-mail: blik@tut.by" blik.brest.by@mail.ru, http://www.blik.brest.by',
            'region': [
              'Брестская область'
            ],
            'address': '225406, Брестская область, г.Барановичи, ул.Пионерская, д.53',
            'coordinates': [
              '53.128489',
              '25.999364'
            ],
            'recruitment': [
              'Есть'
            ],
            'disability': [
              'по слуху'
            ],
            'profession': [
              'сборщик',
              'швея'
            ],
            'employment': [
              'Полная'
            ],
            'place_work': [
              'Офис'
            ],
            'working_conditions': [
              'Нету'
            ],
            'education': [
              'без образования'
            ],
            'experience': [
              'Нету'
            ],
            'training': [
              'Есть'
            ]
          },
          {
            'id': '3',
            'title': 'Брестское Унитарное предприятие «Промбрис» ОО «БелОГ».',
            'activities': 'Производство: белье постельное; блузы женские; дроссели; одежда специальная; перемычки к электроплитам; сорочки; сорочки форменные; трусы; халаты женские; халаты медицинские; шнуры к бытовой технике; электророзжиг к газовым плитам',
            'contacts': 'Телефон: (0162)21-13-43-рук., 21-75-18-гл.бухгал., 21-72-86-план. отд., зам.дир.по эконом. Факс:  21-72-23-прием., E-mail: prombris@brest.by, http://prombris.belorussia.su/',
            'region': [
              'Брестская область'
            ],
            'address': '224030, г. Брест, ул. Куйбышева, 55',
            'coordinates': [
              '52.090384',
              '23.696309'
            ],
            'recruitment': [
              'Нету'
            ],
            'disability': [
              ''
            ],
            'profession': [
              ''
            ],
            'employment': [
              'Полная'
            ],
            'place_work': [
              'Офис'
            ],
            'working_conditions': [
              'Нету'
            ],
            'education': [
              'без образования'
            ],
            'experience': [
              'Нету'
            ],
            'training': [
              'Нету'
            ]
          },
          {
            'id': '4',
            'title': 'ТрайдексБелПлюс',
            'activities': 'Компания ООО "Трайдексбелплюс" - крупный дистрибьютор компьютерных комплектующих, телефонов, планшетов, ноутбуков, мониторов, периферийных устройств, аксессуаров, мультимедиа в Республике Беларусь.',
            'contacts': 'Тел./факс: 8-017-362-76-81; 8-017-362-76-83 По всем вопросам звоните +375 44 573 8885',
            'region': [
              'Минск'
            ],
            'address': '223016 Минский район Новодворский с/с 33/1-8 ком.64 , район д.Большое Стиклево',
            'coordinates': [
              '53.870914',
              '27.702498'
            ],
            'recruitment': [
              'Есть'
            ],
            'disability': [
              '1-я группа',
              '2-я группа',
              '3-я группа',
              'глухонемые',
              'колясочники',
              'ментальные растройства',
              'по зрению',
              'по слуху'
            ],
            'profession': [
              'бухгалтер',
              'водитель',
              'инженер',
              'кладовщик',
              'маркировщик',
              'менеджер по продажам',
              'специалист по кадрам',
              'уборщик'
            ],
            'employment': [
              'Полная',
              'Частичная'
            ],
            'place_work': [
              'Офис',
              'Удаленно'
            ],
            'working_conditions': [
              'Нету'
            ],
            'education': [
              'без образования'
            ],
            'experience': [
              'Нету'
            ],
            'training': [
              'Нету'
            ]
          },
          {
            'id': '5',
            'title': 'Гомельское Производственное Частное Унитарное Предприятие «Випра» ОО «БелОГ»',
            'activities': 'Производство: арматура водозапорная; белье постельное; блузы; вентили к газовым баллонам; краны для газовых и водяных систем; краны пробковые; краны топливные; литье цветных металлов; одежда детская; платья; регуляторы давления газа; сорочки; трусы; халат',
            'contacts': 'Телефон: (0232)57-54-61-прием., 57-35-92-зам.дир., Факс: (0232)57-62-10-маркет.отд., http://vipra.by/, E-mail: vipra@tut.by',
            'region': [
              'Гомельская область'
            ],
            'address': '246007, г. Гомель, пр-д Троллейбусный, 4 ',
            'coordinates': [
              '52.470761',
              '30.993755'
            ],
            'recruitment': [
              'Есть'
            ],
            'disability': [
              '3-я группа'
            ],
            'profession': [
              'наладчик'
            ],
            'employment': [
              'Полная'
            ],
            'place_work': [
              'Офис'
            ],
            'working_conditions': [
              'Нету'
            ],
            'education': [
              'без образования'
            ],
            'experience': [
              'Нету'
            ],
            'training': [
              'Нету'
            ]
          },
          {
            'id': '6',
            'title': 'Минское Частное Унитарное Предприятие «Виток» ОО «БелОГ»',
            'activities': 'Производство: жгуты для автотранспорта, электропроводки; изделия металлические; панели для холодильников; пружины Работы/услуги: металлообработка; монтаж электропроводки.',
            'contacts': 'Телефон: (017)204-33-53-прием., E-mail: info@vitok.by, www.vitok.by',
            'region': [
              'Минск'
            ],
            'address': '220073, г. Минск, ул. Гусовского, 20 ',
            'coordinates': [
              '53.903827',
              '27.514346'
            ],
            'recruitment': [
              'Есть'
            ],
            'disability': [
              '3-я группа',
              'по слуху'
            ],
            'profession': [
              'автоматчик',
              'вязальщик',
              'наладчик',
              'шлифовщик'
            ],
            'employment': [
              'Полная'
            ],
            'place_work': [
              'Офис'
            ],
            'working_conditions': [
              'Нету'
            ],
            'education': [
              'без образования'
            ],
            'experience': [
              'Нету'
            ],
            'training': [
              'Нету'
            ]
          },
          {
            'id': '7',
            'title': 'Могилевское производственное частное унитарное предприятие “МЕТИЗ” ОО «БелОГ»',
            'activities': 'Изготовление деталей методом холодной штамповки, механо - обработка. Производство метизов и других деталей из проволоки, гибки и накатки резьбы.Нанесение цинковых и фосфатных покрытий. Полимерно-порошковое покрытие деталей в любой цвет.Литьё деталей из цв',
            'contacts': 'Директор приемная: +375 (222) 28-34-39тел./факс.: +375 (222) 23-59-95 Главный инженер приемная: +375 (222) 28-34-39тел.: +375 (222) 23-75-09 Отдел сбыта e-mail: metizu@mail.ruтел.: +375 (222) 28-36-08тел./факс.: +37',
            'region': [
              'Могилевская область'
            ],
            'address': '212022, г. Могилев, ул. Космонавтов, 27 ',
            'coordinates': [
              '53.905329',
              '30.303822'
            ],
            'recruitment': [
              'Есть'
            ],
            'disability': [
              'по слуху'
            ],
            'profession': [
              'слесарь',
              'токарь',
              'штамповщик'
            ],
            'employment': [
              'Полная'
            ],
            'place_work': [
              'Офис'
            ],
            'working_conditions': [
              'Нету'
            ],
            'education': [
              'без образования'
            ],
            'experience': [
              'Нету'
            ],
            'training': [
              'Нету'
            ]
          },],
        templatePropForAllFilters: {
          'region': [],
          'disability': [],
          'profession': [],
          'education': [],
          'recruitment': [],
          'employment': [],
          'place_work': [],
          'working_conditions': [],
          'experience': [],
          'training': []
        },
        templatePropForCheckboxFilters: {
          'recruitment': [],
          'employment': [],
          'place_work': [],
          'working_conditions': [],
          'experience': [],
          'training': []
        },
        selectedFilters: {},
        currentPage: 1,
        maxCompaniesPerPage: 10,
        regionOptions: {
          'Беларусь': {zoom: 7, coordinates: [53.870914, 27.702498]},
          'Минск': {zoom: 11, coordinates: [53.902757, 27.543196]},
          'Минская область': {zoom: 8, coordinates: [53.870914, 27.702498]},
          'Брестская область': {zoom: 8, coordinates: [52.607137, 25.359578]},
          'Гродненская область': {zoom: 8, coordinates: [53.550373, 25.089170]},
          'Витебская область': {zoom: 8, coordinates: [55.207239, 29.372577]},
          'Могилевская область': {zoom: 8, coordinates: [53.894548, 30.330654]},
          'Гомельская область': {zoom: 8, coordinates: [52.439269, 30.107900]},
        },
        dataDownloaded: true,
      }
    },
    computed: {
      resultCompanies() {
        if (this.dataDownloaded) {
          const selectedFilters = this.selectedFilters
          let filteredCompanies = []
          if (Object.keys(selectedFilters).length) {
            filteredCompanies = this.initCompanies.filter((companie) => {
              const arrComparisonCompanies = []
              for (let filter in selectedFilters) {
                let filterName = filter
                if (/\d/.test(filterName)) {
                  filterName = filter.slice(0, -1)
                }
                arrComparisonCompanies.push(~companie[filterName].indexOf(selectedFilters[filter]))
              }
              if (~arrComparisonCompanies.indexOf(0)) {
                return false
              } else {
                return true
              }
            })
          } else {
            filteredCompanies = this.initCompanies.filter(() => true)
          }
          return filteredCompanies
        }
      },
      availableFilterValues() {
        if (this.dataDownloaded) {
          const resultFilters = JSON.parse(JSON.stringify(this.templatePropForAllFilters))
          this.resultCompanies.forEach((companie) => {
            for (let filter in resultFilters) {
              companie[filter].forEach(function (propertie) {
                if (!~resultFilters[filter].indexOf(propertie) && propertie.length > 0) {
                  resultFilters[filter].push(propertie)
                  resultFilters[filter].sort()
                }
              })
            }
          })
          return resultFilters
        }
      },
      allCheckboxValues() {
        if (this.dataDownloaded) {
          const resultFilters = JSON.parse(JSON.stringify(this.templatePropForCheckboxFilters))
          this.initCompanies.forEach((companie) => {
            for (let filter in resultFilters) {
              companie[filter].forEach(function (propertie) {
                if (!~resultFilters[filter].indexOf(propertie) && propertie.length > 0) {
                  resultFilters[filter].push(propertie)
                  resultFilters[filter].sort()
                }
              })
            }
          })
          return resultFilters
        }
      },
      totalFilteredCompanies() {
        if (this.dataDownloaded) {
          return this.resultCompanies.length
        }
      },
      totalPages() {
        if (this.dataDownloaded) {
          return Math.ceil(this.totalFilteredCompanies / this.maxCompaniesPerPage)
        }
      },
      companiesWithPage() {
        if (this.dataDownloaded) {
          let fromCompanie = 0
          if (this.currentPage > 1) {
            fromCompanie = this.maxCompaniesPerPage * (this.currentPage - 1)
          }
          const toCompanie = fromCompanie + this.maxCompaniesPerPage
          return this.resultCompanies.slice(fromCompanie, toCompanie)
        }
      },
      mapOptions() {
        if (this.selectedFilters.region) {
          return this.regionOptions[this.selectedFilters.region]
        } else {
          return this.regionOptions['Беларусь']
        }
      },
    },
    components: {VcFilters, VcResults, VcMap, VcPaginate, VcPartners, ButtonTopPage},
    created() {
      // this.getData()
      // this.processData()
    },
    mounted() {
      window.addEventListener('load', function () {
        document.body.style.opacity = 1
      })
    },
    methods: {
      getData() {
        axios.get('api.php')
          .then((response) => {
            let arrCompanies = response.data;
            arrCompanies.forEach((key) => {
              key.recruitment = key.recruitment.split(',')
              key.region = key.region.split(',')
              key.coordinates = key.coordinates.split(', ')
              key.profession = key.profession.split(',').sort()
              key.training = key.training.split(',')
              key.disability = key.disability.split(',').sort()
              key.education = key.education.split(',')
              key.employment = key.employment.split(',')
              key.experience = key.experience.split(',')
              key.place_work = key.place_work.split(',')
              key.working_conditions = key.working_conditions.split(',')
            })
            this.initCompanies = arrCompanies
            this.dataDownloaded = true
          });
      },
      processData() {
        this.initCompanies.forEach((key) => {
          key.recruitment = key.recruitment.split(',')
          key.region = key.region.split(',')
          key.coordinates = key.coordinates.split(', ')
          key.profession = key.profession.split(',').sort()
          key.training = key.training.split(',')
          key.disability = key.disability.split(',').sort()
          key.education = key.education.split(',')
          key.employment = key.employment.split(',')
          key.experience = key.experience.split(',')
          key.place_work = key.place_work.split(',')
          key.working_conditions = key.working_conditions.split(',')
        })
      },
      onSelect(obj) {
        this.selectedFilters = Object.assign({}, this.selectedFilters, {[obj.name]: obj.value})
        this.resetPage()
      },
      onResetSelect(name) {
        delete this.selectedFilters[name]
        this.selectedFilters = Object.assign({}, this.selectedFilters)
        this.resetPage()
      },
      changePage(currenPage) {
        this.currentPage = currenPage
      },
      resetPage() {
        this.currentPage = 1
      },
    }
  }
</script>

<style lang="scss">
  @font-face {
    font-family: "Roboto";
    font-style: normal;
    font-weight: 400;
    src: local("Roboto"), local("Roboto"),
    url("assets/fonts/roboto_regular.woff2") format("woff2"),
    url("assets/fonts/roboto_regular.woff") format("woff");
  }

  @font-face {
    font-family: "Roboto";
    font-style: normal;
    font-weight: 700;
    src: local("Roboto"), local("Roboto"),
    url("assets/fonts/roboto_bold.woff2") format("woff2"),
    url("assets/fonts/roboto_bold.woff") format("woff");
  }

  @import "assets/css/style";
  .vc-search__link {
    text-decoration: none;
    color: #3f5880;
    font-weight: 700;
    &:hover {
      text-decoration: underline;
    }
  }

  .vc-search__panel {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
    box-sizing: border-box;
    .vc-form__row {
      padding: 0;
      margin-bottom: -8px;
    }
    .vc-form__select {
      margin-left: 4px;
      width: 60px;
      background-position: 36px 7px;
    }
  }

  .vc-search {
    box-sizing: border-box;
    font-size: 16px;
    input, textarea, select, button {
      font-size: 16px;
      font-family: 'Roboto', sans-serif;
    }
    .pagination {
      display: inline-block;
      padding-left: 20px;
      margin: 30px 0;
      border-radius: 4px;
      & > li {
        display: inline;
        & > a,
        & > span {
          position: relative;
          float: left;
          padding: 6px 12px;
          margin-left: -1px;
          line-height: 1.42857143;
          color: #3f5880;
          text-decoration: none;
          background-color: #ffffff;
          border: 1px solid #dddddd;
          text-decoration: none;
        }
      }
    }
    .pagination > li > a:hover, .pagination > li > span:hover, .pagination > li > a:focus, .pagination > li > span:focus {
      z-index: 2;
      color: #23527c;
      background-color: #eeeeee;
      border-color: #dddddd;
    }
    a:hover {
      cursor: pointer;
    }
    .pagination > li:first-child > a, .pagination > li:first-child > span {
      margin-left: 0;
      /*border-top-left-radius: 4px;*/
      /*border-bottom-left-radius: 4px;*/
    }
    .pagination > li:last-child > a, .pagination > li:last-child > span {
      /*border-top-right-radius: 4px;*/
      /*border-bottom-right-radius: 4px;*/
    }
    .pagination > .disabled > span, .pagination > .disabled > span:hover, .pagination > .disabled > span:focus, .pagination > .disabled > a, .pagination > .disabled > a:hover, .pagination > .disabled > a:focus {
      color: #777777;
      cursor: not-allowed;
      background-color: #ffffff;
      border-color: #dddddd;
    }
    .pagination .active a {
      z-index: 0;
    }
    .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
      z-index: 3;
      color: #ffffff;
      cursor: default;
      background-color: #3f5880;
      border-color: #3f5880;
    }
  }

  .vc-search__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 40px 20px;
    box-sizing: border-box;
    min-height: 500px;
    margin-left: 295px;
    font-size: 18px;
    img {
      margin: 10px auto;
      max-height: 400px;
      max-width: 90%;
    }
  }

  .vc-search__counts {
    font-size: 30px;
  }

  .vc-search__body {
    margin-left: 295px;
  }

  .vc-search__description {
    margin: 40px 40px 40px 0;
    line-height: 1.4;
    max-width: 800px;
    h1 {
      margin: 0;
      padding: 0;
      line-height: 1;
      color: #3f5880;
      font-size: 42px;
    }
    p {
      font-size: 20px;
      line-height: 1.55;
    }
  }

  @media (max-width: 1200px) {
    .vc-search__body, .vc-search__header {
      margin-left: 0;
    }
  }

  @media (max-width: 900px) {
    .vc-search__header {
      flex-direction: column;
    }
    .vc-search__description {
      margin: 20px 0 0 0;
    }
  }

  @media (max-width: 600px) {
    .vc-search__header {
      h1 {
        font-size: 38px;
        line-height: 0.95;
      }
      p {
        font-size: 18px;
        line-height: 1.3;
      }
    }
    .vc-search {
      .pagination {
        li {
          &:first-of-type, &:last-of-type {
            a {
              font-size: 0;
              width: 35px;
              height: 36px;
              box-sizing: border-box;
              background: url(assets/img/paginate-left.svg) no-repeat 9px 6px / auto 60%;
            }
          }
          &:last-of-type {
            a {
              background: url(assets/img/paginate-right.svg) no-repeat 11px 6px / auto 60%;
            }
          }
        }
      }
    }
    .vc-search__panel {
      flex-direction: column;
      align-items: flex-start;
    }
    .vc-search__counts {
      font-size: 25px;
      margin-bottom: 5px;
    }
  }
</style>
