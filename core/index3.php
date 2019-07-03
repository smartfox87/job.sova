<!doctype html>
<html lang="ru">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/style.css">
    <title>Поиск вакансий</title>
  </head>
  <body>
    <div id="app"></div>
    <pre>
    <?php
      include_once 'api.php';
      var_dump($result)
    ?>
    </pre>
<!--    <div class="vc-search">-->
<!--      <form action="" class="vc-form">-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">ведется ли набор</div>-->
<!--          --><?php
//            foreach ($arrRecruitment as $key) {
//              echo "<label class=\"vc-form__radio\">
//                  <input type=\"radio\" name=\"recruitment\" value=\"{$key}\"><span>{$key}</span>
//                </label>";
//            }
//          ?>
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">вид инвалидности</div>-->
<!--          <select class="vc-form__select" name="disability">-->
<!--            --><?php
//              foreach ($arrDisability as $key) {
//                echo "<option value=\"{$key}\">{$key}</option>";
//              }
//            ?>
<!--          </select>-->
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">наименование вакансии</div>-->
<!--          <select class="vc-form__select" name="profession">-->
<!--            --><?php
//              foreach ($arrProfession as $key) {
//                echo "<option value=\"{$key}\">{$key}</option>";
//              }
//            ?>
<!--          </select>-->
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">занятость</div>-->
<!--          --><?php
//            foreach ($arrEmployment as $key) {
//              echo "<label class=\"vc-form__radio\">
//                  <input type=\"radio\" name=\"employment\" value=\"{$key}\"><span>{$key}</span>
//                </label>";
//            }
//          ?>
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">место работы</div>-->
<!--          --><?php
//            foreach ($arrPlace_work as $key) {
//              echo "<label class=\"vc-form__radio\">
//                  <input type=\"radio\" name=\"place_work\" value=\"{$key}\"><span>{$key}</span>
//                </label>";
//            }
//          ?>
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">условия работы</div>-->
<!--          --><?php
//            foreach ($arrWorking_conditions as $key) {
//              echo "<label class=\"vc-form__radio\">
//                  <input type=\"radio\" name=\"working_conditions\" value=\"{$key}\"><span>{$key}</span>
//                </label>";
//            }
//          ?>
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">образование</div>-->
<!--          <select class="vc-form__select" name="education">-->
<!--            --><?php
//              foreach ($arrEducation as $key) {
//                echo "<option value=\"{$key}\">{$key}</option>";
//              }
//            ?>
<!--          </select>-->
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">опыт работы</div>-->
<!--          --><?php
//            foreach ($arrExperience as $key) {
//              echo "<label class=\"vc-form__radio\">
//                  <input type=\"radio\" name=\"experience\" value=\"{$key}\"><span>{$key}</span>
//                </label>";
//            }
//          ?>
<!--        </div>-->
<!--        <div class="vc-form__row">-->
<!--          <div class="vc-form__caption">обучение</div>-->
<!--          --><?php
//            foreach ($arrTraining as $key) {
//              echo "<label class=\"vc-form__radio\">
//                  <input type=\"radio\" name=\"training\" value=\"{$key}\"><span>{$key}</span>
//                </label>";
//            }
//          ?>
<!--        </div>-->
<!--      </form>-->
<!--      <div class="vc-result">-->
<!--        <div class="vc-result__list">-->
<!--          --><?php //foreach ($arrResult as $key) {
//            echo "<div class=\"vc-result__item\">
//            <h3 class=\"vc-result__company-title\">{$key['title']}</h3>
//            <p class=\"vc-result__company-activities\">{$key['activities']}</p>
//            <h5 class=\"vc-result__profession\">{$key['profession']}</h5>
//            <p class=\"vc-result__contacts\">{$key['contacts']}</p>
//          </div> ";
//          }; ?>
<!--          <div class="vc-result__item">-->
<!--            <div class="vc-result__company-title"></div>-->
<!--            <div class="vc-result__profession"></div>-->
<!--            <div class="vc-result__contacts"></div>-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
<!--    </div>-->
    <script src="/dist/build.js"></script>
  </body>
</html>