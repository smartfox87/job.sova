<template>
  <div class="vc-map">
    <yandex-map :zoom="mapOptions.zoom" :coords="[mapOptions.coordinates[0], mapOptions.coordinates[1]]"
            style="width: 100%; height: 500px;">
      <ymap-marker v-for="companie in companiesWithCoordinates" marker-type="placemark" :marker-id="companie.id"
              :coords="[companie.coordinates[0], companie.coordinates[1]]" :hint-content="companie.title"
              :icon="{color: 'blue', glyph: 'home'}" cluster-name="1" :key="companie.id"
              :balloon="{header: companie.title, body: companie.address}"></ymap-marker>
    </yandex-map>
  </div>
</template>

<script>
  import {yandexMap, ymapMarker} from 'vue-yandex-maps'

  export default {
    name: 'vc-map',
    props: ['companies', 'mapOptions'],
    computed: {
      companiesWithCoordinates() {
        const arrResult = []
        this.companies.forEach(function (companie) {
          if (companie.coordinates[1]) {
            arrResult.push(companie)
          }
        })
        return arrResult
      }
    },
    components: {yandexMap, ymapMarker},
  }
</script>

<style lang="scss">
  .vc-map {
    margin-left: 295px;
    position: relative;
    z-index: 100;
  }

  @media (max-width: 1200px) {
    .vc-map {
      margin-left: 0;
    }
  }
</style>