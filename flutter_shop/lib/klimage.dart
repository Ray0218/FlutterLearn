String kltransImages(String url) {
  if (url.startsWith('http')) {
     return url.replaceFirst('http', 'https');
  } else {
    return url;
  }
}
