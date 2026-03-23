{* BWH homepage intro *}
<h1 class="homepage_title">Bigup Web Hosting</h1>
<h2 class="homepage_tagline" class="homepage_title">Website Hosting, Domain Names & Web Development</h2>
<div class="homepage_intro">
    <div class="homepage_content">
        <p>Welcome to Bigup Web Hosting - Easy UK-based website hosting, web development and domain names powered by 100% renewable energy.</p>
        
        <p>From simple web hosting and domain names to bespoke websites, we've got you covered.</p>
        
        <div class="homepage_cta">
            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-primary">Domain Names</a>
            <a href="{$WEB_ROOT}/store/website-hosting" class="btn btn-primary">Website Hosting</a>
        </div>
        
        <p>We understand that online presence is about crafting a digital identity that reflects your unique vision and goals. That's why we provide bespoke solutions on a one-to-one basis.</p>
        
        <p>We work with individuals building personal websites, bespoke business websites, bespoke hosting plans, domain registration, custom domain emails and more.</p>
        
        <p>So why wait? Contact us with your requirements and let's get started!</p>
        
        <div class="homepage_cta">
            <a href="{$WEB_ROOT}/contact.php" class="btn btn-primary">Get in touch</a>
        </div>
    </div>
</div>

{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
	{* BWH skew heading *}
    <h2 class="text-center m-4 skew10"><span class="unSkew10">{lang key='clientHomePanels.productsAndServices'}</span></h2>

	{* BWH card grid *}
    <div class="cardsGrid cardsGrid-3col">
        {foreach $productGroups as $productGroup}
            <div class="cardsGrid_card card-white">
                <h3 class="cardsGrid_title">
					{$productGroup->name}
				</h3>
				<p>{$productGroup->tagline}</p>
				<a href="{$productGroup->getRoutePath()}" class="btn btn-block btn-outline-primary">
					{lang key='browseProducts'}
				</a>
            </div>

        {/foreach}

        {if $registerdomainenabled}
			{* BWH card *}
            <div class="cardsGrid_card card-white">
                <h3 class="cardsGrid_title">
                    {lang key='orderregisterdomain'}
				</h3>
				<p>{lang key='secureYourDomain'}</p>
				<a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-block btn-outline-primary">
					{lang key='navdomainsearch'}
				</a>
            </div>
        {/if}
        {if $transferdomainenabled}
			{* BWH card *}
            <div class="cardsGrid_card card-white">
                <h3 class="cardsGrid_title">
					{lang key='transferYourDomain'}
				</h3>
				<p>{lang key='transferExtend'}</p>
				<a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-block btn-outline-primary">
					{lang key='transferYourDomain'}
				</a>
            </div>
        {/if}
    </div>
{/if}

{* BWH skew heading *}
<h2 class="text-center m-4 skew10"><span class="unSkew10">{lang key='howCanWeHelp'}</span></h2>

{* BWH links grid *}
<div class="linksGrid linksGrid-3col">
    <a href="{routePath('announcement-index')}" class="linksGrid_link card-white">
		<figure class="linksGrid_icon">
			<i class="fal fa-bullhorn"></i>
		</figure>
		{lang key='announcementstitle'}
	</a>

	{* BWH custom links *}
    <a href="clientarea.php" class="linksGrid_link card-white">
        <figure class="linksGrid_icon">
            <i class="fal fa-home"></i>
        </figure>
        {lang key='homepage.yourAccount'}
    </a>
    <a href="submitticket.php" class="linksGrid_link card-white">
        <figure class="linksGrid_icon">
            <i class="fal fa-life-ring"></i>
        </figure>
        {lang key='homepage.submitTicket'}
    </a>

</div>


{* BWH hide content

	<h2 class="text-center m-4 skew10"><span class="unSkew10">{lang key='howCanWeHelp'}</span></h2>

	<div class="linksGrid linksGrid-3col">
		<a href="{routePath('announcement-index')}" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-bullhorn"></i>
			</figure>
			{lang key='announcementstitle'}
		</a>
		<a href="serverstatus.php" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-server"></i>
			</figure>
			{lang key='networkstatustitle'}
		</a>
		<a href="{routePath('knowledgebase-index')}" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-book"></i>
			</figure>
			{lang key='knowledgebasetitle'}
		</a>
		<a href="{routePath('download-index')}" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-download"></i>
			</figure>
			{lang key='downloadstitle'}
		</a>
		<a href="submitticket.php" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-life-ring"></i>
			</figure>
			{lang key='homepage.submitTicket'}
		</a>
	</div>

	<h2 class="text-center m-4 skew10"><span class="unSkew10">{lang key='homepage.yourAccount'}</span></h2>

	<div class="linksGrid linksGrid-3col">
		<a href="clientarea.php" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-home"></i>
			</figure>
			{lang key='homepage.yourAccount'}
		</a>
		<a href="clientarea.php?action=services" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="far fa-cubes"></i>
			</figure>
			{lang key='homepage.manageServices'}
		</a>
		{if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
        <a href="clientarea.php?action=domains" class="linksGrid_link card-white">
            <figure class="linksGrid_icon">
				<i class="fal fa-globe"></i>
			</figure>
			{lang key='homepage.manageDomains'}
		</a>
		{/if}
		<a href="supporttickets.php" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-comments"></i>
			</figure>
			{lang key='homepage.supportRequests'}
		</a>
		<a href="clientarea.php?action=masspay&all=true" class="linksGrid_link card-white">
			<figure class="linksGrid_icon">
				<i class="fal fa-credit-card"></i>
			</figure>
			{lang key='homepage.makeAPayment'}
		</a>
	</div>
*}
