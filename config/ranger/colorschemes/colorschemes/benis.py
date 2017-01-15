from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
	def use(self, context):
		fg, bg, attr = default_colors

		if context.reset:
			return default_colors

		elif context.in_browser:
			if context.selected:
				attr = reverse
			else:
				attr = normal
			if context.empty or context.error:
				attr |= bold
				bg = red
				fg = black
			if context.border:
				attr |= bold
				fg = black
			if context.media:
				if context.image:
					fg = white
				else:
					fg = red
			if context.container:
				attr |= bold
				fg = white
			if context.directory:
				attr |= bold
				fg = blue
			elif context.executable and not \
					any((context.media, context.container,
						context.fifo, context.socket)):
				attr |= bold
				fg = red
			if context.socket:
				fg = magenta
			if context.fifo or context.device:
				fg = black
				if context.device:
					attr |= normal
			if context.link:
				fg = context.good and cyan or magenta
			if context.tag_marker and not context.selected:
				attr |= bold
				if fg in (red, magenta):
					fg = white
				else:
					fg = red
			if not context.selected and (context.cut or context.copied):
				fg = white
				attr |= bold
			if context.main_column:
				if context.selected:
					attr |= normal
				if context.marked:
					attr |= bold
					fg = red
			if context.badinfo:
				if attr & reverse:
					bg = magenta
				else:
					fg = magenta

		elif context.in_titlebar:
			attr |= bold
			if context.hostname:
				attr |= bold
				fg = context.bad and black or black
			elif context.directory:
				fg = cyan
			elif context.tab:
				if context.good:
					bg = green
			elif context.link:
				fg = cyan

		elif context.in_statusbar:
			if context.permissions:
				if context.good:
					attr |= bold
					fg = cyan
				elif context.bad:
					fg = magenta
			if context.marked:
				attr |= bold | reverse
				fg = white
			if context.message:
				if context.bad:
					attr |= bold
					fg = red

		if context.text:
			if context.highlight:
				attr |= reverse

		if context.in_taskview:
			if context.title:
				fg = blue

			if context.selected:
				attr |= reverse

		return fg, bg, attr
