using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DialogueManager : MonoBehaviour
{
    public SpriteRenderer textBox;
    public Text nameText;
    public Text dialogueText;

    private Queue<string> sentences;
    public bool speaking = false;

    // Start is called before the first frame update
    void Start()
    {
        sentences = new Queue<string>();
    }

    public void StartDialogue (Dialogue dialogue)
    {
        Debug.Log("Starting Conversation with " + dialogue.name);
        speaking = true;
        textBox.enabled = true;
        nameText.enabled = true;
        dialogueText.enabled = true;

        nameText.text = dialogue.name;
        sentences.Clear();
        foreach (string sentence in dialogue.sentences)
        {
            sentences.Enqueue(sentence);
        }
        DisplayNextSentence();
    }

    public void DisplayNextSentence ()
    {
        if (sentences.Count == 0)
        {
            EndDialogue();
            return;
        }

        string sentence = sentences.Dequeue();
        dialogueText.text = sentence;
    }

    void EndDialogue()
    {
        Debug.Log("End of Conversation");
        speaking = false;
        dialogueText.enabled = false;
        nameText.enabled = false;
        dialogueText.enabled = false;
    }
}
