<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit a list</title>
<script>
	function doValidation() {
		lblOb = document.getElementById("lblValidate");
		lblOb.innerHTML = "";
		var verify = true;
        if(document.editList.listName.value == "" ) {
           lblOb.innerHTML  += "* Please provide a list name.<br>";
           document.editList.listName.focus() ;
           verify = false;
        }
        if(document.editList.gamerName.value == "" ) {
            lblOb.innerHTML  += "* Please provide a gamer name.<br>";
            document.editList.gamerName.focus() ;
            verify = false;
         }
        return verify;
	}

</script>

</head>
<body>
<form action = "editExistingListServlet" name="editList" method="post" onsubmit="return(doValidation());">
List Name: <input type = "text" name = "listName" value="${listToEdit.listName }"><br/>
Gamer Name: <input type = "text" name = "gamerName" value="${listToEdit.gamer.gamerName}"><br/> 
<input type = "hidden" name = "id" value = "${listToEdit.id }">
Current Games:<br/>
<select name="currentGames" multiple size="6">
<c:forEach var = "listVal" items = "${listToEdit.listOfGames }">
	<option value = "${listVal.id }">${listVal.gameName} | ${listVal.genre} | ${listVal.gameConsole } | ${listVal.publisher} | ${listVal.releaseDate}</option>
	
</c:forEach>
</select>
<br/>
Remaining Games:<br/>
<select name="gamesToAdd" multiple size="6">
<c:forEach items="${requestScope.allGamesToAdd}" var="currentgame">
	<option value = "${currentgame.id }"> ${currentgame.gameName } | ${currentgame.genre } | ${currentgame.gameConsole } | ${currentgame.publisher } | ${currentgame.releaseDate }</option>
</c:forEach>
</select>

<br/>
<input type = "submit" value="Finish Edit"><input type = "button" value="Abandon Edit" onclick='window.location.assign("viewAllListsServlet");'>
</form>
<label id="lblValidate"></label>
<a href = "index.html"> Add a new game instead</a>
</body>
</html>