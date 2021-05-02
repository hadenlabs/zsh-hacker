import * as path from 'path'

import { PlopGenerator } from 'plop'
import { folderExists } from '../utils'

export enum PackagePromptNames {
  'PackageName' = 'PackageName'
}

const packagePath = path.join(__dirname, '../../../pkg')
const containerPath = `${packagePath}/{{lowerCase ${PackagePromptNames.PackageName}}}`

export const packageGenerator: PlopGenerator = {
  description: 'add an package',
  prompts: [
    {
      type: 'input',
      name: PackagePromptNames.PackageName,
      message: 'What should it be called?',
      default: 'tool',
      validate: (value) => {
        if (/.+/.test(value)) {
          return folderExists(value) ? 'A package with this name already exists' : true
        }

        return 'The name is required'
      }
    }
  ],
  actions: [
    {
      type: 'add',
      templateFile: './package/base.zsh.hbs',
      path: `${containerPath}/base.zsh`,
      abortOnFail: true
    },
    {
      type: 'add',
      templateFile: './package/main.zsh.hbs',
      path: `${containerPath}/main.zsh`,
      abortOnFail: true
    },
    {
      type: 'add',
      templateFile: './package/linux.zsh.hbs',
      path: `${containerPath}/linux.zsh`,
      abortOnFail: true
    },
    {
      type: 'add',
      templateFile: './package/osx.zsh.hbs',
      path: `${containerPath}/osx.zsh`,
      abortOnFail: true
    },
    {
      type: 'append',
      templateFile: './package/main.append.hbs',
      path: `${packagePath}/main.zsh`,
      abortOnFail: true
    }
  ]
}
