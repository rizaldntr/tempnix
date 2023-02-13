{config}:
with config.colors.base; ''
  /*
  ┌─┐┬┌┬┐┌─┐┬  ┌─┐
  └─┐││││├─┘│  ├┤
  └─┘┴┴ ┴┴  ┴─┘└─┘
  ┌─┐┌─┐─┐ ┬
  ├┤ │ │┌┴┬┘
  └  └─┘┴ └─
  by Miguel Avila
  */
  :root {
    --sfwindow: ${backgroundDarker};
    --sfsecondary: ${background};
    scrollbar-width: none !important;
  }
  @-moz-document url(about:privatebrowsing) {
    :root {
      scrollbar-width: none !important;
    }
  }
  /* background image for newtab, home, blank, privatebrowsing */
  @-moz-document url(about:home), url(about:newtab), url(about:blank) {
    body::before {
      content: "" !important;
      z-index: -1 !important;
      position: fixed !important;
      top: 0 !important;
      left: 0 !important;
      background-image: none !important;
      background-color: var(--sfwindow) !important;
      width: 100vw !important;
      height: 100vh !important;
      opacity: 0;
      animation: fadeInAnimation ease-in 0.7s !important;
      animation-iteration-count: 1 !important;
      animation-fill-mode: both !important;
      transition-timing-function: linear;
    }

    @keyframes fadeInAnimation {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }
  }

  @-moz-document url(about:home), url(about:newtab), url(about:blank), domain("www.google.com") {
    body {
      background-image: none !important;
      background-color: var(--sfwindow) !important;
    }
  }
''
