# firefox useful stuff

about:config (type in url panel)

## disable extensions auto-updates
```
extensions.update.enabled
```
to false

```
services.sync.prefs.sync.extensions.update.enabled
```
to false


## allow unsigned extensions
```
xpinstall.signatures.required
```
to false


## badbrowser.php fix
```
accessibility.blockautorefresh
```
to true


## disable webrtc (for privacy in some cases)
```
media.peerconnection.enabled
```
to false
