{{- $app := .Release.Name -}}
{{- $component := "web" -}}
{{- $name := printf "%s-%s" $app $component -}}