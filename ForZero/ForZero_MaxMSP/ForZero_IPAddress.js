autowatch = 1;

outlets = 2;

gCount = 0;

function clear()
{
    gCount = 0;
}

function append(v)
{
    if (gCount++ == 1)
    {
        post(v+"\n");
        outlet(0,v);
        a = v.split(".")
        a[3] = 255;
        b = a[0]+"."+a[1]+"."+a[2]+"."+a[3];
        post(b+"\n");
        outlet(1,b);
    }
}