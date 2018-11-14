<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>个人主页</title>
    <!-- CSS -->
    
    <link href="${request.contextPath}/static/user/css/bootstrap.css" rel="stylesheet">
    <link href="${request.contextPath}/static/user/css/blog.css" rel="stylesheet">
    
    <!-- core CSS -->
    <link href="${request.contextPath}/static/site/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/static/site/css/font-awesome.min.css" rel="stylesheet">
    <link href="${request.contextPath}/static/site/css/animate.min.css" rel="stylesheet"> 
    <link href="${request.contextPath}/static/site/css/prettyPhoto.css" rel="stylesheet">
    <link href="${request.contextPath}/static/site/css/styles.css" rel="stylesheet"> 
    
    <link href="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.css" rel="stylesheet"> 
    <!--[if lt IE 9]>
    <script src="${request.contextPath}/static/site/js/html5shiv.js"></script>
    <script src="${request.contextPath}/static/site/js/respond.min.js"></script>
    <![endif]--> 
    
  </head>
  <body>
    <header id="header">
        <nav id="main-nav" class="navbar navbar-default navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/index"><img src="${request.contextPath}/static/site/images/logo.png" alt="logo"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                	<ul class="nav navbar-nav">
                        <li class="scroll"><a href="/index#home">首页</a></li> 
                        <!--
						<li class="scroll"><a href="#features">特色</a></li>
                        <li class="scroll"><a href="#services">服务</a></li>
                        <li class="scroll"><a href="#about">我们</a></li> 
                        <li class="scroll"><a href="#pricing">报价</a></li>
                        -->
                        <li class="scroll"><a href="/index#our-team">团队</a></li>
                        <li class="scroll"><a href="/index#contact-us">合作</a></li>  
                        <li class="scroll active"><#if loginUser?exists><#if loginUser.name??><a href="/user/index" id="userName">用户名：${loginUser.name!}</a></#if><#else><a href="/login">登录</a></#if></li>   
                        <#if loginUser?exists><li class="scroll"><a href="/logout">退出</a></li></#if>                      
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->
	<div class="intr">
    	<span class="avtar"></span>
        <p class="peointr">我叫XXX，一名热衷于编程的技术男。</p>
        <p class="peointr">爱编程，爱旅行，爱技术。</p>
    </div>
    <div class="title" id="part1">爱编程</div>
    <div class="content">
    	<div class="pic pic1">
    		<img src="${request.contextPath}/static/user/image/h1.jpg" alt="">
    		<p>编程-万码之源</p>
    	</div>
    	<div class="pic pic2">
    		<img src="${request.contextPath}/static/user/image/h2.jpg" alt="">
    		<p>编程-HelloWorld</p>
    	</div>
    	<div class="pic pic3">
    		<img src="${request.contextPath}/static/user/image/h3.jpg" alt="">
    		<p>编程-idea</p>
    	</div>
    </div>
    <div class="title" id="part2">爱旅行</div>
    <div class="content">
    	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="image/s1.jpg" alt="...">
                </div>
                <div class="item">
                  <img src="image/s2.jpg" alt="...">
                </div>
				<div class="item">
                  <img src="image/s3.jpg" alt="...">
                </div>
              </div>
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
    </div>
	<div class="title" id="part3">爱技术</div>
    <div class="content">
        <ul class="nav nav-tabs" role="tablist">
          <li class="active"><a href="#home" role="tab" data-toggle="tab">区块链</a></li>
          <li><a href="#profile" role="tab" data-toggle="tab">人工智能</a></li>
          <li><a href="#messages" role="tab" data-toggle="tab">云计算</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="home">
          	<p class="text">链数据统计</p>
            <p class="text">区块链相关技术文章列表</p>
          </div>
          <div class="tab-pane" id="profile">
          	<p class="text">作为一个最初掌握的技术</p>
            <p class="text">愿今后可以继续研究它</p>
          </div>
          <div class="tab-pane" id="messages">
          	<p class="text">作为一名草根技术男</p>
            <p class="text">云计算是必不可少的</p>
            <p class="text">因此我仍在不断地学习它 并因此享受云计算带来的乐趣</p>
          </div>
        </div>
    </div>
    <div class="blog-footer">
      <p>Copyright &copy; 2018.being All rights reserved.<a href="https://www.being.codes/" target="_blank" title="111">111</a> - Collect from <a href="https://www.being.codes/" title="being.codes" target="_blank">1111</a></p>
    </div>
    <!--<a href="" class="btt">顶部</a>-->
    <!-- Js-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugin.js"></script>
  </body>
</html>
