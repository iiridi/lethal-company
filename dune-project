(lang dune 3.12)

(name lethal_company)

(generate_opam_files true)

(maintainers "iiridi <ilyfr@iridi.cc>")

(authors "iiridi <ilyfr@iridi.cc>")

(homepage "https://github.com/iiridi/lethal-company")

(bug_reports "https://github.com/iiridi/lethal-company/issues")

(package
 (name lethal_company)
 (synopsis "Make lethal company modpack")
 (description "make lethal company modpack")
 (allow_empty)
 (depends
  (ocaml
   (= 4.12.0))
  dune
  async
  core
  jsonaf
  ppx_jane
  ppx_jsonaf_conv
  core_unix))
