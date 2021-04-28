<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'text' => array(
        'caption' => 'Текст ссылки',
        'type' => 'text'
    ),
    'descr' => array(
        'caption' => 'Описание',
        'type' => 'text'
    ),
    'link' => array(
        'caption' => 'Ссылка',
        'type' => 'text'
    )
);
$settings['configuration'] = array(
    'enablePaste' => false,
    'csvseparator' => ',',
    'radioTabs' => true,
    'hideHeader' => true
);
$settings['templates'] = array(
    'outerTpl' => '<table>[+wrapper+]</table>',
    'rowTpl' => '[+fieldTab:select=`onecol=<tr><td><h1>[+title1_1+]</h1>[+content1_1+]</td></tr>&twocol=<tr><td><h1>[+title2_1+]</h1>[+content2_1+]</td><td><h1>[+title2_2+]</h1>[+content2_2+]</td></tr>`+]'
);