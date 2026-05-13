/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (place_meeting(x, y, obj_boss))
{
    with (obj_boss)
    {
        hp -= other.damage;

        state_boss = "hit";
    }

    instance_destroy();
}





