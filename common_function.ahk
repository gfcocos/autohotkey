CopySelection()
{
    clipboard =
    send ^c 
    ClipWait, 1
    if ErrorLevel
    {
        ;MsgBox, The attempt to copy text onto the clipboard failed.
        return
    }
    return clipboard
}