$(document).ready(function(){
	$(".tingz").on("click",function(e){
		e.preventDefault();
		// var _this = $(this);
		var url = $(this).attr('href');

		$.ajax({
			url: url,
			method: 'GET',
			dataType: 'json',
			// data: _this.serialize(),
			success: function(data){
				console.log(data);
				if(data.length>0){
					for(var i = 0; i < data.length; i++){
						if(data[i] != " "){
							$("#project-category").html("Project: "+data[i].title+" Description: "+data[i].description);
						}
					}
				}else{
					$("#project-category").html("<h2>Sorry dude nothing's there!</h2>");
				}

			}

		});
	});
});
