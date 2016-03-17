#!/usr/bin/env python3
import json
import urllib.request
import time
import sys

patterns = {
    'i3': ['i3'],
    'bspwm': ['bspwm'],
    'awesome': ['awesome'],
    'hlwm': ['hlwm', 'herbstluftwm', 'herbstlufwm'],
    'gnome': ['gnome'],
    'osx': ['osx', 'os x'],
    'unity': ['unity', 'ubuntu'],
    'lxde': ['lxde'],
    'xfce': ['xfce'],
    'mate': ['mate'],
    '2bwm': ['2bwm'],
    'kde': ['kde'],
    'spectrwm': ['spectrwm'],
    'openbox': ['openbox'],
    'xmonad': ['xmonad'],
    'dwm': ['dwm'],
    'cinnamon': ['cinnamon'],
    'wmutils': ['wmutils', 'wm utils'],
    'fluxbox': ['fluxbox']
}

stats = {
    'other': 0
}

def patternize(pattern, strict_mode):
    if strict_mode:
        return '[%s]' % pattern
    return pattern

def analyze(url, strict_mode):
    request = urllib.request.Request(url = url, headers = {
        'User-Agent': 'python:temp:v0.0.1 (by /u/airblader)'
    })
    response = urllib.request.urlopen(request)
    data = json.loads(response.read().decode('utf-8'))

    for thread in data['data']['children']:
        if not thread['data']['link_flair_text'] == 'Screenshot':
            continue

        title = thread['data']['title'].lower()
        matched_wm = False
        for wm in patterns:
            matched_pattern = False
            for pattern in patterns[wm]:
                if patternize(pattern, strict_mode) in title:
                    stats[wm] += 1
                    matched_pattern = True
                    matched_wm = True
                    break
            if matched_pattern:
                break

        if not matched_wm:
            print('Uncategorized: ' + title)
            stats['other'] += 1

    return data['data']['after']

def get_url(ii, after):
    if not after:
        return 'http://www.reddit.com/r/unixporn/new.json?limit=100'
    return 'http://www.reddit.com/r/unixporn/new.json?limit=100&count=' + str(ii * 100) + '&after=' + after

if __name__ == '__main__':
    strict_mode = False

    for wm in patterns:
        stats[wm] = 0

    after = None
    for ii in range(10):
        after = analyze(get_url(ii, after), strict_mode)
        time.sleep(5)

    print(json.dumps(stats))
