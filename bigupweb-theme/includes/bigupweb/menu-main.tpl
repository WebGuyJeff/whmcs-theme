{if $position }
    <ul id="{$position}MainMenu">
    
        {* ===============================
        DOMAINS
        ================================ *}
    
        <li class="menu_item">
        	<a href="#" aria-haspopup="true" aria-expanded="false">
        	    <span>{$LANG.navdomains}</span>
        	</a>
        	<div class="dropdown">
        		<div class="dropdown_primary">
        		    {if $position == 'header'}
        		    <h4>
        		        <i class="fa-solid fa-globe"></i>{$LANG.navdomains}
                    </h4>
                    {/if}
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
    					<li class="dropdown_Divider"></li>
    					<li>
    						<a href="/clientarea.php?action=domains" aria-haspopup="true" aria-expanded="false">
    						    <span>{$LANG.clientareanavdomains}</span>
    						</a>
    					</li>
    					{/if}
    				</ul>
    				{if $position == 'header'}
        			<div class="tldScroller">
                        <div class="tldScroller_track">
                            {foreach $tldPricing.all as $tld}
                            <div class="tldPill">
                                <span class="tldPill_name">{$tld.tld}</span>
                                <span class="tldPill_price">{$tld.prefix}{$tld.price}</span>
                            </div>
                            {/foreach}
                            {* duplicate for seamless infinite scroll *}
                            {foreach $tldPricing.all as $tld}
                            <div class="tldPill">
                                <span class="tldPill_name">{$tld.tld}</span>
                                <span class="tldPill_price">{$tld.prefix}{$tld.price}</span>
                            </div>
                            {/foreach}
                        </div>
                    </div>
                    {/if}
        		</div>
                {if $position == 'header'}
        		<div class="cardFeatured">
        			<h4>{$LANG.registerdomain}</h4>
        			<ul class="spotlightTldList">
        				{foreach $tldPricing.spotlight as $tld}
        				<li>
        					<span>{$tld.tld}</span>
        					<span class="mega-spotlight-price">{$tld.prefix}{$tld.price}</span>
        				</li>
        				{/foreach}
        			</ul>
        			<form class="domainCheckerSmall" method="post" action="/cart.php?a=add&domain=register">
        				<input type="text" name="query" placeholder="{$LANG.domaincheckerchoosedomain}" class="form-control" />
            			<button type="submit" class="btn btn-primary" aria-label="{$LANG.search}">
            				<span><i class="fa-solid fa-magnifying-glass"></i></span>
            			</button>
        			</form>
        		</div>
        		{/if}
        	</div>
        </li>
    
    	{* ===============================
    	PRODUCT GROUPS
    	================================ *}
    
    	{foreach $navProductGroups as $group}
    	<li class="menu_item">
    		<a href="#" aria-haspopup="true" aria-expanded="false">
    		    <span>{$group.name}</span>
    		</a>
    		<div class="dropdown">
    			<div class="dropdown_primary">
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
    			{if $position == 'header' && $group.featured}
    			<div class="cardFeatured">
    				<h4>{$group.featured.name}</h4>
    				<p>{$group.featured.description|truncate:140}</p>
    				{if $group.featured.price != ''}
    				<div class="cardFeatured_price">
    				    {if $group.featured.price != '0'}
    				    <span>{$LANG.custom.only}</span>
    				    <span>{if $group.featured.prefix}{$group.featured.prefix}{/if}{$group.featured.price}</span>
    				    {if $group.featured.period}<span class="cardFeatured_term">/{$group.featured.period}</span>{/if}
    				    {else}
    				    <span>{$LANG.custom.startFree}</span>
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
    	
    	{assign 'orderedNavs' [ $secondaryNavbar, $primaryNavbar ]}
    
    	<li class="menu_item">
            <a href="#" aria-haspopup="true" aria-expanded="false">
        		<span>{$LANG.account}</span>
    		</a>
    		<div class="dropdown">
    			<div class="dropdown_primary dropdown_primary-withColumns">
    			    {foreach $orderedNavs as $nav}
    			    {foreach $nav as $item}
    			    <div>
                    	{if $item->hasChildren()}
                    	<h4>
                    	    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    	    <span>{$item->getLabel()}</span>
                    	    {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                    	</h4>
        				<ul>
        					{foreach $item->getChildren() as $childItem}
        					{if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown_Divider', 'nav-divider'])}
        					<li class="dropdown_Divider"></li>
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
                	{/foreach}
    			</div>
    		</div>
    	</li>
    </ul>
{/if}