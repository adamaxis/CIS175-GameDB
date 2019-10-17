<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a new list</title>
<script>
	function doValidation() {
		lblOb = document.getElementById("lblValidate");
		lblOb.innerHTML = "";
		var verify = true;
        if(document.createList.listName.value == "" ) {
           lblOb.innerHTML  += "* Please provide a list name.<br>";
           document.createList.listName.focus() ;
           verify = false;
        }
        if(document.createList.gamerName.value == "" ) {
            lblOb.innerHTML  += "* Please provide a gamer name.<br>";
            document.createList.listName.focus() ;
            verify = false;
         }
        if(document.createList.allGamesToAdd.value == "" ) {
            lblOb.innerHTML  += "* Please select at least one game from the list.<br>";
            verify = false;
         }
        return verify;
	}

</script>
</head>
<body>
	<form action="createNewListServlet" name="createList" method="post" onsubmit="return(doValidation());">
		List Name:<input type="text" name="listName"><br /> 
		Gamer Name: <input type="text" name="gamerName"><br /> 
		Available Games:<br /> <select name="allGamesToAdd" multiple size="6">
			<c:forEach items="${requestScope.allGames}" var="currentgame">
				<option value="${currentgame.id }">${currentgame.gameName}
					| ${currentgame.genre } | ${currentgame.gameConsole } |
					${currentgame.publisher } | ${currentgame.releaseDate }</option>
			</c:forEach>
		</select> <br /> <input type="submit" value="Create List and Add Games">
	</form>
	<label id="lblValidate"></label>
	<a href="index.html">Go add a new game</a>
</body>
</html>