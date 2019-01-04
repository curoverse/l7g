cwlVersion: v1.0
class: CommandLineTool
label: Check tile library for correct formatting and spurious characters
$namespaces:
  arv: "http://arvados.org/cwl#"
requirements:
  - class: DockerRequirement
    dockerPull: arvados/l7g
  - class: ResourceRequirement
    coresMin: 1
  - class: InlineJavascriptRequirement
  - class: arv:RuntimeConstraints
    keep_cache: 10000

baseCommand: bash

inputs:
  script:
    type: File
    label: Master script to run validation
    inputBinding:
      position: 1
  sglfDir:
    type: Directory
    label: Tile library directory
    inputBinding:
      position: 2
  outFileName:
    type: string
    label: Name of output file
    inputBinding:
      position: 3

outputs:
  result:
    type: Directory
    label: Directory of sglf validation logs
    outputBinding:
      glob: "."
