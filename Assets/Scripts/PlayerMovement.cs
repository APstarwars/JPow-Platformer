using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public CharacterController2D controller;
    public Animator animator;
    public CircleCollider2D feet;
    public PolygonCollider2D McInnesSlope;
    public PhysicsMaterial2D slippery;
    public PhysicsMaterial2D sticky;

    public float runSpeed = 40f;

    float horizontalMove = 0f;
    bool jump = false;

    // Update is called once per frame
    void Update()
    {
        horizontalMove = Input.GetAxisRaw("Horizontal") * runSpeed;

        animator.SetFloat("Speed", Mathf.Abs(horizontalMove));

        if (Input.GetButtonDown("Jump"))
        {
            jump = true;
        }

        if (feet.IsTouching(McInnesSlope))
        {
            feet.sharedMaterial = sticky;
        }
        else
        {
            feet.sharedMaterial = slippery;
        }
    }

    void FixedUpdate()
    {
        // Move our character
        controller.Move(horizontalMove * Time.fixedDeltaTime, false, jump);
        jump = false;
    }
}
