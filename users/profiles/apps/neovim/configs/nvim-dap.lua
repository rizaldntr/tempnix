local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = '~/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py',  -- NOTE: Adapt path to manage.py as needed
  pythonPath = function()
      local venv = os.getenv("VIRTUAL_ENV")
      if vim.fn.executable(venv .. '/bin/python') == 1 then
        return venv .. '/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  args = {'runserver', '--noreload'},
}


