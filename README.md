# life_website

A new Flutter project.  
[Web UI kit](https://www.sanga-ryokan.com)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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
