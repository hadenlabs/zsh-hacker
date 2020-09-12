import packageGenerator from './package/index'

import { hyphenate } from './helpers'

export = (plop: any) => {
  plop.setHelper('hyphenate', hyphenate)
  plop.setGenerator('package', packageGenerator)
}
