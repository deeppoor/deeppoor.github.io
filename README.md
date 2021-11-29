# life_website

通过 Flutter Web 搭建的网站，展示地址是 [ocnyang.github.io/life_website](http://ocnyang.com/life_website/#/)  
第一次加载速度较慢，请耐心等待，长时间不显示，尝试点页面刷新。

A Flutter Web project.  
**Web Address：** [ocnyang.github.io/life_website](http://ocnyang.com/life_website/#/) 

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

There is ```<base href=''/>``` tag in your ```index.html```. Change it to the base path of your github repo. In this case this would be ```<base href="/life_website/"/>```. If you don't have it you can add it inside the ```<head>``` tag.
