<ul class="mega-navbar">

    {* ===============================
    DOMAINS
    ================================ *}

    <li class="mega-domains mega-item has-mega">
    	<a href="#" aria-haspopup="true" aria-expanded="false">
    	    <span>{$LANG.navdomains}</span>
    	</a>
    	<div class="mega-dropdown">
    		<div class="mega-left">
    		    <h4><i class="fa-solid fa-globe"></i>{$LANG.navdomains}</h4>
                <ul>
                    <li>
						<a href="/domainchecker.php" aria-haspopup="true" aria-expanded="false">
						    <span>{$LANG.navdomainsearch}</span>
						</a>
					</li>
					<li>
						<a href="/cart.php?a=add&domain=register">
						    <span>{$LANG.navregisterdomain}</span>
						</a>
					</li>
					<li>
						<a href="/cart.php?a=add&domain=transfer" aria-haspopup="true" aria-expanded="false">
						    <span>{$LANG.navtransferdomain}</span>
						</a>
					</li>
					
					
					{if $loggedin || $adminMasqueradingAsClient }
					<li class="mega-dropdown-divider"></li>
					<li>
						<a href="/clientarea.php?action=domains" aria-haspopup="true" aria-expanded="false">
						    <span>{$LANG.clientareanavdomains}</span>
						</a>
					</li>
					{/if}
				</ul>
    			<div class="tld-scroll">
                    <div class="tld-scroll-track">
                
                        {foreach $tldPricing.all as $tld}
                        <span class="tld-pill">
                            <span class="tld-pill-name">{$tld.tld}</span>
                            <span class="tld-pill-price">{$tld.prefix}{$tld.price}</span>
                        </span>
                        {/foreach}
                
                        {* duplicate for seamless infinite scroll *}
                        {foreach $tldPricing.all as $tld}
                        <span class="tld-pill">
                            <span class="tld-pill-name">{$tld.tld}</span>
                            <span class="tld-pill-price">{$tld.prefix}{$tld.price}</span>
                        </span>
                        {/foreach}
                
                    </div>
                </div>
    		</div>
    
    		<div class="mega-featured">
    			<h4>{$LANG.registerdomain}</h4>
    
    			<ul class="mega-spotlight-tlds">
    				{foreach $tldPricing.spotlight as $tld}
    				<li>
    					<span>{$tld.tld}</span>
    					<span class="mega-spotlight-price">{$tld.prefix}{$tld.price}</span>
    				</li>
    				{/foreach}
    			</ul>
    			<form class="mega-domain-checker" method="post" action="/cart.php?a=add&domain=register">
    				<input type="text" name="query" placeholder="{$LANG.domaincheckerchoosedomain}" class="form-control" />
        			<button type="submit" class="btn btn-primary" aria-label="{$LANG.search}">
        				<span><i class="fa-solid fa-magnifying-glass"></i></span>
        			</button>
    			</form>
    		</div>
    	</div>
    </li>

	{* ===============================
	PRODUCT GROUPS
	================================ *}

	{foreach $navProductGroups as $group}
	<li class="mega-product-group mega-item has-mega">
		<a href="#" aria-haspopup="true" aria-expanded="false">
		    <span>{$group.name}</span>
		</a>
		<div class="mega-dropdown">
			<div class="mega-left">
			    <h4>{if $group.icon}<i class="{$group.icon}"></i>{/if}{$group.name}</h4>
				<ul>
					{foreach $group.products as $product}
					<li>
						<a href="{$product.link}">
						    <span>{$product.name}</span>
						</a>
					</li>
					{/foreach}
					<li>
						<a href="{$group.link}" aria-haspopup="true" aria-expanded="false">
						    <span>See all &#8594;</span>
						</a>
					</li>
				</ul>
			</div>
			{if $group.featured}
			<div class="mega-featured">
				<h4>{$group.featured.name}</h4>
				<p>{$group.featured.description|truncate:140}</p>
				{if $group.featured.price != ''}
				<div class="mega-price">
				    {if $group.featured.price != '0'}
				    <span class="mega-featured-price-eyebrow">{$LANG.custom.only}</span>
				    <span class="mega-featured-price">{if $group.featured.prefix}{$group.featured.prefix}{/if}{$group.featured.price}</span>
				    {if $group.featured.period}<span class="mega-featured-price-period">/{$group.featured.period}</span>{/if}
				    {else}
				    <span class="mega-featured-price">{$LANG.custom.startFree}</span>
				    {/if}
				</div>
				{/if}
				<a href="{$group.featured.link}" class="btn btn-primary">
				    <span>{$LANG.store.getstarted}</span>
			    </a>
			</div>
			{/if}
		</div>
	</li>
	{/foreach}

	{* ===============================
	ACCOUNT
	================================ *}

	<li class="mega-secondary-nav mega-item has-mega">
        <a href="#" aria-haspopup="true" aria-expanded="false">
    		<span>{$LANG.account}</span>
		</a>
		<div class="mega-dropdown">
			<div class="mega-left mega-left-cards">
			    {foreach $secondaryNavbar as $item}
			    <div class="mega-card">
                	{if $item->hasChildren()}
                	<h4>
                	    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                	    <span>{$item->getLabel()}</span>
                	    {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                	</h4>
    				<ul>
    					{foreach $item->getChildren() as $childItem}
    					{if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
    					<li class="mega-dropdown-divider"></li>
    					{else}
    					<li>
    						<a href="{$childItem->getUri()}">
    						    <span>{$childItem->getLabel()}</span>
    						</a>
    					</li>
    					{/if}
    					{/foreach}
    				</ul>
    				{else}
            		<a href="{$item->getUri()}" {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
                		{if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                		<span>{$item->getLabel()}</span>
                		{if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
            		</a>
                	{/if}
                </div>
            	{/foreach}
            	{foreach $primaryNavbar as $item}
			    <div class="mega-card">
                	{if $item->hasChildren()}
                	<h4>
                	    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                	    <span>{$item->getLabel()}</span>
                	    {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                	</h4>
    				<ul>
    					{foreach $item->getChildren() as $childItem}
    					{if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
    					<li class="mega-dropdown-divider"></li>
    					{else}
    					<li>
    						<a href="{$childItem->getUri()}">
    						    <span>{$childItem->getLabel()}</span>
    						</a>
    					</li>
    					{/if}
    					{/foreach}
    				</ul>
    				{else}
            		<a href="{$item->getUri()}" {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
                		{if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                		<span>{$item->getLabel()}</span>
                		{if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
            		</a>
                	{/if}
                </div>
            	{/foreach}
			</div>
		</div>
	</li>
</ul>