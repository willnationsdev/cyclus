tool
extends HSplitContainer

func _ready():
	var root = $SkillTree.create_item()
	$SkillTree.set_hide_root(true)
	var child1 = $SkillTree.create_item(root)
	var child2 = $SkillTree.create_item(root)
	var subchild1 = $SkillTree.create_item(child1)
	subchild1.set_text(0, "Subchild1")
