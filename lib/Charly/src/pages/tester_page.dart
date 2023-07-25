// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports

// void main() => runApp(const MaterialApp(home: WebViewExample()));

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>


<html lang="en"><head><meta charset="utf-8"><link rel="icon" href="/favicon32.ico"><meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"><meta name="theme-color" content="#1b243e"><meta name="description" content="Gol-Ball"><meta name="image" content="/favicon32.ico"><link rel="apple-touch-icon" href="/logo192.png"><link rel="manifest" href="/manifest.json"><script type="text/javascript" async="" src="https://analytics.tiktok.com/i18n/pixel/config.js?sdkid=CESALAJC77U87C9MP4T0&amp;hostname=golball.com"></script><script type="text/javascript" async="" src="https://analytics.tiktok.com/i18n/pixel/events.js?sdkid=CESALAJC77U87C9MP4T0&amp;lib=ttq"></script><script async="" src="https://static.ads-twitter.com/uwt.js"></script><script src="https://connect.facebook.net/signals/config/838483467205186?v=2.9.92&amp;r=stable" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-7RVH0HMNVE&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NX8BGDD"></script><script>!function(e,t,a,n,g){e[n]=e[n]||[],e[n].push({"gtm.start":(new Date).getTime(),event:"gtm.js"});var m=t.getElementsByTagName(a)[0],r=t.createElement(a);r.async=!0,r.src="https://www.googletagmanager.com/gtm.js?id=GTM-NX8BGDD",m.parentNode.insertBefore(r,m)}(window,document,"script","dataLayer")</script><title>Gol-Ball</title><script defer="defer" src="/static/js/main.9df31bc4.js"></script><link href="/static/css/main.bfcede4e.css" rel="stylesheet"><script charset="utf-8" src="https://analytics.tiktok.com/i18n/pixel/identify.js"></script><style data-emotion="css-global" data-s=""></style><style data-emotion="css" data-s=""></style></head><body><noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NX8BGDD" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript><noscript>You need to enable JavaScript to run this app.</noscript><div id="root"><div class="MuiBox-root css-1kerff5"><header class="MuiPaper-root MuiPaper-elevation MuiPaper-elevation4 MuiAppBar-root MuiAppBar-colorPrimary MuiAppBar-positionRelative css-gjqson" data-testid="header"><div class="MuiBox-root css-1fr3dm4"><div class="css-whtk5t"><div class="css-vb6e92"><button class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-1118lqw" tabindex="0" type="button"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="MenuIcon"><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg><span class="MuiTouchRipple-root css-w0pj6f"></span></button><div class="css-wuw9o9"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1f2v79d" href="/"><img src="https://static.prod.golball.com/marketplace/img/golball/logos/golball-logo-white.png" class="css-13mrkzo"></a></div></div><div class="css-whtk5t"><div class="css-1azfs0d"><button class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-1118lqw" tabindex="0" type="button" data-testid="headerSearchButton"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-y5a1rc" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="SearchIcon"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg><span class="MuiTouchRipple-root css-w0pj6f"></span></button></div></div></div></div></header><div class="MuiBox-root css-1syueat"><div data-testid="content" class="css-j7qwjs"><div class="MuiBox-root css-1whc2va"><div class="MuiContainer-root MuiContainer-maxWidthXl css-mubvo4"><div class="css-ikzlcq"><div data-testid="productDetails-a661b11d-51d0-4c90-b8f8-68dbce992a52" class="css-j7qwjs"><div class="css-1xhj18k"><button class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-1npilf2" tabindex="0" type="button"><span class="MuiButton-startIcon MuiButton-iconSizeMedium css-1l6c7y9"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ArrowBackIosNewIcon"><path d="M17.77 3.77 16 2 6 12l10 10 1.77-1.77L9.54 12z"></path></svg></span>Volver<span class="MuiTouchRipple-root css-w0pj6f"></span></button></div></div><div class="css-dvxtzn"><div data-testid="productDetails-a661b11d-51d0-4c90-b8f8-68dbce992a52" class="css-7ceccl"><div class="MuiBox-root css-0"><div data-testid="productDetailsAlertFinishedProduct" class="css-j7qwjs"><div class="MuiBox-root css-0"><div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation0 MuiAlert-root MuiAlert-standardWarning MuiAlert-standard css-84lbnz" role="alert"><div class="MuiAlert-icon css-1l54tgj"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1fp1j5h" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="NotificationsIcon"><path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.89 2 2 2zm6-6v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2z"></path></svg></div><div class="MuiAlert-message css-1xsto0d">Este coleccionable ya no se encuentra disponible. Pronto comunicaremos el ganador del Balón de Gol.</div></div></div></div></div><div class="css-fc990z"><div class="MuiBox-root css-0"><h4 class="MuiTypography-root MuiTypography-h4 css-jijqtq">Isi Palazón  · GOL #1 vs Real Valladolid </h4><h5 class="MuiTypography-root MuiTypography-h5 css-1slxf3k"></h5></div></div><div class="MuiBox-root css-1sf3xto"><div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-fy4xk8"><div class="MuiGrid-root MuiGrid-container css-fhbyxg"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-6 css-96d56r"><img class="MuiCardMedia-root MuiCardMedia-media MuiCardMedia-img css-9pr4b1" src="https://static.prod.golball.com/marketplace/products/multimedia/a661b11d-51d0-4c90-b8f8-68dbce992a52/player/gol1rayo.jpg" alt=""><div class="MuiCardContent-root css-urnk43"><div class="MuiBox-root css-l6i377"><div class="css-20fnt0"><h6 class="MuiTypography-root MuiTypography-subtitle1 MuiTypography-alignCenter css-aroldg"><strong># LaLiga-141</strong></h6></div></div><div class="MuiBox-root css-uk9iua"><div class="css-1wv3lsg"><span class="MuiButtonBase-root MuiCheckbox-root MuiCheckbox-colorDefault PrivateSwitchBase-root MuiCheckbox-root MuiCheckbox-colorDefault MuiCheckbox-root MuiCheckbox-colorDefault css-h5g0q7"><input class="PrivateSwitchBase-input css-1m9pwf3" type="checkbox" data-indeterminate="false"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="VolumeUpIcon"><path d="M3 9v6h4l5 5V4L7 9H3zm13.5 3c0-1.77-1.02-3.29-2.5-4.03v8.05c1.48-.73 2.5-2.25 2.5-4.02zM14 3.23v2.06c2.89.86 5 3.54 5 6.71s-2.11 5.85-5 6.71v2.06c4.01-.91 7-4.49 7-8.77s-2.99-7.86-7-8.77z"></path></svg><span class="MuiTouchRipple-root css-w0pj6f"></span></span></div><audio><source src="https://static.prod.golball.com/marketplace/products/multimedia/a661b11d-51d0-4c90-b8f8-68dbce992a52/goal/sound/SANT_J17_VLL_RAY_0001_1_1.mp3" type="audio/mpeg"></audio></div></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-6 css-96d56r"></div></div></div></div><div class="MuiGrid-root MuiGrid-container css-8h776z"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-6 css-tletg0"><div class="css-ln21jo"><div data-testid="productDetailsPricingSection" class="css-ikzlcq"><div class="MuiBox-root css-0"><div class="css-v5yex1"><div class="css-1xhj18k"><button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeLarge MuiButton-containedSizeLarge Mui-disabled MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeLarge MuiButton-containedSizeLarge css-17m0c2x" tabindex="-1" type="button" disabled="" data-testid="paymentWidgetBuyButton"><h6 class="MuiTypography-root MuiTypography-h6 css-b97395">COMPRAR | 5 €</h6></button></div></div></div></div><div class="css-l5c1s3"><h6 class="MuiTypography-root MuiTypography-h6 css-b97395">Coleccionables disponibles: </h6><div class="MuiBox-root css-70qvj9"><div class="MuiBox-root css-1izqjw1"><span class="MuiLinearProgress-root MuiLinearProgress-colorPrimary MuiLinearProgress-determinate css-a5droy" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><span class="MuiLinearProgress-bar MuiLinearProgress-barColorPrimary MuiLinearProgress-bar1Determinate css-1my05bn" style="transform: translateX(-100%);"></span></span></div><div class="MuiBox-root css-0"><p class="MuiTypography-root MuiTypography-body2 css-1mt0axp">0/50</p></div></div></div></div></div></div><div class="css-1n1rld4"><div class="MuiBox-root css-hpgf8j"><div class="css-xoj6fk"><div class="css-v4ckcr"><button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-sd1usm" tabindex="0" type="button">Detalles de gol<span class="MuiTouchRipple-root css-w0pj6f"></span></button><button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ssizlv" tabindex="0" type="button">Certificado Digital<span class="MuiTouchRipple-root css-w0pj6f"></span></button><button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ssizlv" tabindex="0" type="button">Balón 3D<span class="MuiTouchRipple-root css-w0pj6f"></span></button></div><div class="css-j7qwjs"><div class="css-4ah17p"><div class="css-j7qwjs"><div class="MuiTableContainer-root MuiBox-root css-1p6ntod"><table class="MuiTable-root css-1ml4t79"><tbody class="MuiTableBody-root css-1xnox0e"><tr class="MuiTableRow-root css-1pjzcty"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-w77oow" scope="row" colspan="2"><div class="MuiBox-root css-1g360fb"><div class="MuiGrid-root MuiGrid-container MuiGrid-spacing-xs-2 css-nhpm5r"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-kxu0dz"><div class="MuiBox-root css-0"><div class="css-j7qwjs"><p class="MuiTypography-root MuiTypography-body1 css-qhp141">Marcador parcial: <strong>VLD  0 - 1 RAY</strong></p></div></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-kxu0dz"><div class="MuiBox-root css-0"><div class="css-146hfpo"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall css-1k33q06" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="TimerIcon"><path d="M9 1h6v2H9zm10.03 6.39 1.42-1.42c-.43-.51-.9-.99-1.41-1.41l-1.42 1.42C16.07 4.74 14.12 4 12 4c-4.97 0-9 4.03-9 9s4.02 9 9 9 9-4.03 9-9c0-2.12-.74-4.07-1.97-5.61zM13 14h-2V8h2v6z"></path></svg><h6 class="MuiTypography-root MuiTypography-h6 MuiTypography-alignRight css-xx879b">Minuto 65'</h6></div></div></div></div></div></td></tr><tr class="MuiTableRow-root css-1pjzcty"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-w77oow" scope="row" colspan="2"><div class="MuiBox-root css-0"><div class="css-15pb5dm"><p class="MuiTypography-root MuiTypography-body1 css-qhp141">Marcador final</p><div class="css-vb6e92"><div class="css-1abzdwk"><div class="css-15pb5dm"><img alt="Home club" height="50" loading="lazy" src="https://static.prod.golball.com/marketplace/img/laliga/assets/clubs/real_valladolid.png" width="50" style="pointer-events: none;"><h6 class="MuiTypography-root MuiTypography-h6 MuiTypography-alignCenter css-kvw2dr">VLD</h6></div><h4 class="MuiTypography-root MuiTypography-h4 css-1714nlb">0</h4></div><h5 class="MuiTypography-root MuiTypography-h5 css-1slxf3k">-</h5><div class="css-1abzdwk"><h4 class="MuiTypography-root MuiTypography-h4 css-sum8wr">1</h4><div class="css-15pb5dm"><img alt="Away club" height="50" loading="lazy" src="https://static.prod.golball.com/marketplace/img/laliga/assets/clubs/rayo_vallecano.png" width="50" style="pointer-events: none;"><h6 class="MuiTypography-root MuiTypography-h6 MuiTypography-alignCenter css-70wy27">RAY</h6></div></div></div></div></div></td></tr><tr class="MuiTableRow-root css-1pjzcty"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-w77oow" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">Estadio:</p></td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignRight MuiTableCell-sizeMedium css-90gs50" scope="row" colspan="1"><div class="MuiBox-root css-1sp1tx6"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall css-1k33q06" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="PlaceIcon"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"></path></svg><p class="MuiTypography-root MuiTypography-body1 css-g0xb6a">Estadio Municipal José Zorrilla</p></div></td></tr><tr class="MuiTableRow-root css-1pjzcty"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-w77oow" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">Liga:</p></td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignRight MuiTableCell-sizeMedium css-90gs50" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-ubqamf">LaLiga</p></td></tr><tr class="MuiTableRow-root css-1pjzcty"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-w77oow" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">Temporada:</p></td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignRight MuiTableCell-sizeMedium css-90gs50" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-ubqamf">LaLiga Santander 2022/2023</p></td></tr><tr class="MuiTableRow-root css-1pjzcty"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-w77oow" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">Jornada:</p></td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignRight MuiTableCell-sizeMedium css-90gs50" scope="row" colspan="1"><p class="MuiTypography-root MuiTypography-body1 css-ubqamf">17</p></td></tr></tbody></table></div></div></div><div class="css-1didtc4"><model-viewer ar-modes="webxr quick-look" poster="https://static.prod.golball.com/marketplace/img/laliga/assets/loaders/laliga.gif" shadow-intensity="0.5" src="https://static.prod.golball.com/web3/contracts/multimedia/a661b11d-51d0-4c90-b8f8-68dbce992a52/model_3d.gltf" ar="true" camera-controls="true" enable-pan="true" ar-status="not-presenting" style="width: 100%; height: 500px; border-bottom-left-radius: 17px; border-bottom-right-radius: 17px;"></model-viewer></div><div class="css-1didtc4"><model-viewer ar-modes="webxr quick-look" poster="https://static.prod.golball.com/marketplace/img/laliga/assets/loaders/laliga.gif" shadow-intensity="0.5" src="https://static.prod.golball.com/marketplace/products/multimedia/a661b11d-51d0-4c90-b8f8-68dbce992a52/3d_ball/Balon_ValladolidVsRayo.gltf" ar="true" camera-controls="true" enable-pan="true" ar-status="not-presenting" style="width: 100%; height: 500px; border-bottom-left-radius: 17px; border-bottom-right-radius: 17px;"></model-viewer></div></div></div></div></div><div class="css-wmf5bh"><div class="css-1maie98"><h6 class="MuiTypography-root MuiTypography-h6 css-qrvkyh">Eventos del balón</h6><div class="css-dzqr4n"><div class="css-1abzdwk"><p class="MuiTypography-root MuiTypography-body1 css-bazyyh">Real Valladolid</p><p class="MuiTypography-root MuiTypography-body1 css-bazyyh">-</p><p class="MuiTypography-root MuiTypography-body1 css-bazyyh">Rayo Vallecano</p></div></div><div class="MuiBox-root css-flplvj"><div class="MuiBox-root css-1w67j56"><div class="MuiBox-root css-2dbxiw"><img alt="BALL_SIGNATURE" height="32" loading="lazy" src="https://static.prod.golball.com/marketplace/img/commons/product/timeline/BALL_SIGNATURE.svg" width="32" style="background-color: rgb(184, 237, 250); padding: 2px; cursor: pointer; border-radius: 30%; pointer-events: none;"></div><div class="MuiBox-root css-3ij83j"><img alt="GOAL" height="32" loading="lazy" src="https://static.prod.golball.com/marketplace/img/commons/product/timeline/GOAL.svg" width="32" style="background-color: rgb(184, 237, 250); padding: 2px; cursor: pointer; border-radius: 30%; pointer-events: none;"></div><div class="MuiBox-root css-1kg8ast"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">0'</p></div><div class="MuiBox-root css-1ck34oz"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">15'</p></div><div class="MuiBox-root css-1tcfro2"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">30'</p></div><div class="MuiBox-root css-xt2t91"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">45'</p></div><div class="MuiBox-root css-6e0sd8"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">60'</p></div><div class="MuiBox-root css-1et002n"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">75'</p></div><div class="MuiBox-root css-zwf0t7"><p class="MuiTypography-root MuiTypography-body1 css-44kxrr">90'</p></div></div></div></div></div><div class="MuiBox-root css-8f57v9"><div class="css-1tc0vuc"><h5 class="MuiTypography-root MuiTypography-h5 MuiTypography-alignCenter css-7751hy">Beneficios de la compra de tu GOL-BALL</h5><div class="MuiBox-root css-dfzki1"><button class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium css-1g7lo1y" tabindex="0" type="button"><span class="MuiTouchRipple-root css-w0pj6f"></span></button><div class="css-1u8h5t9"><div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-xlympm" style="opacity: 1; transition: opacity 400ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"><img class="MuiCardMedia-root MuiCardMedia-media MuiCardMedia-img css-1sxok2x" src="https://static.prod.golball.com/marketplace/img/commons/product/carousel/selfie_product_carousel.png"><div class="MuiCardContent-root css-1yd3bfq"><h6 class="MuiTypography-root MuiTypography-h6 css-e09fwf">SELFIE CON TUS JUGADORES FAVORITOS</h6><p class="MuiTypography-root MuiTypography-body1 css-ekug88">Podrás enmarcar esos momentos de felicidad en tu galería.</p></div></div><div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-xlympm" style="opacity: 1; transition: opacity 400ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"><img class="MuiCardMedia-root MuiCardMedia-media MuiCardMedia-img css-1sxok2x" src="https://static.prod.golball.com/marketplace/img/commons/product/carousel/stickers_product_carousel.png"><div class="MuiCardContent-root css-1yd3bfq"><h6 class="MuiTypography-root MuiTypography-h6 css-e09fwf">STICKERS</h6><p class="MuiTypography-root MuiTypography-body1 css-ekug88">Podrás utilizar stickers de tus clubes y jugadores favoritos.</p></div></div><div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-xlympm" style="opacity: 1; transition: opacity 400ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"><img class="MuiCardMedia-root MuiCardMedia-media MuiCardMedia-img css-1sxok2x" src="https://static.prod.golball.com/marketplace/img/commons/home/cards/BE_football-ball_v2.png"><div class="MuiCardContent-root css-1yd3bfq"><h6 class="MuiTypography-root MuiTypography-h6 css-e09fwf">BALÓN FÍSICO</h6><p class="MuiTypography-root MuiTypography-body1 css-ekug88">Adquiere tu coleccionable digital y participa por el balón físico, el balón con el que se anotó el gol.</p></div></div></div><button class="MuiButtonBase-root MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth MuiButton-root MuiButton-text MuiButton-textPrimary MuiButton-sizeMedium MuiButton-textSizeMedium MuiButton-fullWidth css-vwb5ty" tabindex="0" type="button"><span class="MuiTouchRipple-root css-w0pj6f"></span></button></div></div></div><div class="css-ikzlcq"><div class="css-1kxe5pk" style="opacity: 1; transform: none; transition: opacity 1000ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, transform 666ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"><div class="MuiGrid-root MuiGrid-container css-1cn3yto"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-4 css-1px0r2z"><div class="css-j7qwjs"><img alt="Product" height="100%" loading="lazy" src="https://static.prod.golball.com/marketplace/img/commons/product/tactic/tactic_placeholder_v2.png" width="100%" style="pointer-events: none;"></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-8 css-1nm9uo2"><div class="css-1mk3kyd"><h5 class="MuiTypography-root MuiTypography-h5 css-16p0c6e">Táctica</h5><h6 class="MuiTypography-root MuiTypography-subtitle1 css-1o3dg09">Analiza la táctica de una jugada para examinar los movimientos de cada uno de los Goles que se anotaron en el encuentro.</h6><div class="css-1lxwves"><button class="MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium Mui-disabled MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-1qyrx6v" tabindex="-1" type="button" disabled=""><p class="MuiTypography-root MuiTypography-body2 css-1623bz">Compra tu coleccionable para acceder a esta sección</p><span class="MuiButton-endIcon MuiButton-iconSizeMedium css-pt151d"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ArrowCircleRightIcon"><path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12s4.48 10 10 10 10-4.48 10-10zm-10 1H8v-2h4V8l4 4-4 4v-3z"></path></svg></span></button></div></div></div></div></div><div class="css-1kxe5pk" style="opacity: 1; transform: none; transition: opacity 1000ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, transform 666ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"><div class="MuiGrid-root MuiGrid-container css-1cn3yto"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-4 css-1px0r2z"><div class="css-j7qwjs"><img alt="Product" height="100%" loading="lazy" src="https://static.prod.golball.com/marketplace/img/commons/home/cards/BE_football-ball.png" width="100%" style="pointer-events: none;"></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-lg-8 css-1nm9uo2"><div class="css-1mk3kyd"><h5 class="MuiTypography-root MuiTypography-h5 css-16p0c6e">Custodia</h5><h6 class="MuiTypography-root MuiTypography-subtitle1 css-1o3dg09">Fotos del proceso de custodia del Balón de Gol extraído del encuentro.</h6><div class="css-1lxwves"><button class="MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium Mui-disabled MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-1qyrx6v" tabindex="-1" type="button" disabled=""><p class="MuiTypography-root MuiTypography-body2 css-1623bz">Compra tu coleccionable para acceder a esta sección</p><span class="MuiButton-endIcon MuiButton-iconSizeMedium css-pt151d"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ArrowCircleRightIcon"><path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12s4.48 10 10 10 10-4.48 10-10zm-10 1H8v-2h4V8l4 4-4 4v-3z"></path></svg></span></button></div></div></div></div></div></div><div class="MuiBox-root css-1sf3xto"></div></div></div></div></div></div></div></div><footer data-testid="footer" class="css-138zkpx"><div class="css-1xhj18k"><a href="/"><img src="https://static.prod.golball.com/marketplace/img/golball/logos/golball-logo-white.png" class="css-10glao8"></a></div><div class="MuiGrid-root MuiGrid-container css-1mdz5kt"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-8 css-efwuvd"><div class="MuiGrid-root MuiGrid-container MuiGrid-spacing-xs-8 css-vvlcg7"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-6 MuiGrid-grid-sm-4 css-idrrft"><div class="css-l5c1s3"><p class="MuiTypography-root MuiTypography-body1 css-ubqamf">Market</p><div class="css-l5c1s3"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="/marketplace"><p class="MuiTypography-root MuiTypography-body1 css-11mdb8y">Últimos Gol-Ball</p></a></div></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-6 MuiGrid-grid-sm-4 css-idrrft"><div class="css-l5c1s3"><p class="MuiTypography-root MuiTypography-body1 css-ubqamf">Nosotros</p><div class="css-l5c1s3"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://golball.co/en/" target="_blank"><p class="MuiTypography-root MuiTypography-body1 css-11mdb8y">Gol-Ball</p></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://golball.co/en/lineup/" target="_blank"><p class="MuiTypography-root MuiTypography-body1 css-11mdb8y">Nuestro equipo</p></a></div></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-6 MuiGrid-grid-sm-4 css-idrrft"><div class="css-l5c1s3"><p class="MuiTypography-root MuiTypography-body1 css-ubqamf">Soporte</p><div class="css-l5c1s3"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="/contact" target="_blank"><p class="MuiTypography-root MuiTypography-body1 css-11mdb8y">Contáctanos</p></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="/faq" target="_blank"><p class="MuiTypography-root MuiTypography-body1 css-11mdb8y">Preguntas frecuentes</p></a></div></div></div></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-sm-6 MuiGrid-grid-md-4 css-1twzmnh"><div class="css-qn3dl5"><div class="css-l5c1s3"><p class="MuiTypography-root MuiTypography-body1 css-1kicbj9">Sé parte de la comunidad</p><div class="css-1t62lt9"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://www.instagram.com/golball_/" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="InstagramIcon"><path d="M7.8 2h8.4C19.4 2 22 4.6 22 7.8v8.4a5.8 5.8 0 0 1-5.8 5.8H7.8C4.6 22 2 19.4 2 16.2V7.8A5.8 5.8 0 0 1 7.8 2m-.2 2A3.6 3.6 0 0 0 4 7.6v8.8C4 18.39 5.61 20 7.6 20h8.8a3.6 3.6 0 0 0 3.6-3.6V7.6C20 5.61 18.39 4 16.4 4H7.6m9.65 1.5a1.25 1.25 0 0 1 1.25 1.25A1.25 1.25 0 0 1 17.25 8 1.25 1.25 0 0 1 16 6.75a1.25 1.25 0 0 1 1.25-1.25M12 7a5 5 0 0 1 5 5 5 5 0 0 1-5 5 5 5 0 0 1-5-5 5 5 0 0 1 5-5m0 2a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3z"></path></svg></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://www.facebook.com/thegolball/" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="FacebookIcon"><path d="M5 3h14a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2m13 2h-2.5A3.5 3.5 0 0 0 12 8.5V11h-2v3h2v7h3v-7h3v-3h-3V9a1 1 0 0 1 1-1h2V5z"></path></svg></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://twitter.com/golball_" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="TwitterIcon"><path d="M22.46 6c-.77.35-1.6.58-2.46.69.88-.53 1.56-1.37 1.88-2.38-.83.5-1.75.85-2.72 1.05C18.37 4.5 17.26 4 16 4c-2.35 0-4.27 1.92-4.27 4.29 0 .34.04.67.11.98C8.28 9.09 5.11 7.38 3 4.79c-.37.63-.58 1.37-.58 2.15 0 1.49.75 2.81 1.91 3.56-.71 0-1.37-.2-1.95-.5v.03c0 2.08 1.48 3.82 3.44 4.21a4.22 4.22 0 0 1-1.93.07 4.28 4.28 0 0 0 4 2.98 8.521 8.521 0 0 1-5.33 1.84c-.34 0-.68-.02-1.02-.06C3.44 20.29 5.7 21 8.12 21 16 21 20.33 14.46 20.33 8.79c0-.19 0-.37-.01-.56.84-.6 1.56-1.36 2.14-2.23z"></path></svg></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://www.tiktok.com/@golball_" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1okqa6k" focusable="false" aria-hidden="true" viewBox="0 0 24 24"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>TikTok</title><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.35-4.2-.97-.57-.26-1.1-.59-1.62-.93-.01 2.92.01 5.84-.02 8.75-.08 1.4-.54 2.79-1.35 3.94-1.31 1.92-3.58 3.17-5.91 3.21-1.43.08-2.86-.31-4.08-1.03-2.02-1.19-3.44-3.37-3.65-5.71-.02-.5-.03-1-.01-1.49.18-1.9 1.12-3.72 2.58-4.96 1.66-1.44 3.98-2.13 6.15-1.72.02 1.48-.04 2.96-.04 4.44-.99-.32-2.15-.23-3.02.37-.63.41-1.11 1.04-1.36 1.75-.21.51-.15 1.07-.14 1.61.24 1.64 1.82 3.02 3.5 2.87 1.12-.01 2.19-.66 2.77-1.61.19-.33.4-.67.41-1.06.1-1.79.06-3.57.07-5.36.01-4.03-.01-8.05.02-12.07z"></path></svg></svg></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://www.twitch.tv/golball_" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1okqa6k" focusable="false" aria-hidden="true" viewBox="0 0 24 24"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Twitch</title><path d="M11.571 4.714h1.715v5.143H11.57zm4.715 0H18v5.143h-1.714zM6 0L1.714 4.286v15.428h5.143V24l4.286-4.286h3.428L22.286 12V0zm14.571 11.143l-3.428 3.428h-3.429l-3 3v-3H6.857V1.714h13.714Z"></path></svg></svg></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://linkedin.com/company/golball" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="LinkedInIcon"><path d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14m-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93h2.79M6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37h2.77z"></path></svg></a><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://t.me/GolBall" target="_blank"><svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="TelegramIcon"><path d="M9.78 18.65l.28-4.23 7.68-6.92c.34-.31-.07-.46-.52-.19L7.74 13.3 3.64 12c-.88-.25-.89-.86.2-1.3l15.97-6.16c.73-.33 1.43.18 1.15 1.3l-2.72 12.81c-.19.91-.74 1.13-1.5.71L12.6 16.3l-1.99 1.93c-.23.23-.42.42-.83.42z"></path></svg></a></div></div></div></div><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-15j76c0"><div class="css-1t62lt9"><p class="MuiTypography-root MuiTypography-body2 css-mj2ued"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="/">© 2023 Gol-Ball All Rights Reserved</a></p><p class="MuiTypography-root MuiTypography-body2 css-133bdno">|</p><div class="css-1t62lt9"><p class="MuiTypography-root MuiTypography-body2 css-133bdno"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://static.prod.golball.com/marketplace/docs/tyc_es.pdf" target="_blank">Términos y condiciones</a></p><p class="MuiTypography-root MuiTypography-body2 css-133bdno">|</p><p class="MuiTypography-root MuiTypography-body2 css-133bdno"><a class="MuiTypography-root MuiTypography-inherit MuiLink-root MuiLink-underlineHover css-1n4g9ka" href="https://static.prod.golball.com/marketplace/docs/privacy_policy_es.pdf" target="_blank">Políticas y Privacidad</a></p></div></div></div></div></footer></div></div><script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","838483467205186");fbq("track","PageView");</script><noscript> <img height="1" width="1" src="https://www.facebook.com/tr?id=838483467205186&amp;ev=PageView&amp;noscript=1"></noscript>
<script type="text/javascript" id="">!function(d,e,f,a,b,c){d.twq||(a=d.twq=function(){a.exe?a.exe.apply(a,arguments):a.queue.push(arguments)},a.version="1.1",a.queue=[],b=e.createElement(f),b.async=!0,b.src="https://static.ads-twitter.com/uwt.js",c=e.getElementsByTagName(f)[0],c.parentNode.insertBefore(b,c))}(window,document,"script");twq("config","odb8i");</script>
<script type="text/javascript" id="">!function(d,g,e){d.TiktokAnalyticsObject=e;var a=d[e]=d[e]||[];a.methods="page track identify instances debug on off once ready alias group enableCookie disableCookie".split(" ");a.setAndDefer=function(b,c){b[c]=function(){b.push([c].concat(Array.prototype.slice.call(arguments,0)))}};for(d=0;d<a.methods.length;d++)a.setAndDefer(a,a.methods[d]);a.instance=function(b){b=a._i[b]||[];for(var c=0;c<a.methods.length;c++)a.setAndDefer(b,a.methods[c]);return b};a.load=function(b,c){var f="https://analytics.tiktok.com/i18n/pixel/events.js";
a._i=a._i||{};a._i[b]=[];a._i[b]._u=f;a._t=a._t||{};a._t[b]=+new Date;a._o=a._o||{};a._o[b]=c||{};c=document.createElement("script");c.type="text/javascript";c.async=!0;c.src=f+"?sdkid\x3d"+b+"\x26lib\x3d"+e;b=document.getElementsByTagName("script")[0];b.parentNode.insertBefore(c,b)};a.load("CESALAJC77U87C9MP4T0");a.page()}(window,document,"ttq");</script><img src="https://t.co/1/i/adsct?bci=4&amp;eci=3&amp;event=%7B%7D&amp;event_id=dc2981e9-b7aa-4374-8ac2-0493465d4e9d&amp;integration=advertiser&amp;p_id=Twitter&amp;p_user_id=0&amp;pl_id=6a004781-0780-4661-9cd1-e1ca8457a075&amp;tw_document_href=https%3A%2F%2Fgolball.com%2Fproduct%2Fa661b11d-51d0-4c90-b8f8-68dbce992a52&amp;tw_iframe_status=0&amp;txn_id=odb8i&amp;type=javascript&amp;version=2.3.29" height="1" width="1" style="display: none;"><img src="https://analytics.twitter.com/1/i/adsct?bci=4&amp;eci=3&amp;event=%7B%7D&amp;event_id=dc2981e9-b7aa-4374-8ac2-0493465d4e9d&amp;integration=advertiser&amp;p_id=Twitter&amp;p_user_id=0&amp;pl_id=6a004781-0780-4661-9cd1-e1ca8457a075&amp;tw_document_href=https%3A%2F%2Fgolball.com%2Fproduct%2Fa661b11d-51d0-4c90-b8f8-68dbce992a52&amp;tw_iframe_status=0&amp;txn_id=odb8i&amp;type=javascript&amp;version=2.3.29" height="1" width="1" style="display: none;">
<script>
window[window.TiktokAnalyticsObject].instance("CESALAJC77U87C9MP4T0").track("ViewContent",{"pixelMethod":"standard"});
</script>
<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-7RVH0HMNVE"></script></body><iframe id="__JSBridgeIframe_1.0__" title="jsbridge___JSBridgeIframe_1.0__" style="display: none;"></iframe><iframe id="__JSBridgeIframe_SetResult_1.0__" title="jsbridge___JSBridgeIframe_SetResult_1.0__" style="display: none;"></iframe><iframe id="__JSBridgeIframe__" title="jsbridge___JSBridgeIframe__" style="display: none;"></iframe><iframe id="__JSBridgeIframe_SetResult__" title="jsbridge___JSBridgeIframe_SetResult__" style="display: none;"></iframe></html>


