if (time > 0)
{
	res_i();
	
	i1=[79/2,365/2];
	draw_ext(sFightBack,0,i1[0],i1[1],0.5,0.5,,,image_alpha);
	
	i=0;
	repeat (array_length(op.party))
	{
		if (go[i])
		{
			res_j(); j=op.party[i]._numberExistence; j1=[0,0];
			
			variant_fightheads();
			
			j1[0]/=2; j1[1]/=2;
			draw_ext(sFight,j*2,i1[0],i1[1]+19*i,0.5,0.5,,,image_alpha,bright);
			draw_ext(sFight,1+j*2,i1[0],i1[1]+19*i,0.5,0.5,,,image_alpha);
			draw_ext(sFightBack,1,i1[0]-33/2,i1[1]+19*i,0.5,0.5,,,image_alpha);
			
			draw_ext(op.party[i]._UIface,1,i1[0]+j1[0]-35,i1[1]+j1[1]+5+19*i,0.5,0.5,,,image_alpha);
			
			
			
			if (stickOffset[i] >= 0)
			{
				draw_ext(sPixel,0,stickX[i],i1[1]+19*i,3,19);
				
				if (stickOffset[i] == 0)
				{
					//if the stick is past the target the damage stats lowering faster
					if (stickX[i] >= 42) { accuracy=42/stickX[i]; }else{ accuracy=stickX[i]/(42*2); }
					
					//print(accuracy,stickX[i],i1[1]+19*i,,,,0.5,0.5,,c_red);
				}
			}
		}
		++i;
	}
}