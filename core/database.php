<?php
  $link = mysqli_connect('localhost', 'root', '', 'vacancies');
  
  if (mysqli_connect_errno()) {
    echo mysqli_connect_errno() . '-' . mysqli_connect_error();
    exit();
  }
  
  $companies = "SELECT * FROM `companies` WHERE id > 1";
  $allDefaultValue = "SELECT * FROM `companies` WHERE id = 1";
  
  function getData($link, $sql) {
    $link = mysqli_query($link, $sql);
    return mysqli_fetch_all($link, 1);
  }
  $arrResult = getData($link, $companies);
  $arrDefaultValue = getData($link, $allDefaultValue);
  
  var_dump($arrDefaultValue);
//  var_dump($arrDefaultValue["recruitment"]);
  $arrRecruitment = explode(',', $arrDefaultValue[0]['recruitment']);
  $arrDisability = explode(',', $arrDefaultValue[0]['disability']);
  $arrProfession = explode(',', $arrDefaultValue[0]['profession']);
  $arrEmployment = explode(',', $arrDefaultValue[0]['employment']);
  $arrPlace_work = explode(',', $arrDefaultValue[0]['place_work']);
  $arrWorking_conditions = explode(',', $arrDefaultValue[0]['working_conditions']);
  $arrEducation = explode(',', $arrDefaultValue[0]['education']);
  $arrExperience = explode(',', $arrDefaultValue[0]['experience']);
  $arrTraining = explode(',', $arrDefaultValue[0]['training']);