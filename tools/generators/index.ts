import { NodePlopAPI } from "plop"
import { packageGenerator } from "./package"
import { hyphenate } from "./helpers"

export default function main(plop: NodePlopAPI) {
  plop.setWelcomeMessage("Welcome zsh hacker.")
  plop.setHelper("hyphenate", hyphenate)
  plop.setGenerator("package", packageGenerator)
}
