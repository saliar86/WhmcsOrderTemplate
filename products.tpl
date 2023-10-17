<style>
    #order-standard_cart .products .product header span {
    margin: 0;
    color: #333;
    font-size: 1.05em !important;
    }
</style>
{include file="orderforms/standard_cart/common.tpl"}

<div id="order-standard_cart">
    <div class="row">
        <div class="cart-sidebar sidebar">
            {include file="orderforms/standard_cart/sidebar-categories.tpl"}
        </div>
        <div class="cart-body">

            <div class="header-lined">
                <h1 class="font-size-36">
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h1>
                {if $productGroup.tagline}
                    <p>{$productGroup.tagline}</p>
                {/if}
            </div>
            {if $errormessage}
                <div class="alert alert-danger">
                    {$errormessage}
                </div>
            {elseif !$productGroup}
                <div class="alert alert-info">
                    {lang key='orderForm.selectCategory'}
                </div>
            {/if}

            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}

            <div class="products" id="products">
                <div class="row row-eq-height">
                    {foreach $products as $key => $product}
                        {$idPrefix = ($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}
                    <div class="col-12 col-md-6 mb-4">
                        <div class="product clearfix p-0 m-0 border-0" style="border-radius: 0.5rem !important">
                            <header class="d-flex flex-row justify-content-between bg-dark p-0 m-0 px-3 py-3" style="border-radius: 0.5rem 0.5rem 0 0 !important">
                                <span class="text-light h6">{$product.name}</span>
                                <span class="">
                                    <span class="text-warning ">{$product.pricing.minprice.price}</span>
                                    <span class="small" style="color: #9fa2a4!important;"> 
                                        {if $product.pricing.minprice.cycle eq "monthly"}
                                                {$LANG.orderpaymenttermmonthly}
                                            {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                                {$LANG.orderpaymenttermquarterly}
                                            {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                                {$LANG.orderpaymenttermsemiannually}
                                            {elseif $product.pricing.minprice.cycle eq "annually"}
                                                {$LANG.orderpaymenttermannually}
                                            {elseif $product.pricing.minprice.cycle eq "biennially"}
                                                {$LANG.orderpaymenttermbiennially}
                                            {elseif $product.pricing.minprice.cycle eq "triennially"}
                                                {$LANG.orderpaymenttermtriennially}
                                            {/if}
                                    </span>
                                </span>
                            </header>
                            <div class="px-3 px-md-4 py-3 py-md-4">
                                {if $product.featuresdesc}
                                    <p id="{$idPrefix}-description">
                                        {$product.featuresdesc}
                                    </p>
                                {/if}
                                {if $product.features}
                                    <ul>
                                        {foreach $product.features as $feature => $value}
                                            <li id="{$idPrefix}-feature{$value@iteration}">
                                                <span class="feature-value">{$value}</span>
                                                {$feature}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                                
                            </div>
                            <div class="d-flex flex-row {if $product.pricing.minprice.setupFee} justify-content-between {else} justify-content-end {/if} align-items-end p-0 m-0 px-3 px-md-4 py-3">
                                {if $product.pricing.minprice.setupFee}
                                    <div class="m-0 p-0">
                                        <p class="m-0 p-0" style="font-size: 90%;">{$LANG.ordersetupfee} {$product.pricing.minprice.setupFee->toPrefixed()} </p>
                                    </div>
                                {/if}
                                <a href="{$product.productUrl}" class="btn btn-warning btn-sm btn-order-now" id="{$idPrefix}-order-button"{if $product.hasRecommendations} data-has-recommendations="1"{/if}>
                                    <i class="fas fa-shopping-cart"></i>
                                    {$LANG.ordernowbutton}
                                </a>
                            </div>
                        </div>
                    </div>
                    {if $product@iteration % 2 == 0}
                </div>
                <div class="row row-eq-height">
                    {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="orderforms/standard_cart/recommendations-modal.tpl"}
