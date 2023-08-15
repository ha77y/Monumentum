using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AimScript : MonoBehaviour
{
    public bool aiming;
    private Material shaderMat;
    public float t;
    private float interpTime;

    public float defaultWidth = 0.1f;
    public float aimingWidth = 0.2f;
    public float defaultSize = 1f;
    public float aimingSize =0.4f;

    private void Start()
    {
        shaderMat = this.gameObject.GetComponent<MeshRenderer>().material;
    }

    void Update()
    {
        if (interpTime < 1 && aiming){
            interpTime += Time.deltaTime / t;
        }

        if (interpTime > 0 && !aiming) {
            interpTime -= Time.deltaTime / t;
        }
        
        shaderMat.SetFloat("_width", Mathf.Lerp(defaultWidth, aimingWidth,interpTime ));
        shaderMat.SetFloat("_size", Mathf.Lerp(defaultSize, aimingSize,interpTime ));




        if (Input.GetKeyDown(KeyCode.Space)) {
            if (aiming) {
                aiming = false;
            }else {
                aiming = true;
            }
        }
    }

}


   
