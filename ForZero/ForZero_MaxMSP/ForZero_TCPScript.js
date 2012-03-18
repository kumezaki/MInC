autowatch = 1;

function anything()
{
    a = messagename.split(":");
    script_path = a[1];
    post(script_path+"\n");
    outlet(0,script_path);
}