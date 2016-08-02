from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
        '''Create an object in which context colors are defined.
        Most things here are self-explanatory.'''
	def use(self, context):
		fg, bg, attr = default_colors
		if context.reset:
			return default_colors

		elif context.in_browser:
			if context.selected:
				attr = bold
			else:
                                fg = white
				attr = normal
			if context.empty or context.error:
				fg = black
			if context.border:
				attr = bold
				fg = black
			if context.media:
				if context.image:
					fg = white
				elif context.audio:
                                        fg = cyan
                                elif context.video:
                                        fg = yellow
                                else:
					fg = white
			if context.container:
				attr |= normal
				fg = green
			if context.directory:
				attr |= normal
				fg = red
			elif context.executable and not \
					any((context.media, context.container,
						context.fifo, context.socket)):
				attr |= normal
				fg = green
			if context.socket:
				fg = red
			if context.fifo or context.device:
				fg = yellow
				if context.device:
					attr |= bold
			if context.link:
				fg = context.good and blue
			if context.tag_marker and not context.selected:
				attr |= bold
				if fg in (red, white):
					fg = black
				else:
					fg = green
			if not context.selected and (context.cut or context.copied):
				fg = red
				attr |= bold
			if context.main_column:
				if context.selected:
					attr |= normal
				if context.marked:
					attr |= underline
					fg = white
			if context.badinfo:
				if attr & reverse:
					bg = red
				else:
					fg = red

		elif context.in_titlebar:
			attr |= normal
			if context.hostname:
				attr |= normal
				fg = default
			elif context.directory:
				fg = blue
			elif context.tab:
				if context.good:
					bg = green
			elif context.link:
				fg = magenta

		elif context.in_statusbar:
			if context.permissions:
				if context.good:
					fg = white
				elif context.bad:
					fg = red
			if context.marked:
				attr |= bold | reverse
				fg = yellow
			if context.message:
				if context.bad:
					attr |= bold
					fg = red

		if context.text:
			if context.highlight:
				attr |= bold

		if context.in_taskview:
			if context.title:
				fg = red

			if context.selected:
				attr |= normal

		return fg, bg, attr
