# Source - https://stackoverflow.com/a/79210232
# Posted by fxnn
# Retrieved 2026-02-27, License - CC BY-SA 4.0

for namespaceWithType in $(kubectl get ns -o name); do
    namespace="${namespaceWithType#*/}" # remove `namespace/` prefix
    kubectl get -n "${namespace}" pods -o name >/dev/null 2>/dev/null &&
        echo "${namespace}"
done
