<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="beingweb">
    <title>being-home</title>
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
		    width: 140px;
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
<#assign type = "en">
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
                        	<a href="#home"  role="menuitem" tabindex="-1" >HOME</a>
                    	</li> 
						<li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
						  	<a href="#features"  role="menuitem">Characteristics</a>
						</li>
                        <li class="scroll "  role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#business-stats"  role="menuitem">Services</a>
                        </li>
                        <li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#feature"  role="menuitem">Distribution</a>
                        </li>
                        <li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#our-team"  role="menuitem">Team</a>
                        </li>
                        <li class="scroll "  role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#contact-us"  role="menuitem">Cooperation</a>
                        </li>  
                        <li class="dropdown">
                        	<#if loginUser?exists><#if loginUser.name??>
                        		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="Personal information">${loginUser.name!}
					            <span class="caret"></span></a>
						        <ul class="dropdown-menu">
						            <li><a href="/${type}/user/index">Personal information</a></li>
						            <li class="divider"></li>
						        </ul>
                        	</#if>
                        	<#else>
                        		<a href="/${type}/login">Login</a>
                        	</#if>
                        </li>   
                        <#if loginUser?exists><li class="scroll"><a href="/${type}/logout">Logout</a></li></#if> 
                        <li class="dropdown">
                    		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="language">language
				            <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					            <li><a href="/zh/index">Chinese</a></li>
					            <li><a href="/en/index">English</a></li>
					            <li><a href="/ko/index">Korean</a></li>
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
                                    <p>It is a trusted distributed data network. The next generation Internet will be based on trusted and valuable data networks.</p>
                                    <#if loginUser?exists>
		                        	<#else>
	                                    <p><a class="btn btn-primary btn-lg " href="javascript:void(0);" onclick="toRegister();">KYC</a></p>
		                        	</#if>
	                                <p><a class="btn btn-primary btn-lg" href="${request.contextPath}/static/files/BEING-English.pdf" target="_blank">White Paper</a></p>
                                
                            </div>
                        </div>
                    </div>
                </div>
    </section><!--/#main-slider-->
     
     <section id="being">
		 <div class="container">
		   <div class="section-header">
	            <h2 class="section-title wow fadeInDown" style="color: #48B1DF;">What is BEING?</h2>
	            <p class="wow fadeInDown">BEING Chain Ecosystem (BE Eco) is committed to building a new generation of trusted distributed data networks, innovating the Internet infrastructure, and creating a trusted value network where data flow is secure, equitable and fast.</p>
	        </div>
		 	<div class="row FeatLayout">
				<div class="col-md-5 Featimg"> <img src="${request.contextPath}/static/site/images/version/${type}/being-shengtai.png" alt="feature" class="img-responsive-left center-block"></div>
				<div class="col-md-7">
					<p>BEING Chain (BE) is the basic technology of BEING Chain Ecosystem platform. BEING Chain uses the brand-new block chain technology of main chain and sub-chain to design the value public block chain which conforms to the global data service application. All commercial applications of the BE Eco ecosystem are posted on the BEING Chain, and the native BEING Chain Ecosystem Token on the chain will serve as a circulation document for related applications and a fuel for information exchange.</p>
					<br><br><br>
					<h2>Mission of BEING</h2>
					<p>The mission of BEING Chain Ecosystem is to establish the trusted distributed data networks, enable the whole industry chain to participate in the constructing ecology and share profits and make users enjoy authentic and credible service, create a de-intermediation, open autonomy, equitable and credible global data service ecosystem without national boundaries, and ultimately form the cornerstone of the next generation of value Internet.</p>
				</div>
			</div>
		 </div>
	 </section>
	 
	 
    <!--/#about-->
 
    <section id="features">
        <div class="container">
            <div class="section-header">
            	<h2 class="section-title wow fadeInDown">Characteristics of BEING</h2>
                <p class="wow fadeInDown">Openness, Equality, Collaboration, Speed, Sharing<br>Looking back on the sages, and staying true to original aspiration.</p>
            </div>
			
			<!-- team start -->	
			
			<div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                    	<div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0001.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0002.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0003.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                    	<div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0004.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="row text-center">
                
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0005.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0006.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0007.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/version/${type}/feature/0008.png" alt="">
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
                <h2 class="section-title wow fadeInDown">Service field</h2>
                <p class="wow fadeInDown">Distributed data network is the technologies with various applications. It has a wide range of applications in various fields. Our key services and supporting scenarios are as follows:</p>
            </div>

            <div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="business-stats" data-digit="Traceability" data-duration="0"></div>
                        <!-- <strong>Clients</strong> --->
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="business-stats" data-digit="Public welfare" data-duration="0"></div>
                        <!-- <strong>Completed</strong> -->
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="business-stats" data-digit="Trust" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="Logistics" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="Copyright" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="Insurance" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="Financial" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="Environmental protection" data-duration="0"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--/#business-stats-->
    
    <section id="feature">
        <div class="container">

            <div class="section-header">
                <h2 class="section-title wow fadeInDown">Distribution scheme</h2>
                <p class="wow fadeInDown">The total quantity of BE (BEING tokens) will remain unchanged and will not be increased.  <br> The total number of issuance of tokens is 10 billion. A token is called 1BE. </p>
            </div>

            <div class="row">
                <div class="col-sm-6 wow fadeInLeft">
                  <img class="img-responsive-left" src="${request.contextPath}/static/site/images/version/${type}/allot.png" alt="">
                </div>

                <div class="col-sm-6 wow fadeInRight">
                    <!----<h3 class="column-title">Our Company</h3>---->
                    <ul class="listarrow">
						<li><i class="fa fa-angle-double-right"></i>Early financing (30%) is used for technology research and development for the platform, hardware and bandwidth costs, project operations, etc., to ensure the sustainable development of the project.</li>
						<li><i class="fa fa-angle-double-right"></i>Community and user feedback (20%) (including 5% for Community Candy Programs): BE provides long-term incentive programs to community contributors by using innovative and motivational incentives to attract community users.</li>
						<li><i class="fa fa-angle-double-right"></i>Investment fund (10%): For the initial issue, 10% of BE will be reserved as investment fund to build BE Eco ecology, maintain and prosper the ecological system. The investment fund is locked for 1 year, and is unlocked linearly quarterly.</li>
						<li><i class="fa fa-angle-double-right"></i>Application of ecology expansion (15%): For the initial issue, 15% of BE will be reserved as ecology fund to incubate and support BE-based DAPP. The application of ecological expansion fund is locked for 1 year, and is unlocked linearly quarterly.</li>
						<li><i class="fa fa-angle-double-right"></i>Institutional and partnership incentives (10%): BE Eco is a long-term undertaking. In order to continue promoting the prosperity and development of the community, we need to constantly absorb good teams to work with us; at the same time, in order to achieve some important milestones in the process of community development, we need to unite more partners to promote community growth. Institutional and partnership incentives are locked for 18 months.</li>
						<li><i class="fa fa-angle-double-right"></i>Team building (15%): R&D and operation teams have devoted tremendous efforts to the birth and development of BE. In addition, the early contributors provided indispensable help for the construction of BE Eco through the provision of powerful resources and funds, thus rewarding them with a reasonable share of BE. The core team's BE is totally locked and is unlocked linearly every half a year over 2 years.</li>
					</ul>
                </div>
            </div>
        </div>
    </section>

    <section id="our-team">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title wow fadeInDown">Team</h2>
                <p class="wow fadeInDown">The team is committed to the development of block chain industry. </p>
            </div>
			
			<!-- team start -->	
			
			<div class="row text-center">
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
                        	MBA Lawrence university of technology,previous chairman of WDNA foundation.Fully in charge of foundation daily management and gene chain global project coorperation.Specialize in enterpreise strategy planing management and integration of resource in financial investment area.Worked in management position of Century 21 Real Estat and AT&T.Worked in HSBS,ANZ Bank and Haiyin Financial Control Group after back in China.
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
                            He has 15 years of experience in Internet field (5 years of experience in block chain security and encryption). He is a senior network security engineer and has outstanding achievements in block chain encryption technology and network security.
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
                            He has 18 years of business marketing experience, and has a lot of experience in block chain project management, business development, sales and marketing, channel management, customer relationship building. He worked for Sony, Logitech and other large companies.
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
                            <span>Technical consultant</span> 
                        </div> 
                        <div class="social-icons">
                            He holds a bachelor's degree in software development from Full Sail University. He was a software engineer at Wingspan Technologies and the director of the technical team at Decentralized Capital.<br>
                            He is an expert in block chain technology and distributed system.
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/05.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>LI Xiangjun</h3>
                            <span>Technical consultant</span> 
                        </div> 
                        <div class="social-icons">
                           He has a bachelor degree in computer science from University of California at Berkeley and a bachelor degree from Haas Business School. His GPA IS 3.98/4. He is BI.XYZ digital currency exchange architect. He is an expert in block chain technology and quantitative trading.
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
                            <span>Financial advisor</span> 
                        </div> 
                        <div class="social-icons">
                            He is a financial advisor and has a bachelor degree in Finance from Kenneth State University Kors Business School. He is a budget analyst for Office Depot and a credit analyst for Gokapital.
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
                            <span>Legal advisor</span> 
                        </div> 
                        <div class="social-icons">
                                                  He is a legal advisor. He holds a bachelor degree from John Marshall Law School and a bachelor degree from Savannah Law School in Atlanta, and a master’s degree in law from Florida Coast Law School. He is a government advisor for Butler & Hosch PA and assistant consultant for Elizabeth R. Wellborn PA.
                        </div>
                    </div>
                </div>
            </div>
			
			
			<!-- team start -->	
			
			
			
        </div>
    </section><!--/#our-team-->

    <!--
    
    <section class="testimonial-area" id="testimonial">
			<div class="container">
				<div class="section-header">
                <h2 class="section-title wow fadeInDown">Testimonial</h2>
                <p class="wow fadeInDown">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eget risus vitae massa <br> semper aliquam quis mattis quam.</p>
            </div>
				<div class="row">
					<div class="col-md-4">
						<div class="single-testimonial animate_fade_in" style="opacity: 1; right: 0px;">
							<div class="row">
								<div class="col-xs-12">
									<blockquote>Sontrary to popular belief, Lorem Ipsuis no simply random text. It has roots in a piece of classical Layears old. belief, Lorem Ipsuis not simply</blockquote>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3">
									<img src="${request.contextPath}/static/site/images/pic1.jpg" alt="client">
								</div>
								<div class="col-xs-9 half-gutter">
									<h5>John Bond</h5>
									<h6>Lorem Ipsuis simply</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-testimonial animate_fade_in" style="opacity: 1; right: 0px;">
							<div class="row">
								<div class="col-xs-12">
									<blockquote>Tontrary to popular belief, Lorem Ipsuis no simply random text. It has roots in a piece of classical Layears old. belief, Lorem Ipsuis not simply</blockquote>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3">
									<img src="${request.contextPath}/static/site/images/pic2.jpg" alt="client">
								</div>
								<div class="col-xs-9 half-gutter">
									<h5>John Bond</h5>
									<h6>Lorem Ipsuis simply</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="single-testimonial animate_fade_in" style="opacity: 1; right: 0px;">
							<div class="row">
								<div class="col-xs-12">
									<blockquote>Aontrary to popular belief, Lorem Ipsuis no simply random text. It has roots in a piece of classical Layears old. belief, Lorem Ipsuis not simply</blockquote>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3">
									<img src="${request.contextPath}/static/site/images/pic1.jpg" alt="client">
								</div>
								<div class="col-xs-9 half-gutter">
									<h5>John Bond</h5>
									<h6>Lorem Ipsuis simply</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		-->
	
    <section id="contact-us">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title wow fadeInDown">Cooperation</h2>
                <p class="wow fadeInDown">Work with us to explore a beautiful future for block chain</p>
            </div>
            <div class="container">
                <div class="row">
				  <div class="col-sm-4 col-md-4">
                        <div class="contact-form">
                            <h3>Cooperation information</h3>

                            <address>
                              We would like to express our heartfelt thanks to our friends who support and pay attention to the development of BE community.<br>
                              <abbr title="Email">Email:</abbr><strong><a href="mailto:being36666@gmail.com">&nbsp;&nbsp;being36666@gmail.com</a> </strong>
                            </address>
					</div></div>
                    <div class="col-sm-8 col-md-8">
                        <div class="contact-form">
                       
                            <form id="contactForm" name="contact-form" method="post">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" placeholder="Name" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control" placeholder="Email" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="tel" class="form-control" placeholder="Mobile" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="subject" class="form-control" placeholder="Subject" required>
                                </div>
                                <div class="form-group">
                                    <textarea name="message" class="form-control" rows="8" placeholder="Contents" required></textarea>
                                </div>
                                <button type="button" id="submitBtn" class="btn btn-primary">Information to be submitted</button>
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
			        
		       </div>
		       <!---
		       <div class="col-xs-6 col-md-3 col-lg-3">
			        <div class="img-container">
			          <img src="${request.contextPath}/static/images/qrcode/android.png">
			        </div>
			        <div class="link-container">
						<a href="##" target="_blank">iPhone Download</a>
					</div>
		       </div>
		       -->
