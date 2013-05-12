<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>


</head>
<body>

<!-- TABS -->
<script>
$(document).ready(function() {
    $('.tabs').each(function() {
        var $ul = $(this);
        var $li = $ul.children('li');

        $li.each(function() { 
            var $trescTaba = $($(this).children('a').attr('href')); 
            if ($(this).hasClass('active')) { 
                $trescTaba.show(); 
            } else {
                $trescTaba.hide(); 
            }
        });
                 
      
        $li.click(function() {$(this).children('a').click()});
      
        $li.children('a').click(function() {
       
            $li.removeClass('active');
                      
            $li.each(function() {
                $($(this).children('a').attr('href')).hide();
            });
         
            $(this).parent().addClass('active');
            $($(this).attr('href')).show();
            return false;
        });
    });
}); 
</script>


<ul class="tabs">
        <li class="active"><a href="#tab-1" class="active">Zakladka 1</a></li>
        <li><a href="#tab-2">Zakladka 2</a></li>
        <li><a href="#tab-3">Zakladka 3</a></li>
</ul>
 
<div id="tab-1" class="tab">
        first
</div>
<div id="tab-2" class="tab">
       second
</div>
<div id="tab-3" class="tab">
        third
</div>


</body>
</html>