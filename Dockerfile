FROM ocaml/opam:debian-11-ocaml-4.12 AS builder

COPY dune-project lethal_company.opam ./
RUN opam install . --deps-only

COPY bin lib ./
RUN opam exec -- dune build bin/lc.exe
RUN mv _build/default/bin/lc.exe lc


FROM debian:11-slim AS runner

ARG TOKEN
ARG VERSION

COPY --from=builder lc lc
COPY vendored/tcli tcli
COPY static output

RUN \
    lc -version-str "${VERSION}" > output/thunderstore.toml \
    && cd output \
    && ../tcli publish --token "${TOKEN}"
