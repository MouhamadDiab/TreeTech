<?php
include("connect.php");
session_start();
if(!isset($_GET["categorie"])){
    header("Location: home.php");
    exit;
}
$now = date('Y-m-d H:i:s');
$ss = "SELECT * FROM account where role = 'admin' ;";
$query = mysqli_query($conn, $ss);
$r_profile = mysqli_fetch_array($query);

?>



<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Items</title>
    <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/show_items.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/normalize.css">


    <script>
        window.onload = function() {
            document.querySelector(".InnerContainer").className = "InnerContainer slideUp";
            document.querySelector(".InnerContainer").style.visibility = "visible";
        };
    </script>


</head>

<body>

<?php
if (isset($_GET["categorie"])) {
$sql="SELECT  items.Item_Id as itemID, items.Name as itemName, items.Description, items.role,
        items.Price, items.Price_after_discount, items.Add_Date, items.Picture, items.Discount_Percentage, items.status, items.discount_end_date,
                    categories.id, categories.Name as category_name, items.Add_Date
        from items ,categories
        where   items.Cat_ID=categories.Id
        And   items.role = 1
        and   categories.Id=".$_GET["categorie"] . " ORDER BY Discount_Percentage DESC, Add_Date DESC"  ;

        $r_res=mysqli_query($conn,$sql);

        $cat = "SELECT  c.Id, c.Name  FROM categories c WHERE Id=" .$_GET["categorie"];
        $r_cat = mysqli_query($conn, $cat);
        $category = mysqli_fetch_array($r_cat);

        $_SESSION["cat_id"] =  $category["Id"]; 


}
?>


        <a href=<?php echo 'home.php#' . $category['Name'] ?> style="top:50px;left:50px;position:sticky">
             <span class="link icon"><i class="fa-solid fa-arrow-left"></i></span>
        </a>
        <h3 class="title" id="accessories">
            <span><?php echo $category['Name'][0] ?></span>
            <?php $categoryNameWithoutFirstLetter = substr($category['Name'], 1);
            echo $categoryNameWithoutFirstLetter; ?>
        </h3>
        <div class="form_footer">
        <form name="frm" method="post" class="form1">

            <input  type="text" name="find" id="find" value="<?php if(isset($_POST['find'])) echo $_POST['find'];?>"  onchange="submit()">
            
            <button type="submit" style="position: relative;left: -40px; border:none; background-color: white;"> <i class="fa-solid fa-magnifying-glass"></i> </button>
        </form>
        </div>


    <?php
