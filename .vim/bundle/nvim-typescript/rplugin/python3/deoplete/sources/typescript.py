#! /usr/bin/env python3
import re
from deoplete.source.base import Base


class Source(Base):

    # Base options
    def __init__(self, vim):
        Base.__init__(self, vim)
        self.name = "typescript"
        self.mark = self.vim.vars['nvim_typescript#completion_mark']
        self.rank = 1000
        self.min_pattern_length = 1
        self.max_abbr_width = 0
        self.max_kind_width = 0
        self.max_menu_width = 0
        # self.input_pattern = r'.'
        self.input_pattern = r'\.|\"\\|\s|\/|\@'
        # self.input_pattern = r'(\.|::)\w*'
        self.filetypes = ["typescript", "tsx",
                          "typescript.tsx", "typescriptreact"]
        if self.vim.vars["nvim_typescript#javascript_support"]:
            self.filetypes.extend(["javascript", "jsx", "javascript.jsx"])
        if self.vim.vars["nvim_typescript#vue_support"]:
            self.filetypes.extend(["vue"])

    def log(self, message):
        self.debug('************')
        self.vim.out_write('{} \n'.format(message))
        self.debug('************')

    def get_complete_position(self, context):
        m = re.search(r"\w*$", context["input"])
        return m.start() if m else -1

    def reset_var(self):
        self.vim.vars["nvim_typescript#completion_res"] = []

    def gather_candidates(self, context):
        try:
            if context["is_async"]:
                res = self.vim.vars["nvim_typescript#completion_res"]
                if res:
                    context["is_async"] = False
                    self.reset_var()
                    return res
            else:
                context["is_async"] = True
                offset = context["complete_position"] + 1
                prefix = context["complete_str"]
                self.reset_var()
                self.vim.funcs.TSDeoplete(prefix, offset)
            return []
        except BaseException:
            return []
