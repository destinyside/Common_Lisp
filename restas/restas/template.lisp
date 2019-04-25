(defmacro with-html ((&key title) &body body)
  `(cl-who:with-html-output-to-string 
     (*standard-output* nil :prologue nil :indent t)
     ;; html content start
     (:html
       (:head
	 (:title ,title)
	 (:meta :charset "UTF-8")
	 (:meta :name "viewport" :content "width=device-width, initial-scale=1.0")
	 (:link :rel "stylesheet" :href (cat *static-url* "/bootstrap/css/bootstrap.min.css"))
	 (:link :rel "stylesheet" :href (cat *static-url* "/css/main.css"))
	 (:link :rel "stylesheet" :href (cat *static-url* "/css/colorful.css"))
	 (:link :rel "stylesheet" :href (cat *static-url* "/bootoast/bootoast.min.css"))
	 (:script :src (cat *static-url* "/js/jquery/jquery-3.3.1.js"))
	 (:script :src (cat *static-url* "/bootstrap/js/bootstrap.min.js"))
	 (:script :src (cat *static-url* "/bootoast/bootoast.min.js"))
	 (:script :src (cat *static-url* "/js/encrypt/crypto-js/core.js"))
	 (:script :src (cat *static-url* "/js/encrypt/crypto-js/enc-base64.js"))
	 (:script :src (cat *static-url* "/js/encrypt/crypto-js/md5.js"))
	 (:script :src (cat *static-url* "/js/encrypt/jsencrypt.min.js"))
	 (:script :src (cat *static-url* "/js/jquery/validator/jquery.validate.min.js"))
	 (:script :src (cat *static-url* "/js/jquery/validator/localization/messages_zh.min.js"))
	 (:script :src (cat *static-url* "/js/page/util.js"))
	 )
       (:body
	 (:div :class "container-fluid"
	       (:div :class "row-fluid"
		     ;; content
		     (:div :id "content" :class "col-xs-12"
			   (:div :id "navbar" :class "nav navbar"
				 (:nav :id "navbar-nav" :class "navbar" :role "navigation"
				       (:div :class "container-fluid"
					     (:div :id "navbar-menu" :class "navbar-header"
						   (:a :class "navbar-brand" :href "#"))
					     (:ul :id "navbar-menu-right"  :class "nav navbar-nav navbar-right"
						  (:li (:a :href "#" (:span :class "glyphicon glyphicon-user") "Register"))
						  (:li (:a :href "#" (:span :class "glyphicon glyphicon-log-in") "Login")))))
				 (:style "#navbar { margin-bottom: 0px;} #navbar-nav { border: 1px solid #ddd;}"))			
			   ;; Body content
			   (:div :id "main-content" :class "col-xs-12"
				 (:div :id "modules" :class "container-fluid"
				       (:div :class "row-fluid" ,@body)))

			   ;; Body end

			   ;; Modal
			   (:div :class "modal fade" :id "modal-info" :tabindex "-1" :role "dialog" :aria-labelledby "modal-info-label" :aria-hidden "true"
				 (:div :class "modal-dialog"
				       (:div :class "modal-content"
					     (:div :class "modal-header"
						   (:button :type "button" :class "close" :data-dismiss "modal" :aria-hidden "true" "&times;")
						   (:h4 :class "modal-title" :id "modal-info-label"))
					     (:div :class "modal-body" :id "modal-info-body")
					     (:div :class "modal-footer" :id "modal-info-footer"
						   (:h5 :id "modal-info-time")))))
			   ;; Modal end

			   ;; alert 
			   (:div :class "alert alert-warning alert-dismissible modal fade" :role "alert" :tabindex "-1" :aria-hidden "true"
				 (:div (:strong "Holy guacamole!")  "You should check in on some of those fields below.")
				 (:button :type "button" :class "close" :data-dismiss "alert" :aria-label "Close" (:span :aria-hidden "true" "&times;"))
				 )
			   ;; alert end

			   ;; footer
			   (:div :id "footer" :class "navbar-fixed-bottom"
				 (:hr)
				 (:footer :class "text-center"
					  (:p "&copy; BigDataAppManager 2019")
					  ))
			   ;; footer end
			   (:style "
				   #side {
				   padding: 0px 15px 0px 0px;
				   }
				   #main-content {
				   padding: 0px;
				   }
				   #main-content > * {
				   padding: 0px;
				   }
				   "))))))
				   ;; html content end
				   ))

