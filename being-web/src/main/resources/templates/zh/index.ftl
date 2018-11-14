<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="命源链，区块链平台"> 
	<meta name="description" content="命源链是区块链平台，致力于成为XXXXXX区块链平台！">
    <meta name="author" content="beingweb">
    <title>命源链-首页</title>
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
    <link rel="shortcut icon" href="${request.contextPath}/static/site/images/ico/favicon.ico"> 
    
    <style>
    	.img-responsive{
    		width: 100%;
    		height: 250px;
    	}
    	
    	.img-responsive-left{
    		width: 100%;
    		height: 380px;
    	}
    	#features .teams{
    		height: 300px;
    	}
    	.social-icons{
    		font-size: 12px;
    		
    	}
    	#services, #being, #features, #feature, #our-team, #business-stats, #contact-us {
		    padding: 100px 0 75px;
		}
		.img-container{
			width: 95px;
    		height: 95px;
    		display: inline-block;
    		float: left;
		}
		.img-container img{
			width: 100%;
    		height: 100%;
		}
		.link-container {
		    width: 120px;
		    display: inline-block;
		    margin-left: 15px;
		    float: left;
		    height: 96px;
    		line-height: 96px;
		}
		.link-container a {
		    width: 100%;
		    height: 33px;
		    color: #fff;
		    background-color: #334b73;
		    border-radius: 3px;
		    text-align: center;
		    display: inline-block;
		    margin-top: 5px;
		    margin-bottom: 10px;
		    line-height: 2.1;
		}
		@media screen and (max-width: 768px){
	   .link-container {
		    margin-left: 0;
		}
	}
    </style>
</head> 

