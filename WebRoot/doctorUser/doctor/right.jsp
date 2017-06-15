<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<script>
		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true,
				animationStart: function(current){
					$('.caption').animate({
						bottom:-35
					},100);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationStart on slide: ', current);
					};
				},
				animationComplete: function(current){
					$('.caption').animate({
						bottom:0
					},200);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationComplete on slide: ', current);
					};
				},
				slidesLoaded: function() {
					$('.caption').animate({
						bottom:0
					},200);
				}
			});
		});
	</script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/css/global.css">
   <script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
  
   <script type="text/javascript" src="<%=path %>/js/slides.min.jquery.js"></script>
     <script>
		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true,
				animationStart: function(current){
					$('.caption').animate({
						bottom:-35
					},100);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationStart on slide: ', current);
					};
				},
				animationComplete: function(current){
					$('.caption').animate({
						bottom:0
					},200);
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationComplete on slide: ', current);
					};
				},
				slidesLoaded: function() {
					$('.caption').animate({
						bottom:0
					},200);
				}
			});
		});
	</script>
  </head>

  <body>
                <div style="margin-left:330px;margin-top:20px;font-size:12px;">
                 &nbsp;&nbsp;&nbsp;你不富有，甚至有点贫穷，你不高大，甚至有点瘦弱，你不光鲜，甚至有<br>
                                    点卑微，但你却用羸弱的身躯，守护着一方平安，医生你们就是最美。</div>
     	<div id="container">
		<div id="example">
			<img src="<%=path %>/img/new-ribbon.png" width="112" height="112" alt="New Ribbon" id="ribbon">
			<div id="slides">
				<div class="slides_container">
				  <div class="slide">
						<img src="<%=path %>/img/slide-2.jpg" width="570" height="270" alt="Slide 2">
						<div class="caption">
							<p>Love you,梨子</p>
						</div>
					</div>
					<div class="slide">
						<img src="<%=path %>/img/test.jpg" width="570" height="270" alt="Slide 1">
						<div class="caption" style="bottom:0">
							<p>喜欢梨子</p>
						</div>
					</div>	
					<div class="slide">
						<img src="<%=path %>/img/slide-3.jpg" width="570" height="270" alt="Slide 3">
						<div class="caption">
							<p>中意梨子</p>
						</div>
					</div>
					<div class="slide">
					<img src="<%=path %>/img/slide-4.jpg" width="570" height="270" alt="Slide 4">
						<div class="caption">
							<p>Like you,梨子</p>
						</div>
					</div>
					<div class="slide">
					<img src="<%=path %>/img/slide-5.jpg" width="570" height="270" alt="Slide 5">
						<div class="caption">
							<p>爱你梨子</p>
						</div>
					</div>
					<div class="slide">
						<img src="<%=path %>/img/slide-6.jpg" width="570" height="270" alt="Slide 6">
						<div class="caption">
							<p>wa4 ai3 lu4,梨子</p>
						</div>
					</div>
					<div class="slide">
						<img src="<%=path %>/img/slide-7.jpg" width="570" height="270" alt="Slide 7">
						<div class="caption">
							<p>wa4 yen3 lu4,梨子</p>
						</div>
					</div>
				</div>
				<a href="#" class="prev"><img src="<%=path %>/img/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
				<a href="#" class="next"><img src="<%=path %>/img/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
			</div>
			<img src="<%=path %>/img/example-frame.png" width="739" height="341" alt="Example Frame" id="frame">
		</div>
		<div id="footer">
			<p>For full instructions go to <a href="http://slidesjs.com" target="_blank">http://slidesjs.com</a>.</p>
			<p>Slider design by Orman Clark at <a href="http://www.premiumpixels.com/" target="_blank">Premium Pixels</a>. You can donwload the source PSD at <a href="http://www.premiumpixels.com/clean-simple-image-slider-psd/" target="_blank">Premium Pixels</a></p>
			<p>&copy; 2010 <a href="http://nathansearles.com" target="_blank">Nathan Searles</a>. All rights reserved. Slides is licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache license</a>.</p>
		</div>
	</div>  
  </body>
</html>
