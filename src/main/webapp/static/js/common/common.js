(function() {

	var core = {
		initialized : false,
		initialize : function() {
			if(this.initialized)return;
			this.initialized = true;
			this.build();
		},
		
		build: function() {
			//Placeholder for IE
			$('input, textarea').placeholder();
			
			// Page preloader
			//this.initPagePreloader();
		},
		
		initPagePreloader : function(options) {
			this.createPagePreloader();

			var $preloader = $('#page-preloader'),$spinner = $preloader.find('.spinner-loader');
			$(window).on('load', function() {
				$spinner.fadeOut();
				$preloader.delay(500).fadeOut('slow');
				window.scrollTo(0, 0);
			});
		},
		
		createPagePreloader : function() {
			var pagePreloader = document.createElement('div');
			pagePreloader.id = 'page-preloader';
			document.body.appendChild(pagePreloader);
			var spinner = document.createElement('span');
			spinner.className = 'spinner';
			pagePreloader.appendChild(spinner);
		}
	}

	core.initialize();
})();
