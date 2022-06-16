extends Node2D

# NOTE: The dotted-line.png was reimported with repeat enabled. Select
# the image in the file explorer, click the Import tab at top left, set
# the Repeat flag to Enabled and Reimport.

func AdjustDottedLineSize(x2 = 0.0, y2 = 0.0, w2 = 0.0, h2 = 0.0):
	$Sprite.region_rect = Rect2(x2, y2, w2, h2)

func Rotate(rads):
	$Sprite.rotate(90 + rads)
