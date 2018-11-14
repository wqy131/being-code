<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="beingweb">
    <title>홈페이지</title>
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
	<#assign type = "ko">
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
                        	<a href="#home"  role="menuitem" tabindex="-1" >홈페이지</a>
                    	</li> 
						<li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
						  	<a href="#features"  role="menuitem">특색</a>
						</li>
                        <li class="scroll "  role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#business-stats"  role="menuitem">서비스</a>
                        </li>
                        <!--
                        <li class="scroll"><a href="#about">我们</a></li> 
                        -->
                        <li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#feature"  role="menuitem">분배</a>
                        </li>
                        <li class="scroll " role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#our-team"  role="menuitem">팀건설</a>
                        </li>
                        <li class="scroll "  role="presentation" data-toggle="collapse" data-target=".navbar-collapse">
                        	<a href="#contact-us"  role="menuitem">합작</a>
                        </li>  
                        <li class="dropdown">
                        	<#if loginUser?exists><#if loginUser.name??>
                        		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="개인정보">${loginUser.name!}
					            <span class="caret"></span></a>
						        <ul class="dropdown-menu">
						            <li><a href="/${type}/user/index">개인정보</a></li>
						            <li class="divider"></li>
						        </ul>
                        	</#if>
                        	<#else>
                        		<a href="/${type}/login">등록</a>
                        	</#if>
                        </li>   
                        <#if loginUser?exists><li class="scroll"><a href="/${type}/logout">퇴출</a></li></#if>     
                        <li class="dropdown">
                    		<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="개인 정보">언어
				            <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					            <li><a href="/zh/index">중문</a></li>
					            <li><a href="/en/index">영문</a></li>
					            <li><a href="/ko/index">한글</a></li>
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
                                    <p>신뢰할 수 있는 분산된 데이터 네트워크로서 다음 세대 네트워크는 신뢰할 수 있고 가치있는 데이터 네트워크를 기반으로 할 것이다.</p>
                                    <#if loginUser?exists>
		                        	<#else>
	                                    <p><a class="btn btn-primary btn-lg" href="javascript:void(0);" onclick="toRegister();">실명인증</a></p>
		                        	</#if>
                                	<p><a class="btn btn-primary btn-lg" href="${request.contextPath}/static/files/BEING-English.pdf" target="_blank" >백서</a></p>
                            </div>
                        </div>
                    </div>
                </div>
    </section><!--/#main-slider-->
     
     <section id="being">
		 <div class="container">
		   <div class="section-header">
	            <h2 class="section-title wow fadeInDown" style="color: #48B1DF;">BEING은 무엇인가?</h2>
	            <p class="wow fadeInDown">BEING Chain Ecosystem（BE Eco）은 새로운 세대의 신뢰할 수 있는 분산된 데이터 네트워크의 건설, 인터넷 기초설비의 혁신 및 데이터가 안전하고 평등, 신속하게 이전할 수 있도록 신뢰할 수 있는 네트워크를 만드는데 힘쓰고 있다.</p>
	        </div>
		 	<div class="row FeatLayout">
				<div class="col-md-5 Featimg"> <img src="${request.contextPath}/static/site/images/version/${type}/being-shengtai.png" alt="feature" class="img-responsive-left center-block"></div>
				<div class="col-md-7">
					<p>BEING Chain(BE)은BEING Chain Ecosystem플랫폼의 기초적인 기술로BEING Chain이 사용하는 메인체인+서브체인의 참신한 블록체인기술을 통한 설계는 글로벌 데이터서비스어플리케이션의 가치공유블록체인에 부합된다. BE Eco 생태시스템의 모든 비즈니스 어플리케이션은BEING Chain에 발표하고 체인의 네이티스BEING Chain Ecosystem Token은 관련 어플리케이션의 유통증빙으로 간주하고 정보교환의 연료로 본다.</p>
					<br><br><br>
					<h2>BEING의 사명</h2>
					<p>BEING Chain Ecosystem의 사명은 신뢰할 수 있는 분산된 데이터 네트워크를 건설함으로써 전체 산업체인이 공동생태건설에 참여하고 수익을 공유하여 사용자가 진실되고 신뢰가능한 서비스를 즐기도록 하는 것 뿐만 아니라 탈중개화, 공개자치, 국경이 없고 공평하고 신뢰할 수 있는 글로벌 데이터서비스생태시스템을 건설하여 다음 세대의 가치 인터넷의 기초를 다지는 것이다.</p>
				</div>
			</div>
		 </div>
	 </section>
	 
	 
    <!--/#about-->
 
    <section id="features">
        <div class="container">
            <div class="section-header">
            	<h2 class="section-title wow fadeInDown">BEING의 특점</h2>
                <p class="wow fadeInDown">개방, 평등, 협력, 신속, 공유<br>선현을 돌아보고 초심을 잃지 말자.</p>
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
                <h2 class="section-title wow fadeInDown">서비스범위</h2>
                <p class="wow fadeInDown">분산된 데이터 네트워크의 여러 어플리케이션 기술은 각 영역에서 넓게 응용되는데 주된 서비스 및 지지 장면은 다음과 같다:</p>
            </div>

            <div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="business-stats" data-digit="상품근원" data-duration="0"></div>
                        <!-- <strong>Clients</strong> --->
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="business-stats" data-digit="자선공익" data-duration="0"></div>
                        <!-- <strong>Completed</strong> -->
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="business-stats" data-digit="자산관리" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="물류리테일" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="저작권 보호" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="보험서비스" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="금융서비스" data-duration="0"></div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="business-stats" data-digit="보호하다" data-duration="0"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--/#business-stats-->
    
    <section id="feature">
        <div class="container">

            <div class="section-header">
                <h2 class="section-title wow fadeInDown">분배방안</h2>
                <p class="wow fadeInDown">BE（BEING기호화폐）총량불변 및 영원히 추가 발행하지 않음. <br> Token발행총량은 100억, 1개의Token은 1 BE로 칭한다.</p>
            </div>

            <div class="row">
                <div class="col-sm-6 wow fadeInLeft">
                  <img class="img-responsive-left" src="${request.contextPath}/static/site/images/version/${type}/allot.png" alt="">
                </div>

                <div class="col-sm-6 wow fadeInRight">
                    <!----<h3 class="column-title">Our Company</h3>---->
                    <ul class="listarrow">
						<li><i class="fa fa-angle-double-right"></i>초기융자30%: 플랫폼의 기술연구, 하드웨어 및 대역폭 성본투입, 프로젝트 운영 등에 사용하여 프로젝트의 지속가능한 발전을 확보.</li>
						<li><i class="fa fa-angle-double-right"></i>지역사회 및 사용자 피드백 20%(이는5%의 지역사회 캔티 기획을 포함한다): BE는 지역사회의 사용자 참여를 유인하기 위하여 새로 끌어들이는 것과 격려하는 이중격려방식을 사용하여 지역공헌자에게 장기적인 격려기획을 제공한다.</li>
						<li><i class="fa fa-angle-double-right"></i>투자펀드금 10%: 최초발행시 10%의BE를 미리 남겨두어 투자펀드금으로 하여BE Eco생태건설 및 생태체계의 유지와 번영에 사용한다. 투자펀드금은 1년간 고정포지션으로 하고 매 절기마다 선형으로 해제한다.</li>
						<li><i class="fa fa-angle-double-right"></i>애플리케이션생태 15% 확대: 최초 발행시 15%의 BE를 미리 남겨두어 생태펀드로 하여 BE를 기반으로 하는 DAPP의 부화 또는 부지에 사용한다.</li>
						<li><i class="fa fa-angle-double-right"></i>기구 및 합작파트너 격려 10%: BE Eco 는 장기적인 사업이므로 지역 사회의 번영과 발전을 위하여 끊임없이 우수한 팀을 끌어들여 함께 노력하는 것이 수요된다. 동시에 지역사회 발전과정의 중요한 단계에 도달하기 위하여 보다 많은 합작 파트너를 연합하여 지역사회의 성장을 추진하여야 한다. 기구 및 합작 파트너의 격려 고정포지션은 18개월이다.</li>
						<li><i class="fa fa-angle-double-right"></i>팀건설15%: 연구 및 운영팀은 BE의 탄생과 발전을 위하여 많은 심혈을 기울였다. 또한 초기의 공헌자들은 힘있는 자원을 제공하거나 자금을 제공하여 BE Eco의 건설을 위해 필수적인 도움을 제공하였기에 합리적인 몫의 BE를 2인에게 보답으로 장려한다. 핵심팀이 보유하고 있는 BE는 전부 고정포지션으로 하고 2년으로 나누어 반년마다 선형으로 해제한다.</li>
					</ul>
                </div>
            </div>
        </div>
    </section>

    <section id="our-team">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title wow fadeInDown">팀건설</h2>
                <p class="wow fadeInDown">블록체인 산업발전에 집중하여 힘을 쓰다 </p>
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
                        	로렌스 공대 (Lawrence University of Technology) MBA학위 취득, 전 WDNA 재단의 이사장으로서  재단의 일상적인 관리와 유전자 체인의 글로벌 프로젝트 협력을 담당합니다. 그는 금융 투자 분야의 전략적 계획 관리 및 자원 통합에 능하고 국제 시장관련 경험이 다양합니다. 그는 북미Century 21 Real Estate (21세기부동산) 및 AT & T 관리 직책을 맡았으며, 귀국 후 HSBC, ANZ 은행 및 Haiyin Financial Holdings Group에서 근무했습니다.
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
                            15년의 인터넷 근무경력(5년간 블록체인 안전보안 근무경력), 고급네트워크 안전 엔지니어, 블록체인 보안기술 및 네트워크 안전 방면에 탁월한 성과가 있다.<br>&nbsp;
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
                            18년의 비스니스 시장경영 경력, 블록체인 프로젝트 관리, 사업발전, 판매 및 마케팅, 채널관리, 고객관계 건립 등 방면에 풍부한 경력이 있고 Sony, Logitech등 대형 회사에서의 근무경력이 있다.
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
                            <span>기술고문</span> 
                        </div> 
                        <div class="social-icons">
                                                   풀세일대학 소프트웨어개발 학사학위, Wingspan과학기술회사의 소프트웨어 엔지니어로 역임.<br>블록체인 기술 및 분산식 시스템 전문가
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 teams">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="${request.contextPath}/static/site/images/team/05.png" alt="">
                        </div>
                        <div class="team-info">
                            <h3>이상군</h3>
                            <span>기술고문</span> 
                        </div> 
                        <div class="social-icons">
                                                   미국캘리포니아대학 버클리분교, 컴퓨터과학, Haas경영대학원 학사 이중학위, GPA3.98/4，BI.XYZ, 데이터 화폐거래소 설계사. 블록체인기술 및 양화거래영역 전문가.
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
                            <span>금융고문</span> 
                        </div> 
                        <div class="social-icons">
                            	Kenneth 주립대학 Kors경영대학원,<br>금융학사학위,<br>Office Depot의 예산분석가,<br>Gokapital의 정보분석가
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
                            <span>법률고문</span> 
                        </div> 
                        <div class="social-icons">
                                                  아틀란티스 요한마샬법학원, 싸바나 법학원 학사학위, 플로리다해안 법학원 법학석사학위. Butler & Hosch PA회사 정부고문, Elizabeth R. Wellborn PA회사의 어시스트 고문.
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
                <h2 class="section-title wow fadeInDown">합작</h2>
                <p class="wow fadeInDown">함께 블록체인의 아름다운 미래를 개척, 저희와 합작합시다.</p>
            </div>
            <div class="container">
                <div class="row">
				  <div class="col-sm-4 col-md-4">
                        <div class="contact-form">
                            <h3>합작정보</h3>

                            <address>
                            	  BE지역사회의 발전을 지지하고 관심하는 친구들에 대해 진심어린 감사의 인사를 전합니다.<br>
                              <abbr title="Email"> 이메일주소:</abbr><strong><a href="mailto:being36666@gmail.com">&nbsp;&nbsp;being36666@gmail.com</a> </strong>
                            </address>
					</div></div>
                    <div class="col-sm-8 col-md-8">
                        <div class="contact-form">
                       
                            <form id="contactForm" name="contact-form" method="post">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" placeholder="이름" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control" placeholder="이메일" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="tel" class="form-control" placeholder="전화번호" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="subject" class="form-control" placeholder="제목" required>
                                </div>
                                <div class="form-group">
                                    <textarea name="message" class="form-control" rows="8" placeholder="내용" required></textarea>
                                </div>
                                <button type="button" id="submitBtn" class="btn btn-primary">제출정보</button>
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
			        <!---
			        <div class="link-container">
						<a href="##" target="_blank">안드로이드 버전 다운</a>
					</div>
			        -->
		       </div>
		       <!----
		       <div class="col-xs-6 col-md-3 col-lg-3">
			        <div class="img-container">
			          <img src="${request.contextPath}/static/images/qrcode/android.png">
			        </div>
			        <div class="link-container">
						<a href="##" target="_blank">아이폰 버전 다운</a>
					</div>
		       </div>
		       
		       --->
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="${request.contextPath}/static/files/BEING-Chain.pdf" target="_blank" title="중국어 백서">중국어 백서</a>
		      		</div>	
		      		<div>
		      			<a href="${request.contextPath}/static/files/BEING-English.pdf" target="_blank" title="영어 백서">영어 백서</a>
		      		</div>	 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		 			<div>
		      			<a href="https://t.me/Being3" target="_blank" title="이메일">이메일</a>
		      		</div>
		       		<div>
		      			<a href="https://mobile.twitter.com/being36666" target="_blank" title="트위터">트위터</a>
		      		</div>		 
		       </div>
		       <div class="col-xs-6 col-md-3 col-lg-2">
		      		<div>
		      			<a href="https://www.facebook.com/profile.php?id=100028701533044" target="_blank" title="페이스북">페이스북</a>
		      		</div>		 
		       </div>
		       
	       </div>
        
            <div class="row">
                <hr>
                <div class="col-md-12 col-sm-12 col-xs-12 text-center">Copyright &copy; 2018.소스체인 All rights reserved.<a href="www.being.codes/" target="_blank" title="소스체인">소스체인</a> - 저작권소유</div>
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
					        title: "주의사항",
					        //closable: false,//是否允许关闭弹框
					        message: data,
					        buttons: [{
					     	    label: '확인',
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