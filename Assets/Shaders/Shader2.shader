Shader "Unlit/Shader2"
{
    Properties
    {
       
        _Darkness("Darkness",float) = 1
        _ColourA("Colour A",color ) =(1,1,1,1) 
        _ColourB("Colour B",color ) =(1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            

            #include "UnityCG.cginc"

            
            float _Darkness;
            float4  _ColourA;
            float4 _ColourB;
            
            struct MeshData
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normals : NORMAL;
            };

            struct Interpolator
            {
                float2 uv : TEXCOORD0;
              
                float4 vertex : SV_POSITION;
                float3 normals :TEXCOORD1;
                
                
            };
            

            

            Interpolator vert (MeshData v)
            {
                Interpolator o;
                o.uv = v.uv;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normals = UnityObjectToWorldNormal(v.normals);
                
                
                
                return o;
            }

            fixed4 frag (Interpolator i) : SV_Target
            {
                //green yellow blue with white stripe
               // return float4((i.normals)/(i.normals.zyx),1);

                // Cool Apache kinda logo 
                //return float4(-log(i.normals),1);

                // Gradient from light to dark at the top then at the bottom
                //return float4(abs(float3(1,1,1)/i._Darkness*i.uv.yyy),1);

                float4 outColor=lerp(_ColourA,_ColourB,i.uv.x);
                
                return outColor;
            }
            
            ENDCG
        }
    } 
}
