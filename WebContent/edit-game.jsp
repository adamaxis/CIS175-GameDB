<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit a game</title>
<script src="moment.js"></script>
<script>
	function doValidation() {
		lblOb = document.getElementById("lblValidate");
		lblOb.innerHTML = "";
		var verify = true;
        if(document.editGame.name.value == "" ) {
           lblOb.innerHTML  += "* Please provide a game name.<br>";
           document.editGame.name.focus() ;
           verify = false;
        }
        if(document.editGame.genre.value == "" ) {
            lblOb.innerHTML  += "* Please provide a genre.<br>";
            document.editGame.genre.focus() ;
            verify = false;
         }
        if(document.editGame.console.value == "" ) {
            lblOb.innerHTML  += "* Please provide a console.<br>";
            document.editGame.console.focus() ;
            verify = false;
         }
        if(document.editGame.publisher.value == "") {
            lblOb.innerHTML  += "* Please provide a publisher.<br>";
            document.editGame.publisher.focus() ;
            verify = false;
         }
        var dateString = moment(document.editGame.date.value);
        if(!dateString.isValid() || document.editGame.date.value.length > 10) {
            lblOb.innerHTML  += "* Please provide a valid date[dd-mm-yyyy].<br>";
            verify = false;
        } else if(verify == true) {
			document.editGame.date.value = dateString.format('YYYY-MM-DD');
        }
        return verify;
	}
</script>
</head>
<body>
<form action = "editGameServlet" name = "editGame" method = "post" onsubmit="return(doValidation());">
<table>
<tr><td>Name: <input type="text" name = "name" value= "${gameToEdit.gameName}"></td></tr>
<tr><td>Genre: <input type="text" name = "genre" value= "${gameToEdit.genre }"></td></tr>
<tr><td>Console: <input type="text" name ="console" value= "${gameToEdit.gameConsole }"></td></tr>
<tr><td>Publisher: <input type="text" name = "publisher" value ="${gameToEdit.publisher }"></td></tr>
<tr><td>Release Date: <input type="date" name = "date" value="${gameToEdit.releaseDate}">
</table>
<label id="lblValidate"></label>
<input type = "hidden" name = "id" value = "${gameToEdit.id }"	>
<input type = "submit" value = "Save Edited Game"><input type = "button" value="Abandon Edit" onclick='window.location.assign("viewAllGamesServlet");'><br>
</form>
</body>
</html>