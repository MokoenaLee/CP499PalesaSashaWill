function direct_to_resource_page(id)
{
   window.location.replace('/courses/' + id);
}

function clickable_rows()
{
   rows = $("table#courses > tbody > tr.course").on('click', function(){
      direct_to_resource_page($(this).attr("id"));
   });
}

$(document).ready(clickable_rows)
