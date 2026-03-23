<!doctype html>
<html lang="en">
	<head>
		<meta charset="{$charset}" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>
			{if $kbarticle.title}{$kbarticle.title} - {/if}
			{$pagetitle} - {$companyname}
		</title>
		<link rel="canonical" href="https://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" />
		{include file="$template/includes/head.tpl"}
		{$headoutput}
	</head>
	<body class="whmcs-theme modern-header primary-bg-color" data-phone-cc-input="{$phoneNumberInputStyle}">
		{if $captcha}{$captcha->getMarkup()}{/if}
		{$headeroutput}
		<header id="site-header" class="site-header sticky-header">

			{* ======================================================
			CLIENT TOPBAR
			====================================================== *}

			{if $loggedin || $adminMasqueradingAsClient }
            <div class="client-topbar">
            	<div class="container">
        			<div class="topbar-content">
        				<div class="topbar-left">
        				    <div class="notification">
        				        <input id="notification_toggleCheckbox" type="checkbox" name="notification_popover" />
            					<label class="notification_toggle" for="notification_toggleCheckbox">
                					<i class="far fa-flag"></i>
                					{if count($clientAlerts) > 0}
                					<span class="badge-alert">
                					{count($clientAlerts)}
                					</span>
                					<span class="d-none d-sm-inline">
                					{lang key='notifications'}
                					</span>
                					{else}
                					<span class="d-sm-none">0</span>
                					<span class="d-none d-sm-inline">
                					{lang key='nonotifications'}
                					</span>
                					{/if}
            					</label>
            					<div class="notification_popover">
            						<ul>
            							{foreach $clientAlerts as $alert}
            							<li>
            								<a href="{$alert->getLink()}">
            									<i class="fas fa-fw fa-
            										{if $alert->getSeverity() == 'danger'}
            										exclamation-circle
            										{elseif $alert->getSeverity() == 'warning'}
            										exclamation-triangle
            										{elseif $alert->getSeverity() == 'info'}
            										info-circle
            										{else}
            										check-circle
            										{/if}">
            									</i>
            									<div>
            										{$alert->getMessage()}
            									</div>
            								</a>
            							</li>
            							{foreachelse}
            							<li class="none">
            								{lang key='notificationsnone'}
            							</li>
            							{/foreach}
            						</ul>
            					</div>
            				</div>
        				</div>
        				<div class="topbar-right">
        				    {if $adminMasqueradingAsClient}
        					<div class="client-switcher">
        						<span class="client-label d-none d-md-inline">
        						{lang key='loggedInAs'}:
        						</span>
        						<div class="btn-group topbar-account">
        							<a
        								href="{$WEB_ROOT}/clientarea.php?action=details"
        								class="client-name">
        							{if $client.companyname}
        							{$client.companyname}
        							{else}
        							{$client.fullName}
        							{/if}
        							</a>
        							<a
        								href="{routePath('user-accounts')}"
        								class="switch-account"
        								data-toggle="tooltip"
        								title="Switch Account">
        							<i class="fad fa-random"></i>
        							</a>
        						</div>
        					</div>
        					{else}
                    		<div class="topbar-account">
            				    <a href="{$WEB_ROOT}/clientarea.php">{$LANG.clientareatitle}</a>
    				            <a href="{$WEB_ROOT}/logout.php">{$LANG.logouttitle}</a>
    				            <span class="topbar-account-name">{$client.fullName}</span>
    				            <a href="{$WEB_ROOT}/clientarea.php">
            				        <img class="clientAvatar_image" src="https://www.gravatar.com/avatar/{$clientsdetails.email|md5}?d=https%3A%2F%2Fbigupweb.com%2Fassets%2Fimg%2Favatar%2Favatar-128px.png">
                                </a>
                    		</div>
        					{/if}
        				</div>
        			</div>
            	</div>
            </div>
            {/if}

			{* ======================================================
			MAIN HEADER
			====================================================== *}

        	<div class="header-inner">
        		<div class="container">
        			<div class="header-row">
        			    {* Logo *}
        				<div class="header-left">
        					<a href="{$WEB_ROOT}/index.php" class="logo">
        					    <img src="/assets/img/logo/icon-logo-landscape-darkmode-trans.png" alt="{$companyname}">
        					</a>
        				</div>
        				{* Desktop Navigation *}
        				<nav class="main-nav">
        				    {include file="$template/includes/bigupweb/menu-main.tpl" position="header"}
        				</nav>
        				{* Header Tools *}
        				<div class="header-actions">
        					<a href="{$WEB_ROOT}/cart.php?a=view" class="cart-button">
            					<i class="far fa-shopping-cart"></i>
            					<span id="cartItemCount">{$cartitemcount}</span>
        					</a>
        					{if $loggedin}
                		    <a class="header-avatar" href="{$WEB_ROOT}/clientarea.php">
                			    <img class="clientAvatar_image" src="https://www.gravatar.com/avatar/{$clientsdetails.email|md5}?d=https%3A%2F%2Fbigupweb.com%2Fassets%2Fimg%2Favatar%2Favatar-128px.png">
                			</a>
                			{else}
                			<a class="header-avatar" href="{$WEB_ROOT}/login.php">
                			    <img class="clientAvatar_image logged-out" src="https://bigupweb.com/assets/img/avatar/avatar-128px.png">
                			</a>
                			{/if}
        					<button
        					    id="drawerMenu_toggle"
        						data-target="#mobileMenu">
        					    <span></span>
                                <span></span>
                                <span></span>
        					</button>
        				</div>
        			</div>
        		</div>
        	</div>

			{* ======================================================
			MOBILE DRAWER
			====================================================== *}

            <div id="drawerMenu_overlay"></div>
            <nav id="drawerMenu" class="no-scrollbar">
            	<div class="drawerMenu_header">
            		<a href="{$WEB_ROOT}/index.php" class="drawerMenu_logo">
            		    <img src="/assets/img/logo/icon-logo-landscape-darkmode-trans.png" alt="{$companyname}">
            		</a>
            		<button id="drawerMenu_close">
                		<span></span>
                		<span></span>
            		</button>
            	</div>
        		<div class="drawerMenu_account">
        		    {if $loggedin}
        		    <a href="{$WEB_ROOT}/clientarea.php">
        			    <img class="clientAvatar_image" src="https://www.gravatar.com/avatar/{$clientsdetails.email|md5}?d=https%3A%2F%2Fbigupweb.com%2Fassets%2Fimg%2Favatar%2Favatar-128px.png">
        			</a>
        			<div>
        				<span>{$client.fullName}</span>
        				<div>
            				<a href="{$WEB_ROOT}/clientarea.php">{$LANG.clientareatitle}</a>
            				<a href="{$WEB_ROOT}/logout.php">{$LANG.logouttitle}</a>
            				<div class="notification">
            					<button class="notification_toggle" popovertarget="drawerNotifications_popover">
                					<i class="far fa-flag"></i>
                					{if count($clientAlerts) > 0}
                					<span class="badge-alert">
                					{count($clientAlerts)}
                					</span>
                					{else}
                					<span>0</span>
                					{/if}
            					</button>
            					<div popover="auto" id="drawerNotifications_popover" class="notification_popover">
            						<ul class="client-alerts">
            							{foreach $clientAlerts as $alert}
            							<li>
            								<a href="{$alert->getLink()}">
            									<i class="fas fa-fw fa-
            										{if $alert->getSeverity() == 'danger'}
            										exclamation-circle
            										{elseif $alert->getSeverity() == 'warning'}
            										exclamation-triangle
            										{elseif $alert->getSeverity() == 'info'}
            										info-circle
            										{else}
            										check-circle
            										{/if}">
            									</i>
            									<div class="alert-message">
            										{$alert->getMessage()}
            									</div>
            								</a>
            							</li>
            							{foreachelse}
            							<li class="none">
            								{lang key='notificationsnone'}
            							</li>
            							{/foreach}
            						</ul>
            					</div>
            				</div>
        				</div>
        			</div>
        			{else}
        			<a href="{$WEB_ROOT}/login.php">
        			    <img class="clientAvatar_image logged-out" src="https://bigupweb.com/assets/img/avatar/avatar-128px.png">
        			</a>
        			<div>
        				<div>
        			        <a href="{$WEB_ROOT}/login.php">{$LANG.clientlogin}</a>
        			    </div>
        			</div>
        			{/if}
        		</div>
            	<div class="drawerMenu_cartPreview">
            		<a href="{$WEB_ROOT}/cart.php?a=view">
            		<i class="far fa-shopping-cart"></i>
            		<span>{$cartitemcount} items</span>
            		</a>
            	</div>
            	<div class="drawerMenu_navigation">
            		<ul>
            			{include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
            		</ul>
            		<ul>
            			{include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
            		</ul>
            	</div>
            </nav>

		</header>
		
		{* ======================================================
		DOMAIN SEARCH AND SIDEBAR
		====================================================== *}

		{include file="$template/includes/validateuser.tpl"}
		{include file="$template/includes/verifyemail.tpl"}
		{if $templatefile == 'homepage'}
		{if $registerdomainenabled || $transferdomainenabled}
		{include file="$template/includes/domain-search.tpl"}
		{/if}
		{/if}
		<section id="main-body">
		<div class="{if !$skipMainBodyContainer}container{/if}">
		<div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}row{/if}">
		{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
		<div class="col-lg-4 col-xl-3">
			<div class="sidebar">
				{include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
			</div>
			{if !$inShoppingCart && $secondarySidebar->hasChildren()}
			<div class="d-none d-lg-block sidebar">
				{include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
			</div>
			{/if}
		</div>
		{/if}
		<div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{/if} primary-content">