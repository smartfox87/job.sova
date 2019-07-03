<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#000000">
    <link rel="shortcut icon" href="./favicon.ico">
    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <title>Quest</title>
    <style type="text/css">
      .Question .card-body {
        min-height: 70px;
      }

      .Question .card-text {
        font-size: 1.3em;
      }

      .Question .list-group-item-action {
        cursor: pointer;
        color: black !important;
      }

      .Question .list-group-item-action:hover {
        background-color: #4582ec;
        border-color: #4582ec;
        color: white !important;
      }

      .App {
        margin-top: 5%;
      }
    </style>
  </head>
  <body>
    <div class="App">
      <div class="Question col-12 col-md-8 offset-md-2 col-lg-6 offset-lg-3" data-question-id="1" data-session-id="1">
        <div class="card border-primary mb-3">
          <div class="card-body">
            <p class="card-text">Отказ в разумном приспособлении</p>
          </div>
          <div class="card-body">
            <div class="alert alert-dismissible alert-light">Возможно сделать вывод о том, что имеет место такая форма
              дискриминации, как отказ в разумном приспособлении. Разумное приспособление означает, что для обеспечения
              равенства в определенной ситуации необходимо внести модификации или коррективы, к примеру, в обеспечении
              доступности среды или услуг. Важно, чтобы такие изменения не становились несоразмерным или неоправданным
              бременем, именно поэтому используется слово “разумное”. Конечно, любая такая ситуация должна
              рассматриваться индивидуально, именно чтобы соблюсти баланс между правом человека и возможностями тех, кто
              ответственны за приспособление.
            </div>
            <span>
              <button type="button" class="btn btn-lg btn-outline-primary mt-2 js-restart">Начать тест</button>
              <button type="button" class="btn btn-outline-warning mt-2" data-toggle="modal" data-target="#exampleModalLong">Определения дискриминации</button>
            </span>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle"><p class="card-text">Определения дискриминации</p></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="alert alert-dismissible alert-light"><strong></strong> Перечитайте определения дискриминации.
              Возможно, так сможете уточнить Вашу ситуацию.
            </div>
            <div class="alert alert-dismissible alert-light"><strong>Прямая</strong> - Прямая дискриминация случается,
              когда с человеком, обладающей(-им) каким-то признаком обращаются менее благоприятно в сравнении с кем-то,
              кто такого признака не имеет. При этом умысел или формальная причина не имеют значения. Дискриминация
              может
              выражаться в действии или бездеятельности. Причина или умысел неважны. Косвенная Судя по описанному, можно
              полагать о наличии косвенной дискриминации. Такое бывает, если внешне нейтральный критерий или практика
              может затрагивать человека, обладающую (-его) каким-то признаком, сильнее, чем других людей. В этой
              ситуации
              важно понимать, имеет ли такое различение действительно необходимое обоснование и справедливую цель.
              Определение такой справедливости иногда бывает непростой задачей, здесь необходимо руководствоваться
              международно признанными стандартами прав человека.
            </div>
            <div class="alert alert-dismissible alert-light"><strong>Отказ в разумном приспособлении</strong> - Разумное
              приспособление означает, что для обеспечения равенства в определенной ситуации необходимо внести
              модификации
              или коррективы, к примеру, в обеспечении доступности среды или услуг. Важно, чтобы такие изменения не
              становились несоразмерным или неоправданным бременем, именно поэтому используется слово “разумное”.
              Конечно,
              любая такая ситуация должна рассматриваться индивидуально, именно чтобы соблюсти баланс между правом
              человека и возможностями тех, кто ответственны за приспособление.
            </div>
            <div class="alert alert-dismissible alert-light"><strong>По ассоциации</strong> - Так случается, если
              несправедливому обращению подвергся (-лась) человек, связанный (-ая) с лицом, обладающим(-ей) признаком,
              по
              которому проводится необоснованное различие. Например, матери потерпевшего от гомофобного инцидента
              обвиняемые угрожают раскрыть на ее работе информацию про то, что ее сын гей. Если после этого к женщине
              ухудшится отношение на работе, это будет являться дискриминацией по ассоциации.
            </div>
            <div class="alert alert-dismissible alert-light"><strong>Виктимизация</strong> - Этот вид дискриминации
              возникает только как следствие какого-то другого ее вида. Проявляется в том, что человек сталкивается с
              негативными последствиями из-за поданной на дискриминацию жалобы или иного способа защитить свои права.
              Такими последствиями могут быть запугивание, увольнение и прочее.
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/main.js"></script>
  </body>
</html>