if (isset($_GET["categorie"])) {


if(isset($_POST['find']) ) {
    $text=$_POST['find'];
    $sql="SELECT  items.Item_Id as itemID, items.Name as itemName, items.Description, items.role,
    items.Price, items.Price_after_discount, items.Add_Date, items.Picture, items.Discount_Percentage, items.status, items.discount_end_date,
                  categories.id, categories.Name as category_name, items.Add_Date
    from items ,categories
    where items.Name LIKE '%$text%'
    and   items.Cat_ID=categories.Id
    And   items.role = 1
    and   categories.Id=".$_GET["categorie"]  . " ORDER BY Discount_Percentage DESC, Add_Date DESC"  ;

    $r_res=mysqli_query($conn,$sql);

    $cat = "SELECT  c.Id, c.Name  FROM categories c WHERE Id=" .$_GET["categorie"];
    $r_cat = mysqli_query($conn, $cat);
    $category = mysqli_fetch_array($r_cat);

    $_SESSION["cat_id"] =  $category["Id"]; 

    if(mysqli_num_rows($r_res)>0){ 
?>
    <div class="outerContainer">
            <form class="form" action="./details_card.php" method="get">
                
                <div class="InnerContainer ">
                    <?php while ($result = mysqli_fetch_array($r_res)) { ?>
                        <a href="details_card.php?ID=<?php echo $result['itemID'] ?>&source=show_items">
                            <div class="card" id=<?php echo $result['itemID'] ?>>

                                <Div class="product-card">
                                    <img src="images/<?php echo $result['category_name'] ?>/<?php echo $result['Picture'] ?>" alt="Product" class="product-card__image" />
                                    <figcaption class="product-card__caption">
                                        <header class="product-card__header">
                                            <h2 class="product-card__title"><?php echo $result['itemName'] ?></h2>
                                            <p class="product-card__subtitle"><?php echo $result['Description'] ?></p>
                                        </header>
                                        <footer class="product-card__footer">
                                            <?php


                                            if ($result['Discount_Percentage'] > 0 && $result['discount_end_date'] > $now) {
                                                echo '<div class="on-sale-badge"> SALE &nbsp;' . $result['Discount_Percentage'] . '%</div>';
                                                echo  " <span style='color:Black;' >  &nbsp;</span><span style='color:green;'> $" . $result['Price_after_discount'] . " &nbsp; </span>  <span style='color:Black;' > &nbsp;</span> <span style='color:gray;text-decoration: line-through;'>$" . $result['Price'] . "</span>";
                                            } else if ($result['Discount_Percentage'] > 0 && $result['discount_end_date'] < $now) {

                                                $update = "update items set discount_percentage=0 where Item_ID=" . $result['Item_ID'];
                                                mysqli_query($conn, $update);
                                                $result['Discount_Percentage'] = 0;


                                                $discounted_price = $result['Price'] - ($result['Price'] * ($result['Discount_Percentage'] / 100));



                                                echo  " <span class='product-card__price'> $" . number_format($discounted_price, 2) . " </span>";
                                            } else {
                                                echo  " <span class='product-card__price'> $" . $result['Price'] . " </span>";
                                            }

                                            ?>

                                        </footer>

                                    </figcaption>
                                </Div>
                            </div>
                        </a>
                    <?php } ?>
    </div>

    
    
   <?php }
    
    
    else{
        echo "no result found!";
    }
}
else{
        $sql="SELECT  items.Item_Id as itemID, items.Name as itemName, items.Description, items.role,
        items.Price, items.Price_after_discount, items.Add_Date, items.Picture, items.Discount_Percentage, items.status, items.discount_end_date,
                    categories.id, categories.Name as category_name, items.Add_Date
        from items ,categories
        where   items.Cat_ID=categories.Id
        And   items.role = 1
        and   categories.Id=".$_GET["categorie"] . " ORDER BY Discount_Percentage DESC, Add_Date DESC"  ;

        $r_res=mysqli_query($conn,$sql);

        $cat = "SELECT  c.Id, c.Name  FROM categories c WHERE Id=" .$_GET["categorie"];
        $r_cat = mysqli_query($conn, $cat);
        $category = mysqli_fetch_array($r_cat);

        $_SESSION["cat_id"] =  $category["Id"]; 

    if(mysqli_num_rows($r_res)>0){ 
?>
<div class="outerContainer">
        <form class="form" action="./details_card.php" method="get">
          
            <div class="InnerContainer ">
                <?php while ($result = mysqli_fetch_array($r_res)) { ?>
                    <a href="details_card.php?ID=<?php echo $result['itemID'] ?>&source=show_items">
                        <div class="card" id=<?php echo $result['itemID'] ?>>

                            <Div class="product-card">
                                <img src="images/<?php echo $result['category_name'] ?>/<?php echo $result['Picture'] ?>" alt="Product" class="product-card__image" />
                                <figcaption class="product-card__caption">
                                    <header class="product-card__header">
                                        <h2 class="product-card__title"><?php echo $result['itemName'] ?></h2>
                                        <p class="product-card__subtitle"><?php echo $result['Description'] ?></p>
                                    </header>
                                    <footer class="product-card__footer">
                                        <?php


                                        if ($result['Discount_Percentage'] > 0 && $result['discount_end_date'] > $now) {
                                            echo '<div class="on-sale-badge"> SALE &nbsp;' . $result['Discount_Percentage'] . '%</div>';
                                            echo  " <span style='color:Black;' >  &nbsp;</span><span style='color:green;'> $" . $result['Price_after_discount'] . " &nbsp; </span>  <span style='color:Black;' > &nbsp;</span> <span style='color:gray;text-decoration: line-through;'>$" . $result['Price'] . "</span>";
                                        } else if ($result['Discount_Percentage'] > 0 && $result['discount_end_date'] < $now) {

                                            $update = "update items set discount_percentage=0 where Item_ID=" . $result['Item_ID'];
                                            mysqli_query($conn, $update);
                                            $result['Discount_Percentage'] = 0;


                                            $discounted_price = $result['Price'] - ($result['Price'] * ($result['Discount_Percentage'] / 100));



                                            echo  " <span class='product-card__price'> $" . number_format($discounted_price, 2) . " </span>";
                                        } else {
                                            echo  " <span class='product-card__price'> $" . $result['Price'] . " </span>";
                                        }

                                        ?>

                                    </footer>

                                </figcaption>
                            </Div>
                        </div>
                    </a>
                <?php } ?>


            </div>
    
   <?php }  
    
    else{
        echo "no result found!";
    }
}

}  
?>
</body>


</html>