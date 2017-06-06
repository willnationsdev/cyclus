# This class displays information about a player including...
# 1. Selected character's profile image
# 2. thumbnails of skills that have been selected for use in battle (in local multiplayer)
# OR card displays of skills that have been selected for use in battle (in online multiplayer)

# Another option is to a PocketTanks-esque skill selection.
# That way we just have one screen for it. This may be better for Cyclus since the project
# is small-scale enough that we won't have many skills. Plus, if we do it that way, there won't
# be any need for serializing data in the first place as players will just quickly select the skills
# they want to use prior to starting the match.
# Maybe a I-pick-you-pick setup where people spend a finite number of resources to select skills
# associated with a cost.
# Think LoL / DOTA where people have 2/3 main skills, a utility skill, and a "super" skill, etc.
# We WOULD still need to serialize the data associated with each individual skill, but that's another
# issue.

extends Container

func _ready():
	pass

