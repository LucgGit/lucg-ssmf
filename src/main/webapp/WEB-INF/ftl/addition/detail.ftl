<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
    * { margin: 0; padding: 0; }

    #scrollPage {
      overflow: hidden;
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
    }
    /* picture */
    #scrollPage .list {
      z-index: 1;
    }
    #scrollPage .list,
    #scrollPage .list li {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }
    #scrollPage .list li {
      background-size: cover; 
      transform: translate3d(0, 0, 0);
      -webkit-transform: translate3d(0, 0, 0);
    }
    #scrollPage .list li:nth-child(1) {
      background-image: url(${baseDir}/static/img/I002/bg_1.jpg);
      background-repeat: no-repeat;
    }
    #scrollPage .list li:nth-child(2) {}
    #scrollPage .list li:nth-child(3) {
      background-image: url(${baseDir}/static/img/I002/bg_3.jpg);
      background-repeat: no-repeat;
    }
    #scrollPage .list li:nth-child(4) {
      background-image: url(${baseDir}/static/img/I002/bg_4.jpg);
      background-repeat: no-repeat;
    }
    /* btn */
    #scrollPage .btn {
      position: absolute;
      z-index: 2;
      right: 20px;
      top: 40%;
    }
    #scrollPage .btn span {
      display: block;
      width: 2px;
      height: 40px;
      margin: 10px 0;
      background-color: #fff;
    }
    #scrollPage .btn span.cur {
      background-color: #0099ff;
    }
    /* 视觉差 */
    #overMove {
      overflow: hidden;
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
    }
    #overMove div {
      position: relative;
      left: 0;
      top: 0;
      width: 110%;
      height: 110vh;
    }
    #overMove div:nth-child(2) { position: absolute; }
    #overMove div:nth-child(3) { position: absolute; }
    #overMove div i {
      position: absolute;
      width: 100%;
      height: 100%;
      left: -5%;
      top: -5%;
      background-size: cover;
      background-repeat: no-repeat;
    }
    #overMove div:nth-child(1) i {
      background-image: url(${baseDir}/static/img/I002/bgpart_1.png);
      background-position: center;
    }
    #overMove div:nth-child(2) i {
      
    }
    #overMove div:nth-child(3) i {
      background-image: url(${baseDir}/static/img/I002/bgpart_3.png);
    }
  </style>
</head>
<body>

  <div id="scrollPage">
    <ul class="list">
      <li></li>
      <li>
        <div id="overMove">
          <div data-scale="0.3"><i></i></div>
          <div data-scale="0.5"><i></i></div>
          <div data-scale="0.7"><i></i></div>
        </div>
      </li>
      <li></li>
      <li></li>
    </ul>
    <div class="btn">
      <span class="cur"></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
  <script src="${baseDir}/static/js/effect/startMove.js?v=${version}"></script>
</body>
</html>