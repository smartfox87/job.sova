<?php
  $link = mysqli_connect('localhost', 'sovaby_job', '9h+u]0)J*Y^g', 'sovaby_job_vacancies');
  
  if (mysqli_connect_errno()) {
    echo mysqli_connect_errno() . '-' . mysqli_connect_error();
    exit();
  }
  
  $sql = "SELECT * FROM `companies`";
  $arrCompanies = getData($link, $sql);
  
  function getData($link, $sql) {
    $query = mysqli_query($link, $sql);
    return mysqli_fetch_all($query, MYSQLI_ASSOC);
  }
  
  $link->close();
  header("Content-type: application/json");
  echo json_encode($arrCompanies, JSON_UNESCAPED_UNICODE);
  exit();