''';

// const String kNavigationExamplePage = '''
// <!DOCTYPE html><html>
// <head><title>Navigation Delegate Example</title></head>
// <body>
// <p>
// The navigation delegate is set to block navigation to the youtube website.
// </p>
// <ul>
// <ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
// <ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
// </ul>
// </body>
// </html>
// ''';

const String kLocalExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>

<h1>Local demo page</h1>
<p>
  This is an example page used to demonstrate how to load a local file or HTML
  string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
  webview</a> plugin.
</p>

</body>
</html>
''';

const String kTransparentBackgroundPage = '''
  <!DOCTYPE html>
  <html>
  <head>
    <title>Transparent background test</title>
  </head>
  <style type="text/css">
    body { background: transparent; margin: 0; padding: 0; }
    #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
    #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
    p { text-align: center; }
  </style>
  <body>
    <div id="container">
      <p>Transparent background test</p>
      <div id="shape"></div>
    </div>
  </body>
  </html>
''';

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        // title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(webViewController: _controller),
          // SampleMenu(webViewController: _controller),
        ],
      ),
      body: WebViewWidget(controller: _controller),
      floatingActionButton: favoriteButton(),
    );
  }

  Widget favoriteButton() {
    return FloatingActionButton(
      onPressed: () async {
        final String? url = await _controller.currentUrl();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Favorited $url')),
        );
      },
      child: const Icon(Icons.favorite),
    );
  }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}

class SampleMenu extends StatelessWidget {
  SampleMenu({Key? key, required this.webViewController}) : super(key: key);

  final WebViewController webViewController;
  late final WebViewCookieManager cookieManager = WebViewCookieManager();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOptions>(
      key: const ValueKey<String>('ShowPopupMenu'),
      onSelected: (MenuOptions value) {
        switch (value) {
          case MenuOptions.showUserAgent:
            _onShowUserAgent();
            break;
          case MenuOptions.listCookies:
            _onListCookies(context);
            break;
          case MenuOptions.clearCookies:
            _onClearCookies(context);
            break;
          case MenuOptions.addToCache:
            _onAddToCache(context);
            break;
          case MenuOptions.listCache:
            _onListCache();
            break;
          case MenuOptions.clearCache:
            _onClearCache(context);
            break;
          case MenuOptions.navigationDelegate:
            _onNavigationDelegateExample();
            break;
          case MenuOptions.doPostRequest:
            _onDoPostRequest();
            break;
          case MenuOptions.loadLocalFile:
            _onLoadLocalFileExample();
            break;
          case MenuOptions.loadFlutterAsset:
            _onLoadFlutterAssetExample();
            break;
          case MenuOptions.loadHtmlString:
            _onLoadHtmlStringExample();
            break;
          case MenuOptions.transparentBackground:
            _onTransparentBackground();
            break;
          case MenuOptions.setCookie:
            _onSetCookie();
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.showUserAgent,
          child: Text('Show user agent'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.listCookies,
          child: Text('List cookies'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.clearCookies,
          child: Text('Clear cookies'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.addToCache,
          child: Text('Add to cache'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.listCache,
          child: Text('List cache'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.clearCache,
          child: Text('Clear cache'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.navigationDelegate,
          child: Text('Navigation Delegate example'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.doPostRequest,
          child: Text('Post Request'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.loadHtmlString,
          child: Text('Load HTML string'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.loadLocalFile,
          child: Text('Load local file'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.loadFlutterAsset,
          child: Text('Load Flutter Asset'),
        ),
        const PopupMenuItem<MenuOptions>(
          key: ValueKey<String>('ShowTransparentBackgroundExample'),
          value: MenuOptions.transparentBackground,
          child: Text('Transparent background example'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.setCookie,
          child: Text('Set cookie'),
        ),
      ],
    );
  }

  Future<void> _onShowUserAgent() {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    return webViewController.runJavaScript(
      'Toaster.postMessage("User Agent: " + navigator.userAgent);',
    );
  }

  Future<void> _onListCookies(BuildContext context) async {
    final String cookies = await webViewController
        .runJavaScriptReturningResult('document.cookie') as String;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Cookies:'),
          _getCookieList(cookies),
        ],
      ),
    ));
  }

  Future<void> _onAddToCache(BuildContext context) async {
    await webViewController.runJavaScript(
      'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";',
    );
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added a test entry to cache.'),
    ));
  }

  Future<void> _onListCache() {
    return webViewController.runJavaScript('caches.keys()'
        // ignore: missing_whitespace_between_adjacent_strings
        '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
        '.then((caches) => Toaster.postMessage(caches))');
  }

  Future<void> _onClearCache(BuildContext context) async {
    await webViewController.clearCache();
    await webViewController.clearLocalStorage();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Cache cleared.'),
    ));
  }

  Future<void> _onClearCookies(BuildContext context) async {
    final bool hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There are no cookies.';
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<void> _onNavigationDelegateExample() {
    final String contentBase64 = base64Encode(
      const Utf8Encoder().convert(kNavigationExamplePage),
    );
    return webViewController.loadRequest(
      Uri.parse('data:text/html;base64,$contentBase64'),
    );
  }

  Future<void> _onSetCookie() async {
    await cookieManager.setCookie(
      const WebViewCookie(
        name: 'foo',
        value: 'bar',
        domain: 'httpbin.org',
        path: '/anything',
      ),
    );
    await webViewController.loadRequest(Uri.parse(
      'https://httpbin.org/anything',
    ));
  }

  Future<void> _onDoPostRequest() {
    return webViewController.loadRequest(
      Uri.parse('https://httpbin.org/post'),
      method: LoadRequestMethod.post,
      headers: <String, String>{'foo': 'bar', 'Content-Type': 'text/plain'},
      body: Uint8List.fromList('Test Body'.codeUnits),
    );
  }

  Future<void> _onLoadLocalFileExample() async {
    final String pathToIndex = await _prepareLocalFile();
    await webViewController.loadFile(pathToIndex);
  }

  Future<void> _onLoadFlutterAssetExample() {
    return webViewController.loadFlutterAsset('assets/www/index.html');
  }

  Future<void> _onLoadHtmlStringExample() {
    return webViewController.loadHtmlString(kLocalExamplePage);
  }

  Future<void> _onTransparentBackground() {
    return webViewController.loadHtmlString(kTransparentBackgroundPage);
  }

  Widget _getCookieList(String cookies) {
    if (cookies == null || cookies == '""') {
      return Container();
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets =
        cookieList.map((String cookie) => Text(cookie));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: cookieWidgets.toList(),
    );
  }

  static Future<String> _prepareLocalFile() async {
    final String tmpDir = (await getTemporaryDirectory()).path;
    final File indexFile = File(
        <String>{tmpDir, 'www', 'index.html'}.join(Platform.pathSeparator));

    await indexFile.create(recursive: true);
    await indexFile.writeAsString(kLocalExamplePage);

    return indexFile.path;
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({Key? key, required this.webViewController})
      : super(key: key);
  // const NavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No back history item')),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            if (await webViewController.canGoForward()) {
              await webViewController.goForward();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No forward history item')),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => webViewController.reload(),
        ),
      ],
    );
  }
}
