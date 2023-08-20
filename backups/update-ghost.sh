#!/bin/bash

set -e

echo "Update docker containers.."

sudo docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e WATCHTOWER_NOTIFICATION_REPORT="true" \
    -e WATCHTOWER_NOTIFICATION_URL="$1" \
    -e WATCHTOWER_NOTIFICATION_TEMPLATE="
    {{- if .Report -}}
      {{- with .Report -}}
        {{- if ( or .Updated .Failed ) -}}
    {{len .Scanned}} Scanned, {{len .Updated}} Updated, {{len .Failed}} Failed
          {{- range .Updated}}
    - {{.Name}} ({{.ImageName}}): {{.CurrentImageID.ShortID}} updated to {{.LatestImageID.ShortID}}
          {{- end -}}
          {{- range .Fresh}}
    - {{.Name}} ({{.ImageName}}): {{.State}}
          {{- end -}}
          {{- range .Skipped}}
    - {{.Name}} ({{.ImageName}}): {{.State}}: {{.Error}}
          {{- end -}}
          {{- range .Failed}}
    - {{.Name}} ({{.ImageName}}): {{.State}}: {{.Error}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}    
    " \
    containrrr/watchtower \
    --run-once --include-stopped --cleanup

echo "Cleaning up docker system"

sudo docker system prune -f

echo "Done!"
