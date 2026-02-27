# Source - https://stackoverflow.com/a/79210232
# Posted by fxnn
# Retrieved 2026-02-27, License - CC BY-SA 4.0

first_namespace=""

for namespaceWithType in $(kubectl get ns -o name); do
    namespace="${namespaceWithType#*/}" # remove `namespace/` prefix
    if kubectl get -n "${namespace}" pods -o name >/dev/null 2>/dev/null; then
        echo "${namespace}"
        if [ -z "${first_namespace}" ]; then
            first_namespace="${namespace}"
        fi
    fi
done

if [ -n "${first_namespace}" ]; then
    alias_def="alias kubectl='kubectl -n ${first_namespace}'"

    # Persist alias in shell config file
    shell_rc="${HOME}/.bashrc"

    tmp_rc="${shell_rc}.tmp"
    grep -v "^alias kubectl=" "${shell_rc}" >"${tmp_rc}" 2>/dev/null || true
    echo "${alias_def}" >>"${tmp_rc}"
    mv "${tmp_rc}" "${shell_rc}"

    echo "Alias creado: ${alias_def}"
    echo "Recarga tu shell o ejecuta: source ${shell_rc}"
else
    echo "No se encontró ningún namespace válido." >&2
fi
