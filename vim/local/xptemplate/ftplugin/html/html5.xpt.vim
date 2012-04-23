XPTemplate priority=personal
XPTinclude
    \ html/html
"       \ _common/common

XPT html5 " <html><head>..<head><body>...
<!DOCTYPE html>
<html>
    `:head:^
    <body>
        `cursor^
    </body>
</html>


XPT head " <head>..</head>
<head>
    `:contenttype:^
    `:title:^
    `:link:^
</head>
