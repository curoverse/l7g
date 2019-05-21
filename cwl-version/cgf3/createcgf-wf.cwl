$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: Workflow
label: Creates a cgf for each FastJ file
requirements:
  DockerRequirement:
    dockerPull: arvados/l7g
  ScatterFeatureRequirement: {}
hints:
  cwltool:LoadListingRequirement:
    loadListing: shallow_listing

inputs:
  fjdir:
    type: Directory
    label: Input directory of FastJs
  lib:
    type: Directory
    label: Tile library directory

outputs:
  cgfs:
    type: File[]
    label: Output cgfs
    outputSource: createcgf/cgf

steps:
  getdirs:
    run: getdirs.cwl
    in:
      fjdir: fjdir
    out: [fjdirs]

  createcgf:
    run: createcgf.cwl
    scatter: fjdir
    in:
      fjdir: getdirs/fjdirs
      lib: lib
    out: [cgf]