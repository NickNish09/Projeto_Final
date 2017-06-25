
$(document).ready(function(){
	$('.add').on('click',function(){

		$.ajax({
			url: '/carts/rise',
			type: 'POST',
			success: function(){
				
			}
		})
	})


	


})