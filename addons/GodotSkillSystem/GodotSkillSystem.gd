tool
extends EditorPlugin

# Icons
var EffectIcon              = preload("res://addons/GodotSkillSystem/Textures/GDSkills_EffectIcon.png")
var TargetingMethodIcon     = preload("res://addons/GodotSkillSystem/Textures/GDSkills_TargetingMethodIcon.png")
var ElementIcon             = preload("res://addons/GodotSkillSystem/Textures/GDSkills_ElementIcon.png")
var SkillIcon               = preload("res://addons/GodotSkillSystem/Textures/GDSkills_SkillIcon.png")
var SkillTestResultIcon     = preload("res://addons/GodotSkillSystem/Textures/GDSkills_SkillTestResultIcon.png")
var SkillFormIcon           = preload("res://addons/GodotSkillSystem/Textures/GDSkills_SkillFormIcon.png")
var SkillPackIcon           = preload("res://addons/GodotSkillSystem/Textures/GDSkills_SkillPackIcon.png")
var SkillUserIcon           = preload("res://addons/GodotSkillSystem/Textures/GDSkills_SkillUserIcon.png")
var SkillSystemIcon         = preload("res://addons/GodotSkillSystem/Textures/GDSkills_SkillSystemIcon.png")

# Scripts
var Effect                  = preload("res://addons/GodotSkillSystem/API/Effect.gd")
var TargetingMethod         = preload("res://addons/GodotSkillSystem/API/TargetingMethod.gd")
var Element                 = preload("res://addons/GodotSkillSystem/API/Element.gd")
var Skill                   = preload("res://addons/GodotSkillSystem/API/Skill.gd")
var SkillTestResult         = preload("res://addons/GodotSkillSystem/API/SkillTestResult.gd")
var SkillForm               = preload("res://addons/GodotSkillSystem/API/SkillForm.gd")
var SkillPack               = preload("res://addons/GodotSkillSystem/API/SkillPack.gd")
var SkillUser               = preload("res://addons/GodotSkillSystem/API/SkillUser.gd")
var SkillSystem             = preload("res://addons/GodotSkillSystem/API/SkillSystem.gd")

var skillSystemTool

func has_main_screen():
	return true

func get_name():
	return "Skills"

func _enter_tree():
	add_custom_type("TargetingMethod", "Node", TargetingMethod, TargetingMethodIcon)
	add_custom_type("SkillForm",       "Node", SkillForm,       SkillFormIcon)
	add_custom_type("SkillUser",       "Node", SkillUser,       SkillUserIcon)
	add_custom_type("SkillSystem",     "Node", SkillSystem,     SkillSystemIcon)

	skillSystemTool = preload("res://addons/GodotSkillSystem/SkillSystemTool.tscn").instance()
	get_editor_viewport().add_child(skillSystemTool)

func _exit_tree():
	remove_custom_type("TargetingMethod")
	remove_custom_type("SkillForm")
	remove_custom_type("SkillUser")
	remove_custom_type("SkillSystem")

	get_editor_viewport().remove_child(skillSystemTool)
	skillSystemTool.queue_free()
