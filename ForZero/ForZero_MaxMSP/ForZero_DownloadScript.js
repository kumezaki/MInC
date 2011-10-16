autowatch = 1;

gScriptFilename = "fz_download_script1.sh";

function anything()
{
    a = messagename.split(":");
    script_path = a[1]+gScriptFilename;
    post(script_path+"\n");
    outlet(0,script_path);
}