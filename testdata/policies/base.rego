package main


deny[msg] {
  input.kind = "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot = true
  msg = "Containers must not run as root"
}

deny[msg] {
  input.kind = "Deployment"
  not input.spec.selector.matchLabels.app
  not input.spec.selector.matchLabels.release
  msg = "Containers must provide app/release labls for pod selectors"
}