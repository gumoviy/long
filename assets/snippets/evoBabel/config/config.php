<?php
//@author webber (web-ber12@yandex.ru)

if (!defined('MODX_BASE_PATH')) {
    die('What are you doing? Get out of here!');
}

//активный язык отдельно от списка
$activeLang = '<div id="curr_lang"><img src="assets/snippets/evoBabel/config/images/lang_[+alias+].png"> <a href="javascript:;">[+name+]</a></div>';

//активный язык в списке
$activeRow = '<div class="uk-width-auto uk-active"><span><img src="assets/snippets/evoBabel/config/images/lang_[+alias+].png"></span></div>';

//неактивный язык списка
$unactiveRow = '<div class="uk-width-auto"><a href="[+url+]"><img src="assets/snippets/evoBabel/config/images/lang_[+alias+].png" title="[+name+]"></a></div>';

//обертка списка языков
$langOuter = '<div class="other_langs uk-grid uk-grid-small" uk-grid>[+wrapper+]</div>';
