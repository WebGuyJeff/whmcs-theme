{foreach $navbar as $item}
    <li menuItemName="{$item->getName()}" class="d-block{if $item@first} no-collapse{/if}{if $item->hasChildren()} has-submenu{/if}{if $item->getClass()} {$item->getClass()}{/if}" id="{$item->getId()}-{$screen}">
        <a class="{if $item->hasChildren()}submenu-toggle" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#"{else}" href="{$item->getUri()}"{/if}{if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
            {$item->getLabel()}
            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
        </a>
        {if $item->hasChildren()}
            <ul class="submenu">
            {foreach $item->getChildren() as $childItem}
                {if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
                    <li class="submenu-divider"></li>
                {else}
                    <li menuItemName="{$childItem->getName()}" class="submenu-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}-{$screen}">
                        <a href="{$childItem->getUri()}" class="submenu-link"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                            {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                        </a>
                    </li>
                {/if}
            {/foreach}
            </ul>
        {/if}
    </li>
{/foreach}
{if !isset($rightDrop) || !$rightDrop}
    <li class="d-none dropdown collapsable-dropdown">
        <a class="dropdown-toggle" href="#" id="navbarDropdownMenu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {lang key='more'}
        </a>
        <ul class="collapsable-dropdown-menu dropdown-menu" aria-labelledby="navbarDropdownMenu">
        </ul>
    </li>
{/if}
