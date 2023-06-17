<h1 class="text-light">Welcome to <?php echo $_settings->info('name') ?></h1>
<hr>
<div class="container">
  <?php 
    $files = array();
    $rooms = $conn->query("SELECT * FROM `room_list` order by rand() ");
    while($row = $rooms->fetch_assoc()){
      if(!is_dir(base_app.'uploads/room_'.$row['id']))
      continue;
      $fopen = scandir(base_app.'uploads/room_'.$row['id']);
      foreach($fopen as $fname){
        if(in_array($fname,array('.','..')))
          continue;
        $files[]= validate_image('uploads/room_'.$row['id'].'/'.$fname);
      }
    }
  ?>
