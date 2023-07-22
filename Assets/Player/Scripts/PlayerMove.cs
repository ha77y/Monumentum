using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Unity.Physics;

public class PlayerMove : MonoBehaviour
{

    Vector2 currentMoveInput;
    Vector3 currentMove;
    bool isMovePressed;

    private Rigidbody RB;
    public float JumpHeight;
     PlayerActions Actions;

    // Start is called before the first frame update

    private void Awake()
    {
        Actions = new PlayerActions();

        Actions.PlayerMap.Move.started += context => { 
            currentMoveInput = context.ReadValue<Vector2>();
            currentMove.x = currentMoveInput.x;
            currentMove.z = currentMoveInput.y;
            isMovePressed = currentMoveInput.x != 0 || currentMoveInput.y != 0;
        };
    }

    void Start()
    {

        RB = this.gameObject.GetComponent<Rigidbody>();    

        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            RB.AddForce(Vector3.up * JumpHeight);
        }


        

    }

    private void OnEnable()
    {
        Actions.PlayerMap.Move.Enable();
        Actions.PlayerMap.Jump.Enable();
    }

    private void OnDisable()
    {
        Actions.PlayerMap.Move.Disable();
        Actions.PlayerMap.Jump.Disable();
    }
}
