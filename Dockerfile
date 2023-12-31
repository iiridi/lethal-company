FROM ocaml/opam:debian-11-ocaml-4.12 AS builder

COPY dune-project lethal_company.opam ./
RUN opam install . --deps-only

COPY bin bin
COPY lib lib
RUN opam exec -- dune build bin/lc.exe


FROM debian:11-slim AS runner

COPY --from=builder  /home/opam/_build/default/bin/lc.exe lc
ENTRYPOINT [ "./lc" ]
