#include <linux/module.h>
#include <linux/export-internal.h>
#include <linux/compiler.h>

MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};



static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x122c3a7e, "_printk" },
	{ 0x921b07b1, "__cpu_online_mask" },
	{ 0xf6e4df71, "on_each_cpu_cond_mask" },
	{ 0x47e64c59, "module_layout" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "B305B9FA0E18DBB2EB9AD24");
