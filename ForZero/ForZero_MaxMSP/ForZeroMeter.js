autowatch = 1;

function msg_float(v)
{
    n = parseInt(v * 64.);
    if (v > 0.)
        for (i = 1; i < 8; i++)
        {
            if (n == 0) break;
            n >>= 1;
        }
    else
        i = 0;

	outlet(0,i);
}
