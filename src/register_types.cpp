#include "register_types.hpp"
#include <gdextension_interface.h>
#include <godot_cpp/core/defs.hpp>
#include <godot_cpp/godot.hpp>
#include "gdexample.hpp"

using namespace godot;

void initialize_gdextension_module(ModuleInitializationLevel p_level) {
	if (p_level != MODULE_INITIALIZATION_LEVEL_SCENE) return;
	GDREGISTER_RUNTIME_CLASS(GDExample);
}

void uninitialize_gdextension_module(ModuleInitializationLevel p_level) {
	if (p_level != MODULE_INITIALIZATION_LEVEL_SCENE) return;
}

extern "C" {

GDExtensionBool GDE_EXPORT gdextension_init(
	GDExtensionInterfaceGetProcAddress p_get_proc_address,
	const GDExtensionClassLibraryPtr p_library,
	GDExtensionInitialization *r_initialization
) {
	godot::GDExtensionBinding::InitObject init_obj(p_get_proc_address, p_library, r_initialization);
	init_obj.register_initializer(initialize_gdextension_module);
	init_obj.register_terminator(uninitialize_gdextension_module);
	init_obj.set_minimum_library_initialization_level(MODULE_INITIALIZATION_LEVEL_SCENE);
	return init_obj.init();
}

}