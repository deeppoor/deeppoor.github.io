# life_website

通过 Flutter Web 搭建、并借助 GitHub 自动构建发布的网站，展示地址是 [life_website](http://ocnyang.com/life_website/#/)  
第一次加载速度较慢，请耐心等待，长时间不显示，尝试点页面刷新。

A Flutter Web project.  
**Web Demo Address：** [ocnyang.github.io/life_website](http://ocnyang.com/life_website/#/) 

> [Web UI kit Address](https://www.sanga-ryokan.com)


## Bug Logs

### 1. When run 'Flutter web'，the page is blank

**Why**  
Flutter HTML Renderer:HTML、Canvaskit
```
flutter run -d chrome --web-renderer html
 
flutter run -d chrome --web-renderer canvaskit
```

**The solution**  
change  
```flutter build web --release```  
to  
```flutter build web --release --web-renderer html```

### 2. 404 Failed to load resource Deploying Flutter Web App to GitHub Pages

[https://stackoverflow.com/questions/65689346/404-failed-to-load-resource-deploying-flutter-web-app-to-github-pages](https://stackoverflow.com/questions/65689346/404-failed-to-load-resource-deploying-flutter-web-app-to-github-pages)

**The solution**  

There is ```<base href=''/>``` tag in your ```index.html```. Change it to the base path of your github repo. In this case this would be ```<base href="/repo_name/"/>```. If you don't have it you can add it inside the ```<head>``` tag.

> or 
> flutter build web --release --base-href="/repo_name/"

### 3. Loading View

add loading-view to index.html

```html
<html>

<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <script defer src="index.dart.js" type="application/javascript"></script>

  <style>
    .loading {
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0;
      position: absolute;
      top: 50%;
      left: 50%;
      -ms-transform: translate(-50%, -50%);
      transform: translate(-50%, -50%);
    }
    
    .loader {
      border: 16px solid #f3f3f3;
      border-radius: 50%;
      border-top: 16px solid blue;
      border-right: 16px solid green;
      border-bottom: 16px solid red;
      border-left: 16px solid pink;
      width: 120px;
      height: 120px;
      -webkit-animation: spin 2s linear infinite;
      animation: spin 2s linear infinite;
    }
    
    @-webkit-keyframes spin {
      0% {
        -webkit-transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
      }
    }
    
    @keyframes spin {
      0% {
        transform: rotate(0deg);
      }
      100% {
        transform: rotate(360deg);
      }
    }
  </style>
</head>

<body>
  <div class="loading">
    <div class="loader"></div>
  </div>

  <script src="main.dart.js" type="application/javascript"></script>
</body>

</html>
```

