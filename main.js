// var dataset = [ 5, 10, 15, 20, 25 ];
// d3.select("body").select("div")
// .data(dataset)
// .enter()
// .append("div")
// .attr("class", "bar");

var dataset;
d3.csv("Distribution_of_Nuclear_Electric.csv", function(data)
{
		//console.log(data);
	alert(data);
	dataset = data;
	generateVis(); 
	hideLoadingMsg();
}

var p = d3.select("body")
  .selectAll("p")
  .text("www.ourd3js.com");      
p.style("color","red")
 .style("font-size","72px");