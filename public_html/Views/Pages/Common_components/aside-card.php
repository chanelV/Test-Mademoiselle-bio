<?php
use Models\Posts;
$getPostsUser = Posts::getPostsUser($me['info']['id']);
?>

<div class="right-sidebar">
    <?php if($type){  ?>

        <div class="widget widget-jobs">
            <div class="sd-title">
                <h3>Meilleurs Mission</h3>
                <i class="la la-ellipsis-v"></i>
            </div>
            <div class="jobs-list">
                <div class="job-info">
                    <div class="job-details">
                        <h3>Nike Air Zoom Pegasus 39</h3>
                        <p>L'objectif de cette mission consiste à promotion de la nouvelle..</p>
                    </div>
                </div><!--job-info end-->
                <div class="job-info">
                    <div class="job-details">
                        <h3>Rouge à lèvre Dior Baume coloré</h3>
                        <p>La mission à promouvoir notre gamme Rouge à lèvre Baume coloré de chez DIOR afin ..</p>
                    </div>
                    <div class="hr-rate">
                    </div>
                </div><!--job-info end-->
                <div class="view-more">
                    <a href="/" title="">Voir Tout </a>
                </div>
                
            </div><!--jobs-list end-->
        </div><!--widget-jobs end-->

        <?php } else { ?>

        <div class="suggestions full-width">
            <div class="sd-title">
                <h3>Suggestions des influenceos </h3>
                <i class="la la-ellipsis-v"></i>
            </div><!--sd-title end-->
            <div class="suggestions-list">
                <div class="suggestion-usd">
                <img src="<?=$me['info']['picture']?>" height="25" width="25" alt="">                    <div class="sgt-text">
                        <h4>Bassiratou</h4>
                        <span>Make-up Artist</span>
                    </div>
                    <span><i class="la la-plus"></i></span>
                </div>
                <div class="suggestion-usd">
                    <img src="http://via.placeholder.com/35x35" alt="">
                    <div class="sgt-text">
                        <h4>John Doe</h4>
                        <span>Youtubeur</span>
                    </div>
                    <span><i class="la la-plus"></i></span>
                </div>
                <div class="suggestion-usd">
                    <img src="http://via.placeholder.com/35x35" alt="">
                    <div class="sgt-text">
                        <h4>Poonam</h4>
                        <span>Coiffeur</span>
                    </div>
                    <span><i class="la la-plus"></i></span>
                </div>
                <div class="suggestion-usd">
                    <img src="http://via.placeholder.com/35x35" alt="">
                    <div class="sgt-text">
                        <h4>Bill Gates</h4>
                        <span>Coach Motivateur</span>
                    </div>
                    <span><i class="la la-plus"></i></span>
                </div>
                <div class="suggestion-usd">
                    <img src="http://via.placeholder.com/35x35" alt="">
                    <div class="sgt-text">
                        <h4>Jessica William</h4>
                        <span>>Influenceur beauté</span>
                    </div>
                    <span><i class="la la-plus"></i></span>
                </div>
                <div class="suggestion-usd">
                    <img src="http://via.placeholder.com/35x35" alt="">
                    <div class="sgt-text">
                        <h4>John Doe</h4>
                        <span>Influenceur</span>
                    </div>
                    <span><i class="la la-plus"></i></span>
                </div>
                <div class="view-more">
                    <a href="/profile-list" title="">Voir Tout </a>
                </div>
            </div><!--suggestions-list end-->
        </div><!--suggestions end-->
    <? } ?>
    
</div><!--right-sidebar end-->