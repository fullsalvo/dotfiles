def inline_code(_, _, _, str)
  str.gsub(/(`.+?`)/, "\x033\\1\x03")
end

def weechat_init
  Weechat.register('inline_code', 'ajimu', '0.0.1', 'GPLv3', 'Color strings wrapped in `` in green.', '', '')
  Weechat.hook_modifier('input_text_for_buffer', 'inline_code', '')
end
