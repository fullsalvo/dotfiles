// Gets icon font
window.Fonticons || (window.Fonticons = {}), function(e, n) {
    function t(e, t) {
        var o, i = "IE", s = n.createElement("B"), c = n.documentElement;
        return e && (i += " " + e, t && (i = t + " " + i)), s.innerHTML = "<!--[if " + i + ']><b id="fitest"></b><![endif]-->', c.appendChild(s), o=!!n.getElementById("fitest"), c.removeChild(s), o
    }
    function o() {
        for (var e = [/.*/], o = n.location.hostname, i = 0; i < e.length; i++)
            if (e[i].test(o)) {
                var s = n.createElement("link"), c = t(8, "lte") ? "7359c356-sd": "7359c356";
                s.href = "https://fonticons-free-fonticons.netdna-ssl.com/kits/7359c356/" + c + ".css", s.media = "all", s.rel = "stylesheet", n.getElementsByTagName("head")[0].appendChild(s);
                break
            }
    }
    e.Fonticons.load = o
}(this, document), window.Fonticons.load();