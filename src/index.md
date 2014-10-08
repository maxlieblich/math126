---
header-includes: |
    <script src="js/gooan.js" type="text/javascript"></script>
    <script src="js/scale.fix.js" type="text/javascript"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.flot.min.js" type="text/javascript"></script>
    <script src="js/downloadepub.js" type="text/javascript"></script>
    <script src="js/gotorepo.js" type="text/javascript"></script>
    <script src="js/loader.js" type="text/javascript"></script>
    <script src="js/three.min.js" type="text/javascript"></script>
    <script src="js/ArrowHelperFixed.js" type="text/javascript"></script>
    <script src="js/marchingcubesraw.js" type="text/javascript"></script>
    <script src="js/marchingtetrahedraraw.js" type="text/javascript"></script>
    <script src="js/surfacenetsraw.js" type="text/javascript"></script>
    <script src="js/MathScene.js" type="text/javascript"></script>
    <script src="js/MathModel.js" type="text/javascript"></script>
    <script src="js/TrackballControls.js" type="text/javascript"></script>
    <script src="js/OrbitControls.js" type="text/javascript"></script>
    <script src="js/Detector.js" type="text/javascript"></script>
    <script src="js/SubdivisionModifier.js" type="text/javascript"></script>
    <script src="js/dat.gui.min.js" type="text/javascript"></script>
    <script type="text/x-mathjax-config">
    //<![CDATA[
    MathJax.Hub.Config({
        jax: [
            "input/TeX",
            "output/SVG",
        ],
        extensions: [
            "tex2jax.js",
            "MathEvents.js",
        ],
        TeX: {
            extensions: [
                "AMSmath.js",
                "AMSsymbols.js",
            ]
        },
        MathMenu: {
            showRenderer: false
        },
        menuSettings: {
            zoom: "Click"
        },
        messageStyle: "none",
    });
    //]]>
    </script>
    <script src="MathJax/MathJax.js" type="text/javascript"></script>
css: stylesheets/styles.css
title: Math 126
...

<div class="wrapper">
<header>

# Math126

Welcome to the new online Math 126. Choose a lecture and start learning.
Fork us on GitHub, add your own thoughts, and send us a pull request!

- <a class="buttons download" onclick="DownloadEpub();">Download ebook</a>
- <a class="buttons github" onclick="GotoRepo();">View On GitHub</a>
- <a class="buttons menu" href="#welcome.html">Contents</a>

This project is maintained by
[maxlieblich](https://github.com/maxlieblich) and
[ohanar](https://github.com/ohanar)

</header>

<section>
<div id="content"></div>
</section>

<footer>
Hosted on [GitHub Pages](http://pages.github.com) using the Dinky theme
</footer>
</div>

<!--[if !IE]><script>fixScale(document);</script><![endif]-->

