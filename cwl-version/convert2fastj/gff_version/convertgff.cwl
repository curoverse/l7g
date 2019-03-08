$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"
cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: DockerRequirement
    dockerPull: arvados/l7g
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 2
    coresMax: 2
hints:
  arv:RuntimeConstraints:
    keep_cache: 4096
baseCommand: bash
inputs:
  bashscript:
    type: File
    default:
      class: File
      location: src/convert2fastjCWL
    inputBinding:
      position: 1
  gffInitial: 
    type: File
    inputBinding:
      position: 2
  ref:
    type: string
    inputBinding:
      position: 3
  reffa: 
    type: File
    inputBinding:
      position: 4
  afn:
    type: File
    inputBinding:
      position: 5
  aidx:
    type: File
    inputBinding:
      position: 6
  refM:
    type: string
    inputBinding:
      position: 7
  reffaM:
    type: File
    inputBinding:
      position: 8
  afnM:
    type: File
    inputBinding:
      position: 9
  aidxM:
    type: File
    inputBinding:
      position: 10
  seqidM:
    type: string 
    inputBinding:
      position: 11
  tagdir:
    type: File
    inputBinding:
      position: 12
  l7g:
    type: string
    default: "/usr/local/bin/l7g"
    inputBinding:
      position: 13
  pasta:
    type: string
    default: "/usr/local/bin/pasta"
    inputBinding:
      position: 14
  refstream:
    type: string
    default: "/usr/local/bin/refstream"
    inputBinding:
      position: 15
outputs:
  out1:
    type: Directory[]
    outputBinding:
      glob: "stage/*"
  out2:
    type: File[]
    outputBinding:
      glob: "cleaned/*.gz*"
