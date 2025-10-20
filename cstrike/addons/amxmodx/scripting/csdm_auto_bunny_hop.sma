#include <amxmodx>
#include <reapi>

#define PLUGIN  "[CSDM] Auto Bunny Hop"
#define VERSION "1.0"
#define AUTHOR  "DadoDz"

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    RegisterHookChain(RG_CBasePlayer_Jump, "OnPlayerJump", false);
}

public OnPlayerJump(id)
{
    if (!is_user_alive(id))
        return HC_CONTINUE;

    if (get_entvar(id, var_flags) & FL_ONGROUND)
    {
        new Float:velocity[3];
        get_entvar(id, var_velocity, velocity);
        velocity[2] = 250.0;

        set_entvar(id, var_velocity, velocity);
        set_entvar(id, var_gaitsequence, 6);
        set_entvar(id, var_frame, 0.0);
    }

    return HC_CONTINUE;
}