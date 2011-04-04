<%
String strWidth		= request.getParameter("width");
String strHeight	= request.getParameter("height");
String strLabel		= request.getParameter("label");
String thisPage		= "divtoolbox_size.jsp";

int thin = 310;
int wide = 370;
int shrt = 400;
int tall = 567;


int width 	= thin;
int height	= shrt;
int colTwoWidth = 430;

if (null != strWidth){
	width = Integer.parseInt(strWidth);
} else {strWidth = "default ("+width+"px)";}
if (null != strHeight){
	height = Integer.parseInt(strHeight);
} else {strHeight = "default ("+height+"px)";}
if (null == strLabel){
	strLabel = "default size";
}

%>
<html>
<head>
	<title>toolbox width css generator</title>
	<style>
	BODY {font-family:sans-serif;}
	TEXTAREA {color:white;background-color:black;}
	</style>
</head>
<body>
<h1>toolbox width css generator</h1>
<p>Select the correct size from the list below</p>
<ul>
	<li><a href="<%=thisPage%>?width=<%= thin %>&height=<%= shrt %>&label=size 1"><%= thin %>/<%= shrt %> (size 1, default thin/short)</a></li>
	<li><a href="<%=thisPage%>?width=<%= wide %>&height=<%= shrt %>&label=size 2"><%= wide %>/<%= shrt %> (size 2 wide/short)</a></li>
	<li><a href="<%=thisPage%>?width=<%= thin %>&height=<%= tall %>&label=size 3"><%= thin %>/<%= tall %> (size 3 thin/tall)</a></li>
	<li><a href="<%=thisPage%>?width=<%= wide %>&height=<%= tall %>&label=size 4"><%= wide %>/<%= tall %> (size 4 wide/tall)</a></li>
</ul>
<p>Or input required sizes here</p>
<form action="<%=thisPage%>" method="get">
<label>width: <input type="text" name="width" value="<%=width%>" /> </label>;
<label>height: <input type="text" name="height" value="<%=height%>" /> </label>;
<label>label: <input type="text" name="label" value="custom size" /> </label>;
<input type="submit" value="get css" />
<hr/>
<textarea style="width:90%;height:300px;">
/*
 *
 * This file overwrites styles is divtoolbox.css;
 * Generated: <%= new java.util.Date() %>;
 * <%= strLabel %>;
 * width 	= <%=strWidth%>;
 * height 	= <%=strHeight%>;
 *
 */

#divToolBox
{
	height:<%=height%>px;
}
#divToolBox #divTabs 
{
	height:<%=height%>px;
}
#divToolBox #divSearchBar
{
	width:<%= (width - 2 ) %>px; /* minus 2 */
}
#divToolBox DIV.unit /* basic display properties, over-ride width on an individual basis  */
{
	height:<%= (height - 2) %>px; /* minus 2px for border */
}
/* unit width ammend here */
#divToolBox DIV.unit 		{width: <%= (width - 2 ) %>px;}
#divToolBox TEXTAREA 		{width: <%= (width - 32 ) %>px;}
/* - ends -*/


/* general toolbox styles */
#divToolBox #divNotes TEXTAREA.readonly {
	width: <%= (width - 26 ) %>px;
}	
* HTML #divToolBox #divNotes TEXTAREA.readonly {
	/* IE settings */
	width: <%= (width - 42 ) %>px;
}




/* quickinfo and localinfo panel unit */
#divToolBox #divLocalInfo #divLiBody, 			
#divToolBox #divQuickInfo #divQiBody 			
{
	height: 200px;
}



/* quickinfo clinical evidence search */
#divToolBox #divQuickInfo #divCePop		
{
	width:<%= (width - 82 ) %>px;
}

/* search panel unit */
#divToolBox #divSearchPanelForm,
#divToolBox #divSearchPanelCE, 
#divToolBox #divSearchPanel 
{
	width:<%= (colTwoWidth ) %>px;
}
#divToolBox #divSearchPanelCE IFRAME, 
#divToolBox #divSearchPanel IFRAME 
{
	width:<%= (colTwoWidth ) %>px;
}
#divToolBox #divSearchPanel #iframeSearchResults {
	height: <%= (height - 42 ) %>px;
}
#divToolBox #divSearchPanelCE #iframeSearchResultsCE {
	height: <%= (height - 22 ) %>px;
}
#divToolBox #divSearchPanelForm *.innerBlock {
	width: <%= (colTwoWidth - 50 ) %>px;
}
/* admin  */

#divToolBox #divAdminInfoRevert {
	width: <%= (width + colTwoWidth)- 1 %>px; /* width is current left col (<%=width%>) plus right col (<%=colTwoWidth%>) -1 */
}
#divToolBox #divAdminInfoRevert DIV.revertwidth {
	width: <%= ( (width + colTwoWidth)/2 ) - 30 %>px; /* as above /2 - 30 (padding) */
}

</textarea>

</form>
</body>
</html>
