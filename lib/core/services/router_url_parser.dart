class RouterUrlParser {
  Uri parse(String url) {
    if (!url.startsWith('http')) {
      url = 'http://$url';
    }

    return Uri.parse(url);
  }
}
