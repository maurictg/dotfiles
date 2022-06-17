#!/bin/bash
cleanup() {
	pacman -Rs $(pacman -Qdtq)
	yay -Scc
}
