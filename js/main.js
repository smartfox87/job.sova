$(function () {
  var parent = $('.Question')
  var sessionId = parent.attr('data-session-id')
  var questionId = parent.attr('data-question-id')
  $('.list-group-item.list-group-item-action').on('click', function () {
    var btn = $(this)
    var answerId = btn.attr('data-answer-id')
    var answerText = btn.text()
    var dataObj = {
      'status': 'next',
      'sessionId': sessionId,
      'questionId': questionId,
      'answerId': answerId,
      'answerText': answerText
    }
    $.post('index.php', dataObj, function () {
      location.href = 'index.php'
    })
  })
  $('.js-back').on('click', function () {
    var dataObj = {
      'status': 'back', 'sessionId': sessionId, 'questionId': questionId
    }
    $.post('index.php', dataObj, function () {
      location.href = 'index.php'
    })
  })
  $('.js-start').on('click', function () {
    var dataObj = {
      'status': 'start', 'sessionId': sessionId, 'questionId': questionId
    }
    $.post('index.php', dataObj, function () {
      location.href = 'index.php'
    })
  })
  $('.js-restart').on('click', function () {
    var dataObj = {
      'status': 'restart', 'sessionId': sessionId
    }
    $.post('index.php', dataObj, function () {
      location.href = 'index.php'
    })
  })
})