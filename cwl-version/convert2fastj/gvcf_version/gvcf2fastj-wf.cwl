$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: Workflow
label: Convert gVCFs to FastJ
requirements:
  DockerRequirement:
    dockerPull: arvados/l7g
  ScatterFeatureRequirement: {}
hints:
  arv:RuntimeConstraints:
    keep_cache: 4096
inputs:
  gvcfdir:
    type: Directory
    label: Input gVCF directory
  ref:
    type: string
    label: Reference genome
  reffa:
    type: File
    label: Reference genome in FASTA format
  afn:
    type: File
    label: Compressed assembly fixed width file
  aidx:
    type: File
    label: Assembly index file
  tagset:
    type: File
    label: Compressed tagset in FASTA format
  chroms:
    type: string[]
    label: Chromosomes to analyze

outputs:
  fjdirs:
    type: Directory[]
    label: Output FastJ directories
    outputSource: gvcf2fastj/fjdir

steps:
  getfiles:
    run: getfiles.cwl
    in:
      gvcfdir: gvcfdir
    out: [gvcfs]

  gvcf2fastj:
    run: gvcf2fastj.cwl
    scatter: gvcf
    in:
      gvcf: getfiles/gvcfs
      ref: ref
      reffa: reffa
      afn: afn
      aidx: aidx
      tagset: tagset
      chroms: chroms
    out: [fjdir]