<<<<<<< HEAD
=======
		       <div class="col-xs-6 col-md-3 col-lg-2">
		 			<div>
		      			<a href="https://t.me/Being3" target="_blank" title="Telegram">Telegram</a>
		      		</div>
		       		<div>
		      			<a href="##" target="_blank" title="Twitter">Twitter</a>
		      		</div>		 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="##" target="_blank" title="Wechat">Wechat</a>
		      		</div>
		      		<div>
		      			<a href="##" target="_blank" title="Facebook">Facebook</a>
		      		</div>		 
		       </div>
>>>>>>> branch 'master' of https://gitee.com/wzheart/being-web.git
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="${request.contextPath}/static/files/BEING-Chain.pdf" target="_blank" title="Chian White Paper">Chian White Paper</a>
		      		</div>	
		      		<div>
		      			<a href="${request.contextPath}/static/files/BEING-English.pdf" target="_blank" title="English White Paper">English White Paper</a>
		      		</div>		 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		 			<div>
		      			<a href="https://t.me/Being3" target="_blank" title="Telegram">Telegram</a>
		      		</div>
		       		<div>
		      			<a href="https://mobile.twitter.com/being36666" target="_blank" title="Twitter">Twitter</a>
		      		</div>		 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="https://www.facebook.com/profile.php?id=100028701533044" target="_blank" title="Facebook">Facebook</a>
		      		</div>		 
		       </div>
		       
	       </div>
        
            <div class="row">
                <hr>
                <div class="col-md-12 col-sm-12 col-xs-12 text-center">Copyright &copy; 2018.being All rights reserved.<a href="www.being.codes/" target="_blank" title="being.codes">being.codes</a> - All Rights Reserved</div>
                <!--
                <div class="col-sm-6">
                    <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li> 
                        <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                        <li><a href="#"><i class="fa fa-github"></i></a></li>
                    </ul>
                </div>
                -->
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
					        title: "Friendly tips",
					        //closable: false,//是否允许关闭弹框
					        message: data,
					        buttons: [{
					     	    label: 'sure',
					     	    cssClass: 'btn btn-danger',
					     	    action: function(dialogRef){
					     	    	dialogRef.close();
					     	    	window.location.href="index";
					     	    	
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