import { folderExists } from '../utils'

export = {
  description: 'Add a package',
  prompts: [
    {
      type: 'input',
      name: 'name',
      message: 'What should it be called?',
      validate: (value: string) => {
        if (!value || value.length === 0) {
          return 'name is required'
        }

        return folderExists(value) ? `folder already exists (${value})` : true
      },
    },
  ],
  actions: (data: any) => {
    const path: string[] = data.name.split('/')

    data.packageName = path.pop()
    data.basePath = '../../package/' + path.join('/')

    const actions: any[] = [
      {
        type: 'add',
        path: '{{basePath}}/{{lowerCase packageName}}/{{lowerCase packageName}}.zsh',
        templateFile: './package/base.zsh.hbs',
        abortOnFail: true,
      },
      {
        type: 'add',
        path: '{{basePath}}/{{lowerCase packageName}}/{{lowerCase packageName}}.zsh',
        templateFile: './package/main.zsh.hbs',
        abortOnFail: true,
      },
    ]

    return actions
  },
}
