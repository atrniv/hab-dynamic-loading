# shellcheck disable=2154
pkg_name="hab-dynamic-loading"
pkg_origin=core
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="Hab Auto Build is a tool that is designed to assist package managers to speed up \
the development, building and testing of large number of inter-related plan files."
pkg_license=('Apache-2.0')
# The result is a portable, static binary in a zero-dependency package.
pkg_deps=(
    core/libarchive
    core/node
    core/bash
)

pkg_bin_dirs=(bin)

do_build() {
    npm install
}

do_install() {
    local app_path="$pkg_prefix/app"
    mkdir -p $app_path

    cp -R \
        node_modules \
        package.json \
        index.js \
        $app_path
    cat <<-EOF > "$pkg_prefix/bin/app"
#!/bin/sh
node $pkg_prefix/app/index.js
EOF
    chmod +x "$pkg_prefix/bin/app"
}

do_strip() {
    return 0
}