<body id="home">
	<#assign type = "zh">
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
                    <a class="navbar-brand" href="/${type}/index"><img src="${request.contextPath}/static/site/images/logo.png" alt="logo" style="width: 143px;"></a>
                    
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                	<ul class="nav navbar-nav">
                        <li class="scroll active" role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#home"  role="menuitem" tabindex="-1" >首页</a>
                    	</li> 
						<li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
						  	<a href="#features"  role="menuitem">特色</a>
						</li>
                        <li class="scroll "  role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#business-stats"  role="menuitem">服务</a>
                        </li>
                        <!--
                        <li class="scroll"><a href="#about">我们</a></li> 
                        -->
                        <li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#feature"  role="menuitem">分配</a>
                        </li>
                        <li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#our-team"  role="menuitem">团队</a>
                        </li>
                        <li class="scroll "  role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#contact-us"  role="menuitem">合作</a>
                        </li>  
                        <li class="dropdown">
                        	<#if loginUser?exists><#if loginUser.name??>
                        		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">${loginUser.name!}
					            <span class="caret"></span></a>
						        <ul class="dropdown-menu">
						            <li><a href="/${type}/user/index">个人信息</a></li>
						            <li class="divider"></li>
						        </ul>
                        	</#if>
                        	<#else>
                        		<a href="/${type}/login">登录</a>
                        	</#if>
                        </li>   
                        <#if loginUser?exists><li class="scroll"><a href="/${type}/logout">退出</a></li></#if>     
                        <li class="dropdown">
                    		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">语言
				            <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					            <li><a href="/zh/index">中文</a></li>
					            <li><a href="/en/index">英文</a></li>
					            <li><a href="/ko/index">韩文</a></li>
					            <li class="divider"></li>
					        </ul>
                        </li>                    
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->

    <section id="hero-banner">
             <div class="banner-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                    <h2><b>BEING Chain Ecosystem</b></h2>
                                    <p>一种可信的分布式数据网络，下一代互联网将是基于可信的、有价值的数据网络。</p>
                                    <#if loginUser?exists>
		                        	<#else>
	                                    <p><a class="btn btn-primary btn-lg" href="javascript:void(0);" onclick="toRegister();">实名认证</a></p>
		                        	</#if>
                                	<p><a class="btn btn-primary btn-lg" href="${request.contextPath}/static/files/BEING-English.pdf" target="_blank">白皮书</a></p>
                            </div>
                        </div>
                    </div>
                </div>
    </section><!--/#main-slider-->
     
     <section id="being">
		 <div class="container">
		   <div class="section-header">
	            <h2 class="section-title wow fadeInDown" style="color: #48B1DF;">命源链是什么</h2>
	            <p class="wow fadeInDown">BEING Chain Ecosystem（BE Eco）致力力于构建新一代的可信的分布式数据网络， 革新互联网的基础设施，创造一个数据可以安全、平等、快速流转的、可信的价值网络。</p>
	        </div>
		 	<div class="row FeatLayout">
				<div class="col-md-5 Featimg"> <img src="${request.contextPath}/static/site/images/version/${type}/being-shengtai.png" alt="feature" class="img-responsive-left center-block"></div>
				<div class="col-md-7">
					<p>命源链(BE)是 BEING Chain Ecosystem平台的基础技术，命源链采用全新主链+子链的区块链技术来设计符合全球数据服务应用的价值公链。BE Eco生态系统所有商业应用都发布在命源链上，链上原生的 BEING Chain Ecosystem Token将作为相关应用的流通凭证，也是信息交换的燃料。</p>
					<br><br><br>
					<h2>命源链的使命</h2>
					<p>BEING Chain Ecosystem的使命是建立可信的分布式数据网络，让全产业链能参与共建生态、共享收益，让用户享受真实可信的服务，打造一个去中介化、公开自治、没有国界、公平可信的全球化数据服务生态系统，最终形成下一代价值互联网的基石。</p>
				</div>
			</div>
		 </div>
	 </section>
	 
	 
    <!--/#about-->
 
    <section id="features">
        <div class="container">
            <div class="section-header">
            	<h2 class="section-title wow fadeInDown">命源链的特点</h2>
                <p class="wow fadeInDown">开放、平等、协作、快速、分享<br>回望先贤，不忘初心.</p>
            </div>
			
			<!-- team start -->	
			
			<div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                    	<div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0001.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0002.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0003.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                    	<div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0004.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="row text-center">
                
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0005.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0006.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0007.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0008.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
			
			
			<!-- team start -->	
			
			
			
        </div>
    </section><!--/#our-team-->
    
    <section id="business-stats">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title wow fadeInDown">服务领域</h2>
                <p class="wow fadeInDown">分布式数据网络是各种应用的技术，在各个领域都有着非常广泛的应用，我们重点服务和支持的场景如下</p>
            </div>

            <div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="business-stats" data-digit="商品溯源" data-duration="0"></div>
                        <!-- <strong>Clients</strong> --->
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="business-stats" data-digit="慈善公益" data-duration="0"></div>
                        <!-- <strong>Completed</strong> -->
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="business-stats" data-digit="资产管理" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="物流零售" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="版权保护" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="保险服务" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="金融服务" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="节能环保" data-duration="0"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--/#business-stats-->
    
    <section id="feature">
        <div class="container">

            <div class="section-header">
                <h2 class="section-title wow fadeInDown">分配方案</h2>
                <p class="wow fadeInDown">BE（BEING代币）总量不变，永不增发。 <br> Token发行总量为100亿，一个Token被称作 1BE。</p>
            </div>

            <div class="row">
                <div class="col-sm-6 wow fadeInLeft">
                  <img class="img-responsive-left" src="${request.contextPath}/static/site/images/version/${type}/allot.png" alt="">
                </div>

                <div class="col-sm-6 wow fadeInRight">
                    <!----<h3 class="column-title">Our Company</h3>---->
                    <ul class="listarrow">
						<li><i class="fa fa-angle-double-right"></i>早期融资 30%：用于平台的技术研发、硬件及带宽成本投入、项⽬目运营等，确保项目可持续发展。</li>
						<li><i class="fa fa-angle-double-right"></i>社区及用户回馈 20%（其中含5%用于社区糖果计划）：BE为了吸引社区用户参与，采用拉新和激励的双重激励方式，对社区贡献者提供长期的激励计划。</li>
						<li><i class="fa fa-angle-double-right"></i>投资基金 10%：初次发行将预留10%的BE作为投资基金，用于搭建BE Eco生态，维护和繁荣生态体系。投资基金锁仓1年，每季度线性解锁。</li>
						<li><i class="fa fa-angle-double-right"></i>应用生态拓展 15%：初次发行将预15%的BE作为生态基，用于孵化或扶持基于BE的DAPP。应用生态拓展基金锁仓1年，每季度线性解锁。</li>
						<li><i class="fa fa-angle-double-right"></i>机构及合作伙伴激励 10%：BE Eco是一个长期的事业，为了持续推进社区的繁荣和发展，需要不停的吸纳优秀的团队与我们一起努力；同时在社区发展过程中要达成某些重要的里程节点，还需要联合更多合作伙伴促进社区成长。机构及合作伙伴激励锁仓18个月。</li>
						<li><i class="fa fa-angle-double-right"></i>团队建设 15%：研发和运营团队为BE的诞生和发展付出了极大的心血和努力。此外早期的贡献者通过提供有力的资源、资金为BE Eco的建设提供了不可或缺的帮助，遂以合理份额的BE作为对二者的回报奖励。核心团队持有的BE全部锁仓，分2年每半年线性解锁。</li>
					</ul>
                </div>
            </div>
        </div>
    </section>

    <section id="our-team">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title wow fadeInDown">团队</h2>
                <p class="wow fadeInDown">专注致力于区块链行业发展 </p>
            </div>
			
			<!-- team start -->	
			
			<div class="row text-center">
                <!--
                <div class=" col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                    </div>
                </div>
                --->
                <div class="col-md-offset-2  col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/01.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Roland Song</h3>
                            <span>CEO</span> 
                        </div> 
                        <div class="social-icons">
                        	美国劳伦斯科技大学MBA学位，前WDNA基金会理事长，全面负责基金会的日常管理以及基因链的全球项目合作布局。擅长企业战略规划管理以及金融投资领域的资源整合，拥有丰富的国际市场经验。曾任职于北美 Century 21 Real Estate（21世纪不动产）和 AT&T管理职位，回国后先后就职于HSBC, ANZ Bank和海银金控集团。
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/02.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Florian</h3>
                            <span>CTO</span> 
                        </div> 
                        <div class="social-icons">
                            15年互联网工作经验<br>（5年区块链安全加密工作经验）<br>高级网络安全工程师<br>在区块链加密技术和网络安全方面有卓越成就。<br>&nbsp;
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/03.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Ricky</h3>
                            <span>COO</span> 
                        </div> 
                        <div class="social-icons">
                            18年商业市场营销经验<br> 在区块链项目管理、业务发展、销售和市场营销、渠道管理、建立客户关系方面有丰富经验<br>曾就职于Sony, Logitech等大型公司。
                        </div>
                    </div>
                </div>
                <!--
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                    </div>
                </div>
                -->
                      
            </div>
            
            
            <div class="row text-center">
                
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/04.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Derek Maksimovna</h3>
                            <span>技术顾问</span> 
                        </div> 
                        <div class="social-icons">
                                                   福赛大学软件开发学士学位，曾任Wingspan科技公司的软件工程师，DecentralizedCapital公司技术团队的主管。<br>区块链技术和分布式系统专家
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/05.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>李相君</h3>
                            <span>技术顾问</span> 
                        </div> 
                        <div class="social-icons">
                                                   美国加州大学伯克利分校，计算机科学、Haas商学院本科双学位，<br>GPA3.98/4，BI.XYZ数字货币交易所架构师。<br>区块链技术和量化交易领域专家。
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/06.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Eric Peterson</h3>
                            <span>金融顾问</span> 
                        </div> 
                        <div class="social-icons">
                            	肯尼索州立大学科尔斯商学院，<br>金融学士学位，<br>Office Depot的预算分析员，<br>Gokapital的信用分析员。
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/07.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Justin Titarenko</h3>
                            <span>法律顾问</span> 
                        </div> 
                        <div class="social-icons">
                                                  亚特兰大的约翰马歇尔法学院，萨凡纳法学院的学士学位，佛罗里达海岸法学院的法学硕士学位。
							Butler & Hosch PA公司的政府顾问，Elizabeth R. Wellborn PA公司的助理顾问。
                        </div>
                    </div>
                </div>
            </div>
			
			
			<!-- team start -->	
			
			
			
        </div>
    </section><!--/#our-team-->

	
    <section id="contact-us">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title wow fadeInDown">合作</h2>
                <p class="wow fadeInDown">一起开辟区块链的美好未来，请与我们合作</p>
            </div>
            <div class="container">
                <div class="row">
				  <div class="col-sm-4 col-md-4">
                        <div class="contact-form">
                            <h3>合作信息</h3>

                            <address>
                            	  我们对支持和关注BE社区发展的朋友表示衷心的感谢。<br>
                              <abbr title="Email">邮箱地址:</abbr><strong><a href="mailto:being36666@gmail.com">&nbsp;&nbsp;being36666@gmail.com</a> </strong>
                            </address>
					</div></div>
                    <div class="col-sm-8 col-md-8">
                        <div class="contact-form">
                       
                            <form id="contactForm" name="contact-form" method="post">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" placeholder="姓名" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control" placeholder="邮箱" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="tel" class="form-control" placeholder="手机号" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="subject" class="form-control" placeholder="标题" required>
                                </div>
                                <div class="form-group">
                                    <textarea name="message" class="form-control" rows="8" placeholder="内容" required></textarea>
                                </div>
                                <button type="button" id="submitBtn" class="btn btn-primary">提交信息</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>   
   </section><!--/#bottom-->

    <footer id="footer">
        <div class="container">
	        <div class="row">
		        <div class="col-xs-6 col-md-3 col-lg-3">
			        <div class="img-container">
			          <img src="${request.contextPath}/static/images/qrcode/android.png">
			        </div>
			        <div class="link-container">
						<a href="##" target="_blank">Android版下载</a>
					</div>
		       </div>
		       <!---
		       <div class="col-xs-6 col-md-3 col-lg-3">
			        <div class="img-container">
			          <img src="${request.contextPath}/static/images/qrcode/android.png">
			        </div>
			        <div class="link-container">
						<a href="##" target="_blank">iPhone版下载</a>
					</div>
		       </div>
		       -->
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="${request.contextPath}/static/files/BEING-Chain.pdf" target="_blank" title="中文白皮书">中文白皮书</a>
		      		</div>	
		      		<div>
		      			<a href="${request.contextPath}/static/files/BEING-English.pdf" target="_blank" title="英文白皮书">英文白皮书</a>
		      		</div>		 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		 			<div>
		      			<a href="https://t.me/Being3" target="_blank" title="电报">电报</a>
		      		</div>
		       		<div>
		      			<a href="https://mobile.twitter.com/being36666" target="_blank" title="推特">推特</a>
		      		</div>		 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="https://www.facebook.com/profile.php?id=100028701533044" target="_blank" title="脸书">脸书</a>
		      		</div>		 
		       </div>
		       
	       </div>
        
            <div class="row">
                <hr>
                <div class="col-md-12 col-sm-12 col-xs-12 text-center">Copyright &copy; 2018.命源链 All rights reserved.<a href="www.being.codes/" target="_blank" title="命源链">命源链</a> - 版权所有</div>
            </div>
        </div>
    </footer><!--/#footer-->

    <script src="${request.contextPath}/static/site/js/jquery.js"></script>
    <script src="${request.contextPath}/static/site/js/bootstrap.min.js"></script> 
    <script src="${request.contextPath}/static/site/js/mousescroll.js"></script>
    <script src="${request.contextPath}/static/site/js/smoothscroll.js"></script>
    <script src="${request.contextPath}/static/site/js/jquery.prettyPhoto.js"></script>
    <script src="${request.contextPath}/static/site/js/jquery.isotope.min.js"></script>
    <script src="${request.contextPath}/static/site/js/jquery.inview.min.js"></script>
    <script src="${request.contextPath}/static/site/js/wow.min.js"></script>
    <script src="${request.contextPath}/static/site/js/custom-scripts.js"></script>
    
    <script src="${request.contextPath}/static/bootstrap3-dialog/bootstrap-dialog.js"></script>
    <script src="${request.contextPath}/static/js/common.js"></script>
    <script>
    	$(function(){
			//按钮单击时执行
	        $("#submitBtn").click(function(){
	            //Ajax调用处理
	            $.ajax({
	               type: "POST",
	               url: "public/saveContact",
	               data: $("#contactForm").serialize(),
	               success: function(data){
	               		BootstrapDialog.show({
					        title: "温馨提示",
					        //closable: false,//是否允许关闭弹框
					        message: data,
					        buttons: [{
					     	    label: '确定',
					     	    cssClass: 'btn btn-danger',
					     	    action: function(dialogRef){
					     	    	dialogRef.close();
					     	    	window.location.href="/${type}/index";
					     	    }
					     	  }]
					    });
	               }
	            });
	         });
    	})
    </script>
</body>
</html>